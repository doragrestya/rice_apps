<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Shipping_model extends CI_Model
{
	private $_table="tb_shipping";

	public $id_shipping;
	public $nama_shipping;
	public $detail_shipping;
	
	public function rules()
	{
	return [
	   ['field' => 'nama_shipping',
	   'label' => 'Nama Shipping',
	   'rules' => 'required'],

	    ['field' => 'detail_shipping',
	   'label' => 'Detail Shipping',
	   'rules' => 'required'],
	 ];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_shipping" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->nama_shipping = $post["nama_shipping"];
		$this->detail_shipping = $post["detail_shipping"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_shipping = $post["id"];
		$this->nama_shipping = $post["nama_shipping"];
		$this->detail_shipping = $post["detail_shipping"];

		return $this->db->update($this->_table, $this, array('id_shipping' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_shipping" => $id));
	}
}