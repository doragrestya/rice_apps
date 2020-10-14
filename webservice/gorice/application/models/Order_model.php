<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Order_model extends CI_Model
{
	private $_table = "tb_order";
	private $tbkonsumen = "tb_konsumen";
	private $tbstatus = "tb_status_transaksi";
	private $tbshipping = "tb_shipping";
	private $tbpayment = "tb_payment";

	public $id_order;
	public $tanggal_order;
	public $id_user;
	public $alamat_user;
	public $order_status;
	public $order_total;
	public $id_shipping;
	public $id_payment;
	public $id_checkout;

	public function rules()
	{
		return [
			['field' => 'alamat_user',
			 'label' => 'Alamat User',
			 'rules' => 'required'],
			];
	}

	public function getAll()
	{
		// return $this->db->get($this->_table)->result();
		$this->db->select('*');
		$this->db->from('tb_order');
		$this->db->join('tb_konsumen', 'tb_konsumen.id_konsumen = tb_order.id_user');
		$this->db->join('tb_status_transaksi', 'tb_status_transaksi.id_status_transaksi = tb_order.order_status');
		$this->db->join('tb_shipping', 'tb_shipping.id_shipping = tb_order.id_shipping');
		$this->db->join('tb_payment', 'tb_payment.id_payment = tb_order.id_payment');
		$data = $this->db->get();
		return $data->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_order" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		// $this->tanggal_order = $post["tanggal_order"];
		$this->id_user = $post["user"];
		$this->alamat_user = $post["alamat_user"];
		$this->order_status = $post["status"];
		$this->order_total = $post["order_total"];
		$this->id_shipping = $post["shipping"];
		$this->id_payment = $post["payment"];
		$this->id_checkout =$post["id_checkout"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_order = $post['id'];
		$this->tanggal_order = $post["tanggal_order"];
		$this->id_user = $post["user"];
		$this->alamat_user = $post["alamat_user"];
		$this->order_status = $post["status"];
		$this->order_total = $post["order_total"];
		$this->id_shipping = $post["shipping"];
		$this->id_payment = $post["payment"];
		$this->id_checkout = $post["id_checkout"];

		return $this->db->update($this->_table, $this, array('id_order' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_order" => $id));
	}

	public function dd_konsumen()
	{
		return $this->db->get($this->tbkonsumen)->result();
	}

	public function dd_status()
	{
		return $this->db->get($this->tbstatus)->result();
	}

	public function dd_shipping()
	{
		return $this->db->get($this->tbshipping)->result();
	}
	public function dd_payment()
	{
		return $this->db->get($this->tbpayment)->result();
	}
}