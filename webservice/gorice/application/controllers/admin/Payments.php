<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Payments extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("payment_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["payments"] = $this->payment_model->getAll();
		$this->load->view("admin/payment/list", $data);
	}

	public function add()
	{
		$payment = $this->payment_model;
		$validation = $this->form_validation;
		$validation->set_rules($payment->rules());

		if ($validation->run()) {
			$payment->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/payment/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/payments');

		$payment = $this->payment_model;
		$validation = $this->form_validation;
		$validation->set_rules($payment->rules());

		if ($validation->run()) {
            $payment->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['payment'] = $payment->getById($id);
		if (!$data["payment"]) show_404();

		$this->load->view("admin/payment/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->payment_model->delete($id)){
			redirect(site_url('admin/payments'));
		}
	}
}