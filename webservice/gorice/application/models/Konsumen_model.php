<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Konsumen_model extends CI_Model
{
	private $_table = "tb_konsumen";

	public $id_konsumen;
	public $fullname_konsumen;
	public $email_konsumen;
	public $password_konsumen;		
	public $nohp_konsumen;	
	public $alamat_konsumen;
	public $photo_konsumen;
	public $created_at;

	public function rules()
	{
		return [
			 ['field' => 'fullname_konsumen',
			 'label' => 'Fullname',
			 'rules' => 'required'],

			 ['field' => 'nohp_konsumen',
			 'label' => 'No. HP',
			 'rules' => 'required'],

			 ['field' => 'email_konsumen',
			 'label' => 'Email',
			 'rules' => 'required'],

			 ['field' => 'password_konsumen',
			 'label' => 'Password',
			 'rules' => 'required'],

			 ['field' => 'alamat_konsumen',
			 'label' => 'Alamat',
			 'rules' => 'required'],

			];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_konsumen" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->fullname_konsumen = $post["fullname_konsumen"];
		$this->email_konsumen = $post["email_konsumen"];
		$this->password_konsumen = MD5($post["password_konsumen"]);
		$this->nohp_konsumen = $post["nohp_konsumen"];
		$this->alamat_konsumen = $post["alamat_konsumen"];
		$this->photo_konsumen = $this->_uploadImage();
		// $this->created_at = $post["created_at"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_konsumen = $post["id"];
		$this->fullname_konsumen = $post["fullname_konsumen"];
		$this->email_konsumen = $post["email_konsumen"];
		$this->password_konsumen = MD5($post["password_konsumen"]);		
		$this->nohp_konsumen = $post["nohp_konsumen"];
		$this->alamat_konsumen = $post["alamat_konsumen"];

		if(!empty($_FILES["photo_konsumen"]["name"])){
			$this->photo_konsumen = $this->_uploadImage();
		} else {
			$this->photo_konsumen = $post["old_image"];
		}

		return $this->db->update($this->_table, $this, array('id_konsumen' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_konsumen" => $id));
	}

	public function _uploadImage()
	{
		$config['upload_path'] = './upload/konsumen/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = true;
		$config['max_size'] = 1024;

		$this->load->library('upload', $config);
		if($this->upload->do_upload('photo_konsumen')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}

	private function _deleteImage($id)
	{
		$konsumen = $this->getById($id);
		if($konsumen->photo_konsumen != 'default.jpg'){
			$filename = explode(".", $konsumen->photo_konsumen)[0];
			return array_map('unlink', glob(FCPATH."upload/konsumen/$filename.*"));
		}
	}
}