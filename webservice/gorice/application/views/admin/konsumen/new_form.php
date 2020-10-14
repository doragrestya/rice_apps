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
            <a href="<?php echo site_url('admin/konsumens/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="<?php echo site_url('admin/konsumens/add') ?>" method="post" enctype="multipart/form-data">

              <div class="form-group">
                <label for="fullname_konsumen">Fullname*</label>
                <input class="form-control <?php echo form_error('fullname_konsumen') ? 'is-invalid':'' ?>" type="text" name="fullname_konsumen", placeholder="Fullname"/>
                <div class="invalid-feedback">
                  <?php echo form_error('fullname_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Email*</label>
                <textarea class="form-control <?php echo form_error('email_konsumen') ? 'is-invalid':'' ?>" type="text" name="email_konsumen", placeholder="Email"></textarea>
                <div class="invalid-feedback">
                  <?php echo form_error('email_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Password*</label>
                <textarea class="form-control <?php echo form_error('password_konsumen') ? 'is-invalid':'' ?>" type="text" name="password_konsumen", placeholder="Password"></textarea>
                <div class="invalid-feedback">
                  <?php echo form_error('password_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">No.HP*</label>
                <input class="form-control <?php echo form_error('nohp_konsumen') ? 'is-invalid':'' ?>" type="number" name="nohp_konsumen", placeholder="No.HP"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nohp_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Alamat*</label>
                <input class="form-control <?php echo form_error('alamat_konsumen') ? 'is-invalid':'' ?>" type="text" name="alamat_konsumen", placeholder="Alamat"/>
                <div class="invalid-feedback">
                  <?php echo form_error('alamat_konsumen') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Photo*</label>
                <input class="form-control-file <?php echo form_error('photo_konsumen') 
                    ? 'is-invalid':'' ?>" 
                 type="file" name="photo_konsumen"/>
                <div class="invalid-feedback">
                  <?php echo form_error('photo_konsumen') ?>
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