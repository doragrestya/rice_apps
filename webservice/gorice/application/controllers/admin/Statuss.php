<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Statuss extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("status_transaksi_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["statuss"] = $this->status_transaksi_model->getAll();
		$this->load->view("admin/status_transaksi/list", $data);
	}

	public function add()
	{
		$status_transaksi = $this->status_transaksi_model;
		$validation = $this->form_validation;
		$validation->set_rules($status_transaksi->rules());

		if ($validation->run()) {
			$status_transaksi->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/status_transaksi/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/statuss');

		$status_transaksi = $this->status_transaksi_model;
		$validation = $this->form_validation;
		$validation->set_rules($status_transaksi->rules());

		if ($validation->run()) {
            $status_transaksi->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['status_transaksi'] = $status_transaksi->getById($id);
		if (!$data["status_transaksi"]) show_404();

		$this->load->view("admin/status_transaksi/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->status_transaksi_model->delete($id)){
			redirect(site_url('admin/statuss'));
		}
	}
}