<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Keranjang_model extends CI_Model
{
	private $_table = "tb_keranjang";
	private $tbkonsumen = "tb_konsumen";
	private $tbproduk = "tb_produk";
	private $tbstatus = "tb_status_transaksi";

	public $id_keranjang;
	public $id_user;
	public $id_produk;
	public $detail_order;
	public $jumlah_produk;
	public $total_harga_produk;
	public $id_status_transaksi;
	public $created_at;

	public function rules()
	{
		return [
			['field' => 'jumlah_produk',
			 'label' => 'Jumlah Produk',
			 'rules' => 'required'],

			 ['field' => 'total_harga_produk',
			 'label' => 'Total Harga Produk',
			 'rules' => 'required'],
			];
	}

	public function getAll()
	{
		// return $this->db->get($this->_table)->result();
		$this->db->select('*');
		$this->db->from('tb_keranjang');
		$this->db->join('tb_konsumen', 'tb_konsumen.id_konsumen = tb_keranjang.id_user');
		$this->db->join('tb_produk', 'tb_produk.id_produk = tb_keranjang.id_produk');
		$this->db->join('tb_status_transaksi', 'tb_status_transaksi.id_status_transaksi = tb_keranjang.id_status_transaksi');
		$data = $this->db->get();
		return $data->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_keranjang" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->id_user = $post["user"];
		$this->id_produk = $post["produk"];
		$this->jumlah_produk = $post["jumlah_produk"];
		$this->total_harga_produk = $post["total_harga_produk"];
		$this->detail_order = $post["detail_order"];
		$this->id_status_transaksi = $post["id_status_transaksi"];
		// $this->created_at =$post["created_at"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_keranjang = $post["id"];
		$this->jumlah_produk = $post["jumlah_produk"];
		$this->total_harga_produk = $post["total_harga_produk"];
		$this->detail_order = $post["detail_order"];
		$this->id_user = $post["user"];
		$this->id_produk = $post['produk'];
		$this->id_status_transaksi = $post['id_status_transaksi'];

		return $this->db->update($this->_table, $this, array('id_keranjang' => $post['id']));
	}

	public function delete($id)
	{
		return $this->db->delete($this->_table, array("id_keranjang" => $id));
	}

	public function dd_konsumen()
	{
		return $this->db->get($this->tbkonsumen)->result();
	}

	public function dd_produk()
	{
		return $this->db->get($this->tbproduk)->result();
	}

	public function dd_status()
	{
		return $this->db->get($this->tbstatus)->result();
	}



}