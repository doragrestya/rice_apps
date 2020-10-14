<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Product_model extends CI_Model
{
	private $_table="tb_produk";
	private $tbkategori="tb_kategori";
	private $tbkonsumen="tb_konsumen";
	private $tbsatuan="tb_satuan";

	public $id_produk;
	public $nama_produk;
	public $harga_produk;
	public $stok_produk;
	public $gambar_produk = "default.jpg";
	public $detail_produk;
	public $total_jual;
	public $id_kategori;
	public $id_konsumen;
	public $id_satuan;

	
	public function rules()
	{
	return [
	   ['field' => 'nama_produk',
	   'label' => 'Nama Produk',
	   'rules' => 'required'],

	    ['field' => 'harga_produk',
	   'label' => 'Harga Produk',
	   'rules' => 'numeric'],

	    ['field' => 'stok_produk',
	   'label' => 'Stok Produk',
	   'rules' => 'numeric'],

	    ['field' => 'detail_produk',
	   'label' => 'Detail Produk',
	   'rules' => 'required'],
	 ];
	}

	public function getAll()
	{
		// return $this->db->get($this->_table)->result();
		$this->db->select('*');
		$this->db->from('tb_produk');
		$this->db->join('tb_kategori', 'tb_kategori.id_kategori = tb_produk.id_kategori');
		$this->db->join('tb_konsumen', 'tb_konsumen.id_konsumen = tb_produk.id_konsumen');
		$this->db->join('tb_satuan', 'tb_satuan.id_satuan = tb_produk.id_satuan');
		$data = $this->db->get();
		return $data->result();
	}

	public function getById($id)
	{
		return $this->db->get_where($this->_table, ["id_produk" => $id])->row();
	}

	public function save()
	{
		$post = $this->input->post();
		$this->nama_produk = $post["nama_produk"];
		$this->harga_produk = $post["harga_produk"];
		$this->stok_produk = $post["stok_produk"];
		$this->gambar_produk = $this->_uploadImage();
		$this->detail_produk = $post["detail_produk"];
		$this->total_jual = $post["total_jual"];
		$this->id_kategori = $post["kategori"];
		$this->id_konsumen = $post["konsumen"];
		$this->id_satuan = $post["satuan"];
		return $this->db->insert($this->_table, $this);
	}

	public function update()
	{
		$post = $this->input->post();
		$this->id_produk = $post["id"];
		$this->nama_produk = $post["nama_produk"];
		$this->harga_produk = $post["harga_produk"];
		$this->stok_produk = $post["stok_produk"];

		if(!empty($_FILES["gambar_produk"]["name"])){
			$this->gambar_produk = $this->_uploadImage();
		} else {
			$this->gambar_produk = $post["old_image"];
		}

		$this->detail_produk = $post["detail_produk"];
		$this->total_jual = $post["total_jual"];
		$this->id_kategori = $post["kategori"];
		$this->id_konsumen = $post["konsumen"];
		$this->id_satuan = $post["satuan"];
		return $this->db->update($this->_table, $this, array('id_produk' => $post['id']));
	}

	public function delete($id)
	{
		$this->_deleteImage($id);
		return $this->db->delete($this->_table, array("id_produk" => $id));
	}

	private function _uploadImage()
	{

		$config['upload_path'] = './upload/product/';
		$config['allowed_types'] = 'gif|jpg|png';
		//$config['file_name'] = $this->id_produk;
		$config['overwrite'] = true;
		$config['max_size'] = 1024; //1MB
		//$config['max_width'] = 1024;
		//$config['max_height'] = 768;

		$this->load->library('upload', $config);

		if($this->upload->do_upload('gambar_produk')){
			return $this->upload->data("file_name");
		}
		print_r($this->upload->display_errors());
		return "default.jpg";
	}


	private function _deleteImage($id)
	{
		$product = $this->getById($id);
		if($product->gambar_produk != 'default.jpg') {
			$filename = explode(".", $product->gambar_produk)[0];
			return array_map('unlink', glob(FCPATH."upload/product/$filename.*"));
		}
	}

	public function dd_kategori()
	{
		return $this->db->get($this->tbkategori)->result();
	}

	public function dd_konsumen()
	{
		return $this->db->get($this->tbkonsumen)->result();
	}

	public function dd_satuan()
	{
		return $this->db->get($this->tbsatuan)->result();
	}

}