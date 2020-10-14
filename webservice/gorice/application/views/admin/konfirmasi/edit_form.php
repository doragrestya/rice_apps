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
            <a href="<?php echo site_url('admin/konfirmasis/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="" method="post" enctype="multipart/form-data">

              <input type="hidden" name="id" value="<?php echo $konfirmasi->id_konfirmasi?>"/>

              <div class="form-group">
                <label for="name">Id Checkout*</label>
                <input class="form-control <?php echo form_error('id_checkout') ? 'is-invalid':'' ?>" type="text" name="id_checkout", placeholder="Id Checkout" value="<?php echo $konfirmasi->id_checkout ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('id_checkout') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Nama Konsumen*</label>
                <input class="form-control <?php echo form_error('nama_konsumen') ? 'is-invalid':'' ?>" type="text" name="nama_konsumen", placeholder="Nama Konsumen" value="<?php echo $konfirmasi->nama_konsumen ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nama_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">No. Telp*</label>
                <input class="form-control <?php echo form_error('notelp') ? 'is-invalid':'' ?>" type="text" name="notelp", placeholder="No. Telp" value="<?php echo $konfirmasi->notelp ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('notelp') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Jumlah Transfer*</label>
                <input class="form-control <?php echo form_error('jumlah_transfer') ? 'is-invalid':'' ?>" type="text" name="jumlah_transfer", placeholder="Jumlah Transfer" value="<?php echo $konfirmasi->jumlah_transfer ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('jumlah_transfer') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Image*</label>
                <input class="form-control-file <?php echo form_error('image') ? 'is-invalid':'' ?>" type="file" name="image"/>
                <input type="hidden" name="old_image" value="<?php echo $konfirmasi->image ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('image') ?>
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