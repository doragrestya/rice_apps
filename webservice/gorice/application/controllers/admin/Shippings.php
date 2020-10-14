<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Shippings extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("shipping_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["shippings"] = $this->shipping_model->getAll();
		$this->load->view("admin/shipping/list", $data);
	}

	public function add()
	{
		$shipping = $this->shipping_model;
		$validation = $this->form_validation;
		$validation->set_rules($shipping->rules());

		if ($validation->run()) {
			$shipping->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/shipping/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/shippings');

		$shipping = $this->shipping_model;
		$validation = $this->form_validation;
		$validation->set_rules($shipping->rules());

		if ($validation->run()) {
            $shipping->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['shipping'] = $shipping->getById($id);
		if (!$data["shipping"]) show_404();

		$this->load->view("admin/shipping/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->shipping_model->delete($id)){
			redirect(site_url('admin/shippings'));
		}
	}
}