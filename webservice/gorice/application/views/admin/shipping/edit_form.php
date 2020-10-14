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
            <a href="<?php echo site_url('admin/shippings/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="" method="post" enctype="multipart/form-data">

              <input type="hidden" name="id" value="<?php echo $shipping->id_shipping?>"/>

              <div class="form-group">
                <label for="nama_shipping">Nama Shipping*</label>
                <input class="form-control <?php echo form_error('nama_shipping') ? 'is-invalid':'' ?>" type="text" name="nama_shipping", placeholder="Nama Shipping" value="<?php echo $shipping->nama_shipping ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nama_shipping') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Detail Shipping*</label>
                <input class="form-control <?php echo form_error('detail_shipping') ? 'is-invalid':'' ?>" type="text" name="detail_shipping", placeholder="Detail Shipping" value="<?php echo $shipping->detail_shipping ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('detail_shipping') ?>
                </div>
              </div>

              <input class="btn btn-success" type="submit" name="btn" value="Save" />
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