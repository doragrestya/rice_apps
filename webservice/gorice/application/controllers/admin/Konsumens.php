<?php defined('BASEPATH') OR exit('No direct script access allowed');

class Konsumens extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("konsumen_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["konsumens"] = $this->konsumen_model->getAll();
		$this->load->view("admin/konsumen/list", $data);
	}

	public function add()
	{
		$konsumen = $this->konsumen_model;
		$validation = $this->form_validation;
		$validation->set_rules($konsumen->rules());

		if($validation->run()){
			$konsumen->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/konsumen/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/konsumens');

		$konsumen = $this->konsumen_model;
		$validation = $this->form_validation;
		$validation->set_rules($konsumen->rules());

		if($validation->run()){
			$konsumen->update();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}

			$data['konsumen'] = $konsumen->getById($id);
			if(!$data["konsumen"]) show_404();
			$this->load->view("admin/konsumen/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();
		if($this->konsumen_model->delete($id)){
			redirect(site_url('admin/konsumens'));
		}
	}
}