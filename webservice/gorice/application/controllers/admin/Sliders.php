<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Sliders extends CI_Controller
{
	public function __construct()
	{
		parent::__construct();
		$this->load->model("slider_model");
		$this->load->library('form_validation');
		$this->load->model("user_model");
		if($this->user_model->isNotLogin()) redirect(site_url('admin/login'));
	}

	public function index()
	{
		$data["sliders"] = $this->slider_model->getAll();
		$this->load->view("admin/slider/list", $data);
	}

	public function add()
	{
		$slider = $this->slider_model;
		$validation = $this->form_validation;
		$validation->set_rules($slider->rules());

		if ($validation->run()) {
			$slider->save();
			$this->session->set_flashdata('success', 'Berhasil disimpan');
		}
		$this->load->view("admin/slider/new_form");
	}

	public function edit($id = null)
	{
		if(!isset($id)) redirect('admin/sliders');

		$slider = $this->slider_model;
		$validation = $this->form_validation;
		$validation->set_rules($slider->rules());

		if ($validation->run()) {
            $slider->update();
            $this->session->set_flashdata('success', 'Berhasil disimpan');
        }

		$data['slider'] = $slider->getById($id);
		if (!$data["slider"]) show_404();

		$this->load->view("admin/slider/edit_form", $data);
	}

	public function delete($id=null)
	{
		if(!isset($id)) show_404();

		if($this->slider_model->delete($id)){
			redirect(site_url('admin/sliders'));
		}
	}
}