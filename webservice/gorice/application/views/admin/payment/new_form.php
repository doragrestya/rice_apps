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
            <a href="<?php echo site_url('admin/payments/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="<?php echo site_url('admin/payments/add') ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                <label for="nama_payment">Nama Payment*</label>
                <input class="form-control <?php echo form_error('nama_payment') ? 'is-invalid':'' ?>" type="text" name="nama_payment", placeholder="Nama Payment"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nama_payment') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="no_rek">No. Rekening*</label>
                <input class="form-control <?php echo form_error('no_rek') ? 'is-invalid':'' ?>" type="text" name="no_rek", placeholder="No. Rekening"/>
                <div class="invalid-feedback">
                  <?php echo form_error('no_rek') ?>
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