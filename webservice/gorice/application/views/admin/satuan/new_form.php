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
            <a href="<?php echo site_url('admin/satuans/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="<?php echo site_url('admin/satuans/add') ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="nama_shipping">Nama Satuan*</label>
                <input class="form-control <?php echo form_error('nama_satuan') ? 'is-invalid':'' ?>" type="text" name="nama_satuan", placeholder="Nama Satuan"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nama_satuan') ?>
                </div>
              </div>

              <input class="btn btn-success" type="submit" name="btn" value="Save"/>
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