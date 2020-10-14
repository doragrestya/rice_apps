<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Slider_model extends CI_Model
{
	private $_table="tb_slider";

	public $id_slider;
	public $image_slider = "default.jpg";
	public $keterangan;

	public function rules()
	{
	return [
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
		return $this->db->get_where($this->_table, ["id_slider" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->image_slider = $this->_uploadImage();
		$this->keterangan = $post['keterangan'];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_slider = $post["id"];
	
		if(!empty($_FILES["image_slider"]["name"])){
			$this->image_slider = $this->_uploadImage();
		} else {
			$this->image_slider = $post["old_image"];
		}

		$this->keterangan = $post['keterangan'];

		return $this->db->update($this->_table, $this, array('id_slider' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_slider" => $id));
	}

	private function _uploadImage()
	{
		$config['upload_path'] = './upload/slider/';
		$config['allowed_types'] = 'gif|jpg|png';
		//$config['file_name'] = $this->id_produk;
		$config['overwrite'] = true;
		$config['max_size'] = 1024; //1MB
		//$config['max_width'] = 1024;
		//$config['max_height'] = 768;

		$this->load->library('upload', $config);

		if($this->upload->do_upload('image_slider')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}


	private function _deleteImage($id)
	{
		$slider = $this->getById($id);
		if($slider->image_slider != 'default.jpg') {
			$filename = explode(".", $slider->image_slider)[0];
			return array_map('unlink', glob(FCPATH."upload/slider/$filename.*"));
		}
	}
}