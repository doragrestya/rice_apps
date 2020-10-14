<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Orders extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("order_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["orders"] = $this->order_model->getAll();
		$this->load->view("admin/order/list", $data);
	}

	public function add()
	{
		$order = $this->order_model;
		$validation = $this->form_validation;
		$validation->set_rules($order->rules());

		if ($validation->run()) {
			$order->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}

		$data['dd_konsumen'] = $this->order_model->dd_konsumen();
		$data['dd_status'] = $this->order_model->dd_status();
		$data['dd_shipping'] = $this->order_model->dd_shipping();
		$data['dd_payment'] = $this->order_model->dd_payment();

		$this->load->view("admin/order/new_form", $data);
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/orders');

		$order = $this->order_model;
		$validation = $this->form_validation;
		$validation->set_rules($order->rules());

		if ($validation->run()) {
            $order->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['order'] = $order->getById($id);
		$data['dd_konsumen'] = $this->order_model->dd_konsumen();
		$data['dd_status'] = $this->order_model->dd_status();
		$data['dd_shipping'] = $this->order_model->dd_shipping();
		$data['dd_payment'] = $this->order_model->dd_payment();
		if (!$data["order"]) show_404();

		$this->load->view("admin/order/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->order_model->delete($id)){
			redirect(site_url('admin/orders'));
		}
	}
}