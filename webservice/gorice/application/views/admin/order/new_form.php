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
            <a href="<?php echo site_url('admin/orders/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="<?php echo site_url('admin/orders/add') ?>" method="post" enctype="multipart/form-data">

             <!--  <div class="form-group">
                <label for="tanggal_order">Tanggal Order*</label>
                <input class="form-control <?php echo form_error('tanggal_order') ? 'is-invalid':'' ?>" type="text" name="tanggal_order", placeholder="Tanggal Order"/>
                <div class="invalid-feedback">
                  <?php echo form_error('tanggal_order') ?>
                </div>
              </div> -->

              <div class="form-group">
                <label for="name">User</label>
                <div class="form-line">
                  <select name="user" class="form-control" style="width: 300px">
                    <option value="---">---Pilih User---</option>
                    <?php foreach ($dd_konsumen as $dd_konsumen) : ?>
                      <option value="<?php echo $dd_konsumen->id_konsumen ?>"><?php echo $dd_konsumen->fullname_konsumen?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <form action="<?php echo site_url('admin/orders/add') ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="alamat_user">Alamat User*</label>
                <input class="form-control <?php echo form_error('alamat_user') ? 'is-invalid':'' ?>" type="text" name="alamat_user", placeholder="Alamat User"/>
                <div class="invalid-feedback">
                  <?php echo form_error('alamat_user') ?>
                </div>
              </div>  

              <div class="form-group">
                <label for="name">Status Transaksi</label>
                <div class="form-line">
                  <select name="status" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Status Transaksi---</option>
                    <?php foreach ($dd_status as $dd_status) : ?>
                      <option value="<?php echo $dd_status->id_status_transaksi ?>"><?php echo $dd_status->status_transaksi ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Order Total*</label>
                <textarea class="form-control <?php echo form_error('order_total') ? 'is-invalid':'' ?>" name="order_total", placeholder="Order total"></textarea>
                <div class="invalid-feedback">
                  <?php echo form_error('order_total') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Shipping</label>
                <div class="form-line">
                  <select name="shipping" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Shipping---</option>
                    <?php foreach ($dd_shipping as $dd_shipping) : ?>
                      <option value="<?php echo $dd_shipping->id_shipping?>"><?php echo $dd_shipping->nama_shipping ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Payment</label>
                <div class="form-line">
                  <select name="payment" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Payment---</option>
                    <?php foreach ($dd_payment as $dd_payment) : ?>
                      <option value="<?php echo $dd_payment->id_payment?>"><?php echo $dd_payment->nama_payment?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Id Checkout*</label>
                <textarea class="form-control <?php echo form_error('id_checkout') ? 'is-invalid':'' ?>" name="id_checkout", placeholder="Id Checkout"></textarea>
                <div class="invalid-feedback">
                  <?php echo form_error('id_checkout') ?>
                </div>
              </div>

              <input class="btn btn-primary" type="submit" name="btn" value="Save"/>
            </form>
    
          </div>
          <div class="card-footer small text-muted">
            * required fields
          </div>
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