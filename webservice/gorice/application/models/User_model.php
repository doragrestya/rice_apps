<?php defined('BASEPATH') OR exit('No direct script access allowed');

class User_model extends CI_Model
{
	private $_table = "tb_user";

	public $id_user;
	public $username_user;
	public $fullname_user;
	public $photo_user;		
	public $nohp_user;	
	public $email_user;
	public $password_user;
	public $role;
	public $created_at;
	public $update_at;
	public $last_login;
	public $is_active;

	public function rules()
	{
		return [
			 ['field' => 'username_user',
			 'label' => 'Username',
			 'rules' => 'required'],

			 ['field' => 'fullname_user',
			 'label' => 'Fullname',
			 'rules' => 'required'],

			 ['field' => 'nohp_user',
			 'label' => 'No. HP',
			 'rules' => 'required'],

			 ['field' => 'email_user',
			 'label' => 'Email',
			 'rules' => 'required'],
			];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_user" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->username_user = $post["username_user"];
		$this->fullname_user = $post["fullname_user"];
		$this->photo_user = $this->_uploadImage();
		$this->nohp_user = $post["nohp_user"];
		$this->email_user = $post["email_user"];
		$this->password_user = MD5($post["password_user"]);
		$this->role = $post["role"];
		$this->is_active = $post["is_active"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_user = $post["id"];
		$this->username_user = $post["username_user"];
		$this->fullname_user = $post["fullname_user"];

		if(!empty($_FILES["photo_user"]["name"])){
			$this->photo_user = $this->_uploadImage();
		} else {
			$this->photo_user = $post["old_image"];
		}

		$this->nohp_user = $post["nohp_user"];
		$this->email_user = $post["email_user"];
		$this->password_user = MD5($post["password_user"]);
		$this->role = $post["role"];
		$this->is_active = $post["is_active"];
		return $this->db->update($this->_table, $this, array('id_user' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_user" => $id));
	}

	public function _uploadImage()
	{
		$config['upload_path'] = './upload/user/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['overwrite'] = true;
		$config['max_size'] = 1024;

		$this->load->library('upload', $config);
		if($this->upload->do_upload('photo_user')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}

	private function _deleteImage($id)
	{
		$user = $this->getById($id);
		if($user->photo_user != 'default.jpg'){
			$filename = explode(".", $user->photo_user)[0];
			return array_map('unlink', glob(FCPATH."upload/user/$filename.*"));
		}
	}

	public function doLogin(){
		$post = $this->input->post();

		//cari user berdasarkan email dan username
		$this->db->where('email_user', $post['email'])->or_where('username_user', $post['username']);
		$user = $this->db->get($this->_table)->row();

		//jika user terdaftar
		if($user){
			//periksa passwordnya
			$isPasswordTrue = password_verify($post["password"], $user->password_user);
			//periksa role-nya
			$isAdmin = $user->role == "admin";

			//jika password benar dan dia admin
			if($isPasswordTrue && $isAdmin){
				//login sukses
				$this->session->set_userdata(['user_logged' => $user]);
				$this->_updateLastLogin($user->id_user);
				return true;
			}
		}

		//login gagal
		return false;
	}

	public function isNotLogin(){
		return $this->session->userdata('user_logged') == null;
	}

	private function _updateLastLogin($id_user){
		$sql = "UPDATE {$this->_table} SET last_login=now() WHERE id_user={$id_user}";
		$this->db->query($sql);
	}
}