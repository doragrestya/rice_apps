<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Satuan_model extends CI_Model
{
	private $_table = "tb_satuan";

	public $id_satuan;
	public $nama_satuan;

	public function rules()
	{
		return [
			['field' => 'nama_satuan',
			 'label' => 'Nama Satuan',
			 'rules' => 'required'],
			];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_satuan" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->nama_satuan = $post["nama_satuan"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_satuan= $post["id"];
		$this->nama_satuan = $post["nama_satuan"];

		return $this->db->update($this->_table, $this, array('id_satuan' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_satuan" => $id));
	}

}