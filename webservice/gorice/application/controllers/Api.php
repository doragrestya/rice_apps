<?php

  defined('BASEPATH') OR exit('No Script Direct');

  class API extends CI_Controller{
  	function __construct(){
  		parent:: __construct();
  		date_default_timezone_set('Asia/Jakarta');
  		error_reporting(E_ALL);
  		ini_set('Display Error', 1);
    }

    //API UPDATE ORDER STATUS TRANSAKSI SAAT MELAKUKAN KONFIRMASI PEMBAYARAN
    function updateOrderStatus(){
      
      $idCheckout = $this->input->post('id_checkout');

      $sqlStatus = "Update tb_order  SET tb_order.order_status = 3 WHERE id_checkout = $idCheckout";

      $queryStatus = $this->db->query($sqlStatus);

      if($queryStatus){
        $data['status'] = 200;
        $data['message'] = "Successfully Update";
      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update";
      }
      echo json_encode($data);
    }


    //API UPDATE STATUS CANCEL
    function updateCancel(){
      
      $idCheckout = $this->input->post('id_checkout');

      $sqlCancel = "Update tb_order  SET tb_order.order_status = 5 WHERE id_checkout = $idCheckout";

      $queryCancel = $this->db->query($sqlCancel);

      if($queryCancel){
        $data['status'] = 200;
        $data['message'] = "Successfully Update";
      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update";
      }
      echo json_encode($data);
    }


    //API LIHAT DETAIL ORDER PADA MENU HISTORY
    function getPesanan(){
      $idCheckout = $this->input->post('id_checkout');

      $this->db->select('*');
      $this->db->from('tb_keranjang');
      $this->db->where('tb_keranjang.detail_order', "$idCheckout");
      $this->db->join("tb_produk", "tb_keranjang.id_produk = tb_produk.id_produk" );
      $this->db->group_by("tb_keranjang.id_produk");
      /*$this->db->order_by("tb_keranjang.created_at", "DESC");*/

      $query = $this->db->get();
      if($query -> num_rows() > 0){
          $data['message'] = "Successfully Get Data Pesanan";
          $data['status'] = 200;
          $data['DataKeranjang'] = $query->result();
      }else{
          $data['message'] = "Failed Get Data Pesanan";
          $data['status'] = 400;
      }
      
      echo json_encode($data);
    }


      //API GET DATA TABEL ORDER SEMUANYA BERDASARKAN ORDER STATUS
    function getOrder(){
      $idUser = $this->input->post("id_user");
      $orderStatus = $this->input->post("order_status");

        $this->db->select("*");
      $this->db->from("tb_order");
      $this->db->where("tb_order.id_user", $idUser);
      $this->db->where("tb_order.order_status", $orderStatus);

      $this->db->join("tb_konsumen", "tb_konsumen.id_konsumen = tb_order.id_user");

      $this->db->join("tb_payment", "tb_payment.id_payment = tb_order.id_payment");

      $this->db->join("tb_status_transaksi", "tb_status_transaksi.id_status_transaksi = tb_order.order_status");
      
      $this->db->order_by("tb_order.tanggal_order","DESC");

      $query = $this->db->get();
      if($query -> num_rows() >0)
      {
        $data['message'] = "Successfully Get Data Order";
        $data['status'] = 200;
        $data['dataOrder'] = $query->result();
      }
      else
      {
        $data['message'] = "Failed Get Data Order";
        $data['status'] = 400;
      }

      echo json_encode($data);
    }

      //API GET DATA TABEL ORDER BY ORDER STATUS (SUKSES PAGE)
    function getDataOrder(){
      $idCheckout = $this->input->post('id_checkout');
      $orderStatus = $this->input->post('order_status');

        $this->db->select("*");
      $this->db->from("tb_order");
      $this->db->where("order_status", $orderStatus);
      $this->db->where("id_checkout", $idCheckout);
      $this->db->join("tb_konsumen", "tb_konsumen.id_konsumen = tb_order.id_user");
      $this->db->join("tb_payment", "tb_payment.id_payment = tb_order.id_payment");
      $this->db->join("tb_status_transaksi", "tb_status_transaksi.id_status_transaksi = tb_order.order_status");
      $this->db->order_by("tb_order.tanggal_order","DESC");

      $query = $this->db->get();
      if($query -> num_rows() >0)
      {
        $data['message'] = "Successfully Get Data Order";
        $data['status'] = 200;
        $data['dataOrder'] = $query->result();
      }
      else
      {
        $data['message'] = "Failed Get Data Order";
        $data['status'] = 400;
      }

      echo json_encode($data);
    }

      //Update Update Total Jual (untuk menampilkan produk best saller nantinya)
    function updateTotalJual(){
      $idUser = $this->input->post('id_user');
      $idStatusTransaksi = $this->input->post('id_status_transaksi');
      $detailOrder = $this->input->post('detail_order');

      $sql = "Update tb_produk INNER JOIN tb_keranjang ON tb_keranjang.id_produk = tb_produk.id_produk SET tb_produk.total_jual = tb_produk.total_jual + tb_keranjang.jumlah_produk
        WHERE tb_keranjang.id_user = $idUser AND tb_keranjang.id_status_transaksi = $idStatusTransaksi AND detail_order = $detailOrder";

      $query = $this->db->query($sql);

      if($query){
        $data['status'] = 200;
        $data['message'] = "Successfully Update Total Jual Produk";

      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update Total Jual Produk";
      }
      echo json_encode($data);
    }

      //Update STOK
    function updateStok(){
      $idStatusTransaksi = $this->input->post('id_status_transaksi');
      $detailOrder = $this->input->post('detail_order');

      $sql = "Update tb_produk INNER JOIN tb_keranjang ON tb_keranjang.id_produk = tb_produk.id_produk SET tb_produk.stok_produk = tb_produk.stok_produk - tb_keranjang.jumlah_produk WHERE tb_keranjang.detail_order = $detailOrder AND tb_keranjang.id_status_transaksi = $idStatusTransaksi";

      $query = $this->db->query($sql);

      if($query){
        $data['status'] = 200;
        $data['message'] = "Successfully Update Stok Produk";

      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update Stok Produk";
      }
      echo json_encode($data);
    }


      //API ORDER TOTAL
    function updateOrderTotal(){
      $idUser = $this->input->post('id_user');
      $detailOrder = $this->input->post('detail_order');
      $idStatus = $this->input->post('id_status_transaksi');

      $sqlStok = "Update tb_order INNER JOIN tb_keranjang ON tb_keranjang.detail_order = tb_order.id_checkout SET tb_order.order_total = (SELECT SUM(tb_keranjang.total_harga_produk) FROM tb_keranjang WHERE tb_keranjang.detail_order = $detailOrder AND tb_keranjang.id_status_transaksi = $idStatus AND tb_keranjang.id_user = $idUser) WHERE tb_order.id_checkout = $detailOrder";

      $queryStok = $this->db->query($sqlStok);

      if($queryStok){
        $data['status'] = 200;
        $data['message'] = "Successfully Update Stok Produk";

      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update Stok Produk";
      }
      echo json_encode($data);
    }

    //CHECKOUT TRANSAKSI BARU UNTUK AKSI CHECKOUT
    function checkoutTransaksiBaru(){
      $idUser = $this->input->post('id_user');
      $idStatus = $this->input->post('id_status_transaksi');
      $orderDetail = $this->input->post('order_detail');
         

      $sqlUpdate = "Update tb_keranjang SET id_status_transaksi = 2 WHERE id_user = $idUser AND id_status_transaksi = 1 AND detail_order = $orderDetail";

      $saveQuery = $this->db->query($sqlUpdate);

      if($saveQuery){
        $data['status'] = 200;
        $data['message'] = "Successfully Update Product";

      }
      else{
        $data['status'] = 404;
        $data['message'] ="Failed Update Product";
      }
      echo json_encode($data);

    }

    //API Menambahkan data
    function addOrder(){
      $idUser = $this->input->post('id_user');
      $idCheckout = $this->input->post('id_checkout');
      $alamatUser= $this->input->post('alamat_user');
      $orderStatus = $this->input->post('order_status');
      $idPayment = $this->input->post('id_payment');
      $idShipping = $this->input->post('id_shipping');

      $this->db->where('tb_order.id_checkout', $idCheckout);
      $q = $this->db->get('tb_order');

      if($q -> num_rows() > 0){
        $data['status'] = 404;
        $data['message'] = 'Order Status Telah Terdaftar';
      }
      else {
        $save['id_user'] = $idUser;
        $save['id_checkout'] = $idCheckout;
        $save['alamat_user'] = $alamatUser;
        $save['order_status'] = $orderStatus;
        $save['id_payment'] = $idPayment;
        $save['id_shipping'] = $idShipping;

        $querySaved = $this->db->insert('tb_order', $save);

        if($querySaved){
          $data['status'] = 200;
          $data['message'] ="Successfully Add order";
        } else{
          $data['status'] = 404;
          $data['message'] ="Failed Add order";
        }
      }
      echo json_encode($data);
    }

    //API Delete PRODUK PADA KERANJANG
    function deleteProdukKeranjang(){
      $idProduk = $this->input->post('id_produk');
      $this->db->where('id_produk', $idProduk);

      $status = $this->db->delete('tb_keranjang');

      if($status == true){
        $data['message'] = 'Successfully Delete Produk';
        $data['status'] = 200;
      } else {
        $data['message'] = 'Failed Delete Produk';
        $data['status'] = 404;
      }
      echo json_encode($data);
    }

    //API decrementCounter keranjang
    function decrementCounter(){
      $idUser = $this->input->post('id_user');
      $idProduk = $this->input->post('id_produk');

      $sql = "Update tb_keranjang INNER JOIN tb_produk ON tb_keranjang.id_produk = tb_produk.id_produk SET tb_keranjang.jumlah_produk = tb_keranjang.jumlah_produk - 1, tb_keranjang.total_harga_produk = tb_produk.harga_produk * tb_keranjang.jumlah_produk - tb_produk.harga_produk WHERE tb_keranjang.id_produk = $idProduk AND tb_keranjang.id_user = $idUser";

      $query = $this->db->query($sql);
      if($query){
        $data['status'] = 200;
        $data['message'] = 'Successfully Update Produk';
      }
      else {
        $data['status'] = 404;
        $data['message'] = "Failed Update Produk";
      }
      echo json_encode($data);

    }

    //MENAMPILKAN JUMLAH ORDER
    function jumlahKeranjang(){
      $idUser = $this->input->post('id_user');
      $idStatusTransaksi = $this->input->post('id_status_transaksi');

      $this->db->select('SUM(jumlah_produk) as jumlah');
      $this->db->from('tb_keranjang');

      $this->db->where('id_user', $idUser);
      $this->db->where('id_status_transaksi', $idStatusTransaksi);

      $query = $this->db->get();
      if($query -> num_rows() > 0){
        $data['message'] = 'Successfully Get Data Keranjang';
        $data['status'] = 200;
        $data['jumlahkeranjang'] = $query->result();
      } else {
        $data['message'] = 'Failed Get Data Produk';
        $data['status'] = 400;
      }
      echo json_encode($data);
    }


    //MENAMPILKAN LIST KERANJANG BERDASARKAN USER
    function getKeranjang(){
      $idUser = $this->input->post('id_user');
      $idStatus = $this->input->post('id_status_transaksi');

      $this->db->select('*');
      $this->db->from('tb_keranjang');
      $this->db->where('tb_keranjang.id_user', $idUser);
      $this->db->where('tb_keranjang.id_status_transaksi', $idStatus);
      $this->db->join("tb_produk", "tb_keranjang.id_produk = tb_produk.id_produk");
      $this->db->group_by("tb_keranjang.id_produk");

      $query = $this->db->get();
      if($query -> num_rows() > 0){
        $data['message'] = "Successfully Get Data Keranjang";
        $data['status'] = 200;
        $data['dataKeranjang'] = $query->result();
      } else {
        $data['message'] = 'Failed Get Data Produk';
        $data['status'] = 400;
      }
      echo json_encode($data);
    }

    //API TAMBAH DAN UPDATE DATA TRANSAKSI (HOMEPAGE/KERANJANG)
    function addUpdateTransaksi(){
      $idUser = $this->input->post('id_user');
      $detailOrder = $this->input->post('detail_order');
      $idProduk = $this->input->post('id_produk');
      $jumlahProduk = $this->input->post('jumlah_produk');
      $hargaProduk = $this->input->post('harga_produk');

      $this->db->where('tb_keranjang.id_produk', $idProduk);
      $this->db->where('tb_keranjang.id_user', $idUser);
      $this->db->where('tb_keranjang.detail_order', $detailOrder);
      $this->db->where('tb_keranjang.id_status_transaksi', "1");

      $q = $this->db->get('tb_keranjang');

      if($q -> num_rows() > 0){
        $sql = "Update tb_keranjang 
        INNER JOIN tb_produk ON tb_keranjang.id_produk = tb_produk.id_produk SET tb_keranjang.jumlah_produk = tb_keranjang.jumlah_produk + 1, tb_keranjang.total_harga_produk = tb_produk.harga_produk * tb_keranjang.jumlah_produk + tb_produk.harga_produk WHERE tb_keranjang.id_produk = $idProduk AND tb_keranjang.id_user = $idUser";

        $query = $this->db->query($sql);

        if($query){
          $data['status'] = 200;
          $data['message'] = 'Successfully Update Data Produk';
        } 
        else{
          $data['status'] = 404;
          $data['message'] = 'Failed Update Data Produk';
      } 
    } else {
        $save['id_user'] = $idUser;
        $save['detail_order'] = $detailOrder;
        $save['id_produk'] = $idProduk;
        $save['jumlah_produk'] = $jumlahProduk;
        $save['total_harga_produk'] = $hargaProduk;

        $querySaved = $this->db->insert('tb_keranjang', $save);

        if($querySaved){
          $data['status'] = 200;
          $data['message'] = 'Successfully Add Produk';
        } else {
          $data['status'] = 404;
          $data['message'] = 'Failed Add Produk';
        }
      }
      echo json_encode($data);
      //Decode : dari Json ke Object
      //encode : dari object ke Json
    }

    //Cari Produk
    function searchProduk() {
      $keyword = $this->input->post('keyword');

      $this->db->like('nama_produk', $keyword);

      $q = $this->db->get('tb_produk');

      if ($q->num_rows() > 0) {
          $data['message'] = 'success';
          $data['status'] = 200;
          $data['data'] = $q->result();
      } else {
          $data['message'] = 'tidak ditemukan';
          $data['status'] = 404;
      }

      echo json_encode($data);
    }
    
    //HITUNG TOTAL BELANJA
    function totalBelanja(){
      $idUser = $this->input->post('id_user');
      $idStatus = $this->input->post('id_status_transaksi');
      $detailOrder = $this->input->post('detail_order');

      $this->db->select("SUM(total_harga_produk) as total_belanja");
      $this->db->from("tb_keranjang");
      $this->db->where("id_user = $idUser");
      $this->db->where("detail_order", $detailOrder);

      $query = $this->db->get();
      $data = $query->result();
      echo json_encode($data);
    }

    function getSlider(){
      $idSlider = $this->input->post('idslider');
      $imageSlider = $this->input->post('image');
      $this->db->where('id_slider', $idSlider);
      $q = $this->db->get('tb_slider');

      if ($idSlider != null || $idSlider != "") {
        if ($q -> num_rows() > 0) {
          $data['message'] = "Successfully Get Data Slider With Id";
          $data['status'] = 200;
          $data['dataslider'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Slider';
          $data['status'] = 400;
        }
      } else {
        $q = $this->db->get('tb_slider');
        if ($q->num_rows() > 0) {
          $data['message'] = "Successfully Get Data Slider With Id";
          $data['status'] = 200;
          $data['dataslider'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Slider';
          $data['status'] = 400;
        }
      }
      echo json_encode($data);
    }

    function getPayment(){
      $idBank = $this->input->post('idbank');
      $namaBank = $this->input->post('nama');
      $this->db->where('id_payment', $idBank);
      $q = $this->db->get('tb_payment');

      if ($idBank != null || $idBank != "") {
        if ($q -> num_rows() > 0) {
          $data['message'] = "Successfully Get Data Payment With Id";
          $data['status'] = 200;
          $data['payment'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Payment';
          $data['status'] = 400;
        }
      } else {
        $q = $this->db->get('tb_payment');
        if ($q->num_rows() > 0) {
          $data['message'] = "Successfully Get Data Payment With Id";
          $data['status'] = 200;
          $data['payment'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Payment';
          $data['status'] = 400;
        }
      }
      echo json_encode($data);
    }

    function getShipping(){
      $idKurir = $this->input->post('idkurir');
      $namaKurir = $this->input->post('nama');
      $this->db->where('id_shipping', $idKurir);
      $q = $this->db->get('tb_shipping');

      if ($idKurir != null || $idKurir != "") {
        if ($q -> num_rows() > 0) {
          $data['message'] = "Successfully Get Data Shipping With Id";
          $data['status'] = 200;
          $data['shipping'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Shipping';
          $data['status'] = 400;
        }
      } else {
        $q = $this->db->get('tb_shipping');
        if ($q->num_rows() > 0) {
          $data['message'] = "Successfully Get Data Shipping With Id";
          $data['status'] = 200;
          $data['shipping'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Shipping';
          $data['status'] = 400;
        }
      }
      echo json_encode($data);
    }

    function getProdukKategori(){
      $idKategori= $this->input->post('idkategori');

      $this->db->select("*");
      $this->db->from("tb_produk");
      $this->db->join("tb_satuan","tb_satuan.id_satuan = tb_produk.id_satuan"); 
      $this->db->join("tb_kategori","tb_kategori.id_kategori = tb_produk.id_kategori"); 
      $this->db->where('tb_produk.id_kategori', $idKategori);

      $query = $this->db->get();
      if ($query->num_rows()>0) {
          $data['message'] = "Successfully Get Data With Id";
          $data['status'] = 200;
          $data['kategoriproduk'] = $query->result();
        } else {
          $data['message'] = 'Failed Get Data';
          $data['status'] = 400;
        }
      echo json_encode($data);
    }

    function getKategori(){
      $idKategori = $this->input->post('idkategori');
      $namaKategori = $this->input->post('nama');
      $this->db->where('id_kategori', $idKategori);
      $q = $this->db->get('tb_kategori');

      if ($idKategori != null || $idKategori != "") {
        if ($q -> num_rows() > 0) {
          $data['message'] = "Successfully Get Data Kategori With Id";
          $data['status'] = 200;
          $data['kategori'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Kategori';
          $data['status'] = 400;
        }
      } else {
        $q = $this->db->get('tb_kategori');
        if ($q->num_rows() > 0) {
          $data['message'] = "Successfully Get Data Kategori With Id";
          $data['status'] = 200;
          $data['kategori'] = $q->result();
        } else {
          $data['message'] = 'Failed Get Data Kategori';
          $data['status'] = 400;
        }
      }
      echo json_encode($data);
    }

    ///API UPLOAD KONFIRMASI PEMBAYARAN
    function uploadBukti(){
      $idCheckout = $this->input->post('id_checkout');
      $namaKonsumen = $this->input->post('nama_konsumen');
      $notelp = $this->input->post("notelp");
      $jumlahTransfer = $this->input->post('jumlah_transfer');
      $config['upload_path'] = './upload/transfer/'; // tipe string dan file
      $config['allowed_types'] = 'gif|jpg|png|jpeg';

      $this->load->library('upload', $config); // ini proses untuk memasukkan ke dalam libraries

      if(! $this->upload->do_upload('image')){
        $error = array('error' => $this->upload->display_errors());
        $data1 = array(
          'message' => $error,
          'status' => 404,
        );
      }else{
        $data = array('upload_data' => $this->upload->data()); //proses upload
        $save['id_checkout'] = $idCheckout;
        $save['nama_konsumen'] = $namaKonsumen;
        $save['notelp'] = $notelp;
        $save['jumlah_transfer'] = $jumlahTransfer;
        // $save['tanggal_upload'] = date('Y-m-d H:i:s');
        $save['image'] = $data['upload_data']['file_name']; //ini proses untuk menyimpan ke databasenya
        $query = $this->db->insert('tb_konfirmasi', $save);

        //Output Request
        $data1 = array(
          'message' => "Successfully Upload Bukti Transfer",
          'status' => 200,
          'data' => $data['upload_data']['file_name'],
        );
      }
      echo json_encode($data1);
    }


    function updateImage(){
      $idKonsumen = $this->input->post('idkonsumen');
      $config['upload_path'] = './upload/';
      $config['allowed_types'] = 'gif|jpg|png|jpeg';

      $this->db->where('id_konsumen', $idKonsumen);
      $this->load->library('upload', $config);

      if (!$this->upload->do_upload('image')) {
        $error = array('error' => $this->upload->display_errors());
        $data1 = array('message' => $error,
          'status' => 404,
        );
      } else {
        //upload to folder
        $data = array('upload_data' => $this->upload->data());

        //upload to database
        $save['photo_konsumen'] = $data['upload_data']['file_name'];
        $query = $this->db->update('tb_konsumen', $save);

        //output request
        $data1 = array('message' => 'Successfully Update Image', 'status' => 200,
          'data' => $data['upload_data']['file_name']);
      }
      echo json_encode($data1);
    }

    function updateProfile(){
        $idKonsumen= $this->input->post('idkonsumen');
        $name = $this->input->post('name');
        $email = $this->input->post('email');
        $nohp = $this->input->post('nohp');
        $alamat = $this->input->post('alamat');
        $this->db->where('id_konsumen', $idKonsumen);

        if ($name == null || $name == "") {
            $update['email_konsumen'] = $email;
            $update['nohp_konsumen'] = $nohp;
            $update['alamat_konsumen'] = $alamat;
            $query = $this->db->update('tb_konsumen', $update);
            if ($query) {
                $data['message'] = 'Successfully Without Name';
                $status['status'] = 200;
            } else {
                $data['message'] = 'Failed Without Name';
                $status['status'] = 404;
            }
        } else if ($email == null || $email == "") {
               $update['fullname_konsumen'] = $name;
               $update['nohp_konsumen'] = $nohp;
               $update['alamat_konsumen'] = $alamat;
               $query = $this->db->update('tb_konsumen', $update);
                if ($query) {
                    $data['message'] = 'Successfully Without Name';
                    $status['status'] = 200;
                } else {
                    $data['message'] = 'Failed Without Name';
                    $status['status'] = 404;
                }
        } else if ($nohp == null || $nohp == "") {
               $update['fullname_konsumen'] = $name;
               $update['email_konsumen'] = $email;
               $update['alamat_konsumen'] = $alamat;
               $query = $this->db->update('tb_konsumen', $update);
               if ($query) {
                   $data['message'] = 'Successfully Without Name';
                   $status['status'] = 200;
                } else {
                   $data['message'] = 'Failed Without Name';
                   $status['status'] = 404;
                }
        } else if ($alamat == null || $alamat == "") {
               $update['fullname_konsumen'] = $name;
               $update['email_konsumen'] = $email;
               $update['nohp_konsumen'] = $nohp;
               $query = $this->db->update('tb_konsumen', $update);
               if ($query) {
                   $data['message'] = 'Successfully Without Name';
                   $status['status'] = 200;
                } else {
                   $data['message'] = 'Failed Without Name';
                   $status['status'] = 404;
                }
        } else {
              $update['fullname_konsumen'] = $name;
              $update['email_konsumen'] = $email;
              $update['nohp_konsumen'] = $nohp;
              $update['alamat_konsumen'] = $alamat;
              $query = $this->db->update('tb_konsumen', $update);
              if ($query) {
                  $data['message'] = 'Successfully Without Name';
                  $status['status'] = 200;
              } else {
                  $data['message'] = 'Failed Without Name';
                   $status['status'] = 404;
              }
        }
         echo json_encode($data);
     }

  //   function updateProfile(){
  //     $idKonsumen = $this->input->post('idkonsumen');
  //     $name = $this->input->post('name');
  //     $email = $this->input->post('email');
  //     $nohp = $this->input->post('nohp');
  //     // $password = $this->input->post('password');
  //     $alamat = $this->input->post('alamat');
  //     $this->db->where('id_konsumen', $idKonsumen);

  //     $q = $this->db->get('tb_konsumen'); 
  //     if($q -> num_rows() > 0){
  //       $update['fullname_konsumen'] = $name;
  //       $update['email_konsumen'] = $email;
  //       $update['nohp_konsumen'] = $nohp;
  //       $update['alamat_konsumen'] = $alamat;

  //       $this->db->where('id_konsumen', $idKonsumen);
  //       $queryUpdate = $this->db->update('tb_konsumen', $update);

  //       if($queryUpdate){
  //         $data['status'] = 200;
  //         $data['message'] ="Successfully Update";
  //       } else{
  //         $data['status'] = 404;
  //         $data['message'] ="Failed update";
  //       }
  //     }
  //     echo json_encode($data);  
  // }

  	function registerKonsumen(){
          $namefull = $this->input->post('name');
          $email = $this->input->post('email');
          $nohp = $this->input->post('nohp');
          $alamat = $this->input->post('alamat');
          $password = $this->input->post('password');

          $this->db->where('email_konsumen', $email);
          $q = $this->db->get('tb_konsumen');

          if($q -> num_rows() > 0){
            $data['status'] = 404;
            $data['message'] = "Email telah terdaftar";
          } else {
            $save['fullname_konsumen'] = $namefull;
            $save['email_konsumen'] = $email;
            $save['nohp_konsumen'] = $nohp;
            $save['alamat_konsumen'] = $alamat;
            $save['password_konsumen'] = md5($password);

            $querySaved = $this->db->insert('tb_konsumen', $save);

            if ($querySaved) {
              $data['status'] = 200;
              $data['message'] = 'Successfully Register';
            } else {
              $data['status'] = 404;
              $data['message'] = 'Failed Register';
            }
          }
          echo json_encode($data);
        }

  	function loginKonsumen(){
          $email = $this->input->post('email');
          $password = $this->input->post('password');

          $this->db->where('email_konsumen', $email);
          $this->db->where('password_konsumen', md5($password));

          $q = $this->db->get('tb_konsumen');

          if($q -> num_rows() > 0){
            $data['status'] = 200;
            $data['message'] = 'Successfully Login';
            $data['konsumen'] = $q->result();
          } else {
            $data['status'] = 404;
            $data['message'] = 'Failed Login';
          }
          echo json_encode($data);
        }
      }
  
?>