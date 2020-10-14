<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Konfirmasis extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("konfirmasi_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["konfirmasis"] = $this->konfirmasi_model->getAll();
		$this->load->view("admin/konfirmasi/list", $data);
	}

	public function add()
	{
		$konfirmasi = $this->konfirmasi_model;
		$validation = $this->form_validation;
		$validation->set_rules($konfirmasi->rules());

		if ($validation->run()) {
			$konfirmasi->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/konfirmasi/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/konfirmasis');

		$konfirmasi = $this->konfirmasi_model;
		$validation = $this->form_validation;
		$validation->set_rules($konfirmasi->rules());

		if ($validation->run()) {
            $konfirmasi->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['konfirmasi'] = $konfirmasi->getById($id);
		if (!$data["konfirmasi"]) show_404();

		$this->load->view("admin/konfirmasi/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->konfirmasi_model->delete($id)){
			redirect(site_url('admin/konfirmasis'));
		}
	}
}