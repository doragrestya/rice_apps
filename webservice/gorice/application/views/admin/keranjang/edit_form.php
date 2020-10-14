<!DOCTYPE html>
<html lang="en">

<head>
  <?php $this->load->view("admin/_partials/head.php") ?>
</head>

<body id="page-top">

  <?php $this->load->view("admin/_partials/sidebar.php") ?>
  <div id="content-wrapper">

    <?php $this->load->view("admin/_partials/navbar.php") ?>

    <div id="content-wrapper">

      <div class="container-fluid">

        <?php $this->load->view("admin/_partials/breadcrumb.php") ?>

        <?php if($this->session->flashdata('success')): ?>
        <div class="alert alert-success" role="alert">
          <?php echo $this->session->flashdata('success'); ?>
        </div>
        <?php endif; ?>

        <!-- DataTables -->
        <div class="card mb-3">
          <div class="card-header">
            <a href="<?php echo site_url('admin/keranjangs/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="" method="post" enctype="multipart/form-data">

              <input type="hidden" name="id" value="<?php echo $keranjang->id_keranjang?>"/>

              <div class="form-group">
                <label for="name">User</label>
                <div class="form-line">
                  <select name="user" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Konsumen---</option>
                    <?php foreach ($dd_konsumen as $dd_konsumen) : ?>
                      <option value="<?php echo $dd_konsumen->id_konsumen ?>"><?php echo $dd_konsumen->fullname_konsumen?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Produk</label>
                <div class="form-line">
                  <select name="produk" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Produk---</option>
                    <?php foreach ($dd_produk as $dd_produk) : ?>
                      <option value="<?php echo $dd_produk->id_produk ?>"><?php echo $dd_produk->nama_produk?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Detail Order</label>
                <input class="form-control <?php echo form_error('detail_order') ? 'is-invalid':'' ?>" name="detail_order", placeholder="Detail Order" value="<?php echo $keranjang->detail_order ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('detail_order') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="jumlah_produk">Jumlah Produk*</label>
                <input class="form-control <?php echo form_error('jumlah_produk') ? 'is-invalid':'' ?>" name="jumlah_produk", type="number",  placeholder="Jumlah Produk" value="<?php echo $keranjang->jumlah_produk ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('jumlah_produk') ?>
                </div>
              </div>

             <div class="form-group">
                <label for="total_harga_produk">Total Harga Produk*</label>
                <input class="form-control <?php echo form_error('total_harga_produk') ? 'is-invalid':'' ?>" name="total_harga_produk", type="number", placeholder="Total Harga Produk" value="<?php echo $keranjang->total_harga_produk ?>">
                <div class="invalid-feedback">
                  <?php echo form_error('total_harga_produk') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Status Transaksi</label>
                <div class="form-line">
                  <select name="id_status_transaksi" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Status Transaksi---</option>
                    <?php foreach ($dd_status as $dd_status) : ?>
                      <option value="<?php echo $dd_status->id_status_transaksi ?>"><?php echo $dd_status->status_transaksi?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>         


              <input class="btn btn-primary" type="submit" name="btn" value="Save" />
            </form>
    
          </div>

          <div class="card-footer small text-muted">
            * required fields
          </div>

      </div>
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <?php $this->load->view("admin/_partials/footer.php") ?>

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->


  <?php $this->load->view("admin/_partials/scrolltop.php") ?>

  <?php $this->load->view("admin/_partials/js.php") ?>

</body>

</html>