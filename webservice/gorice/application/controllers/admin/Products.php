<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Products extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("product_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["products"] = $this->product_model->getAll();
		$this->load->view("admin/product/list", $data);
	}

	public function add()
	{
		$product = $this->product_model;
		$validation = $this->form_validation;
		$validation->set_rules($product->rules());

		if ($validation->run()) {
			$product->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}

		//panggil dropdownlist
		$data['dd_kategori'] = $this->product_model->dd_kategori();
		$data['dd_konsumen'] = $this->product_model->dd_konsumen();
		$data['dd_satuan'] = $this->product_model->dd_satuan();
		$this->load->view("admin/product/new_form", $data);
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/products');

		$product = $this->product_model;
		$validation = $this->form_validation;
		$validation->set_rules($product->rules());

		if ($validation->run()) {
            $product->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['product'] = $product->getById($id);
		$data['dd_kategori'] = $this->product_model->dd_kategori();
		$data['dd_konsumen'] = $this->product_model->dd_konsumen();
		$data['dd_satuan'] = $this->product_model->dd_satuan();
		if (!$data["product"]) show_404();

		$this->load->view("admin/product/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->product_model->delete($id)){
			redirect(site_url('admin/products'));
		}
	}
}