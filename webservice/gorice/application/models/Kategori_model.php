<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori_model extends CI_Model
{
	private $_table="tb_kategori";

	public $id_kategori;
	public $nama_kategori;
	public $keterangan;
	public $icon_kategori = "default.jpg";
	
	public function rules()
	{
	return [
	   ['field' => 'nama_kategori',
	   'label' => 'Nama Kategori',
	   'rules' => 'required'],

	    ['field' => 'keterangan',
	   'label' => 'Keterangan',
	   'rules' => 'required'],
	 ];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_kategori" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->nama_kategori = $post["nama_kategori"];
		$this->keterangan = $post["keterangan"];
		$this->icon_kategori = $this->_uploadImage();
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_kategori = $post["id"];
		$this->nama_kategori = $post["nama_kategori"];
		$this->keterangan = $post["keterangan"];

		if(!empty($_FILES["icon_kategori"]["name"])){
			$this->icon_kategori = $this->_uploadImage();
		} else {
			$this->icon_kategori = $post["old_image"];
		}

		return $this->db->update($this->_table, $this, array('id_kategori' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_kategori" => $id));
	}

	private function _uploadImage()
	{
		$config['upload_path'] = './upload/kategori/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = true;
		$config['max_size'] = 1024; //1MB
		//$config['max_width'] = 1024;
		//$config['max_height'] = 768;

		$this->load->library('upload', $config);

		if($this->upload->do_upload('icon_kategori')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}

	private function _deleteImage($id)
	{
		$kategori = $this->getById($id);
		if($kategori->icon_kategori != 'default.jpg') {
			$filename = explode(".", $kategori->icon_kategori)[0];
			return array_map('unlink', glob(FCPATH."upload/kategori/$filename.*"));
		}
	}
}