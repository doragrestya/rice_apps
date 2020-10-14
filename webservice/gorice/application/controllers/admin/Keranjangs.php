<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Keranjangs extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("keranjang_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["keranjangs"] = $this->keranjang_model->getAll();
		$this->load->view("admin/keranjang/list", $data);
	}

	public function add()
	{
		$keranjang = $this->keranjang_model;
		$validation = $this->form_validation;
		$validation->set_rules($keranjang->rules());

		if ($validation->run()) {
			$keranjang->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}

		$data['dd_konsumen'] = $this->keranjang_model->dd_konsumen();
		$data['dd_produk'] = $this->keranjang_model->dd_produk();
		$data['dd_status'] = $this->keranjang_model->dd_status();

		$this->load->view("admin/keranjang/new_form", $data);
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/keranjangs');

		$keranjang = $this->keranjang_model;
		$validation = $this->form_validation;
		$validation->set_rules($keranjang->rules());

		if ($validation->run()) {
            $keranjang->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['keranjang'] = $keranjang->getById($id);
		$data['dd_konsumen'] = $this->keranjang_model->dd_konsumen();
		$data['dd_produk'] = $this->keranjang_model->dd_produk();
		$data['dd_status'] = $this->keranjang_model->dd_status();
		if (!$data["keranjang"]) show_404();

		$this->load->view("admin/keranjang/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->keranjang_model->delete($id)){
			redirect(site_url('admin/keranjangs'));
		}
	}
}