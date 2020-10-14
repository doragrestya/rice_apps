<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Konfirmasi_model extends CI_Model
{
	private $_table = "tb_konfirmasi";

	public $id_konfirmasi;
	public $id_checkout;
	public $nama_konsumen;
	public $notelp;		
	public $jumlah_transfer;	
	public $image;
	public $tanggal;

	public function rules()
	{
		return [
			 ['field' => 'nama_konsumen',
			 'label' => 'Nama Konsumen',
			 'rules' => 'required'],

			 ['field' => 'notelp',
			 'label' => 'No. Telp',
			 'rules' => 'required'],

			 ['field' => 'jumlah_transfer',
			 'label' => 'Jumlah Transfer',
			 'rules' => 'required'],
			];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_konfirmasi" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->id_checkout = $post["id_checkout"];
		$this->nama_konsumen = $post["nama_konsumen"];
		$this->notelp = $post["notelp"];
		$this->jumlah_transfer = $post["jumlah_transfer"];
		$this->image = $this->_uploadImage();
		
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_konfirmasi = $post["id"];
		$this->id_checkout = $post["id_checkout"];
		$this->nama_konsumen = $post["nama_konsumen"];
		$this->notelp = $post["notelp"];
		$this->jumlah_transfer = $post["jumlah_transfer"];

		if(!empty($_FILES["image"]["name"])){
			$this->image = $this->_uploadImage();
		} else {
			$this->image = $post["old_image"];
		}

		return $this->db->update($this->_table, $this, array('id_konfirmasi' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_konfirmasi" => $id));
	}

	public function _uploadImage()
	{
		$config['upload_path'] = './upload/transfer/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = true;
		$config['max_size'] = 1024;

		$this->load->library('upload', $config);
		if($this->upload->do_upload('image')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}

	private function _deleteImage($id)
	{
		$konfirmasi = $this->getById($id);
		if($konfirmasi->image != 'default.jpg'){
			$filename = explode(".", $konfirmasi->image)[0];
			return array_map('unlink', glob(FCPATH."upload/transfer/$filename.*"));
		}
	}
}