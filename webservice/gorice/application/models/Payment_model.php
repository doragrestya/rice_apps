<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Payment_model extends CI_Model
{
	private $_table="tb_payment";
	public $id_payment;
	public $nama_payment;
	public $no_rek;
	
	public function rules()
	{
	return [
	   ['field' => 'nama_payment',
	   'label' => 'Nama Payment',
	   'rules' => 'required'],

	 ];
	}

	public function getAll()
	{
		return $this->db->get($this->_table)->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_payment" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->nama_payment = $post["nama_payment"];
		$this->no_rek = $post["no_rek"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_payment = $post["id"];
		$this->nama_payment = $post["nama_payment"];
		$this->no_rek = $post["no_rek"];

		return $this->db->update($this->_table, $this, array('id_payment' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_payment" => $id));
	}
	
}