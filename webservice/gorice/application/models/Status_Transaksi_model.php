<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Status_Transaksi_model extends CI_Model
{
	private $_table="tb_status_transaksi";

	public $id_status_transaksi;
	public $status_transaksi;
	public $keterangan;
	
	public function rules()
	{
	return [
	   ['field' => 'status_transaksi',
	   'label' => 'Status Transaksi',
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
		return $this->db->get_where($this->_table, ["id_status_transaksi" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->status_transaksi = $post["status_transaksi"];
		$this->keterangan = $post["keterangan"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_status_transaksi = $post["id"];
		$this->status_transaksi = $post["status_transaksi"];
		$this->keterangan = $post["keterangan"];

		return $this->db->update($this->_table, $this, array('id_status_transaksi' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_status_transaksi" => $id));
	}
}