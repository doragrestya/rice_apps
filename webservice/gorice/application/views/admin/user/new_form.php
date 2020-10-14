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
            <a href="<?php echo site_url('admin/users/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="<?php echo site_url('admin/users/add') ?>" method="post" enctype="multipart/form-data">
              <div class="form-group">
                
                <label for="username">Username*</label>
                <input class="form-control <?php echo form_error('username_user') ? 'is-invalid':'' ?>" type="text" name="username_user", placeholder="Username"/>
                <div class="invalid-feedback">
                  <?php echo form_error('username') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="fullname_user">Fullname*</label>
                <input class="form-control <?php echo form_error('fullname_user') ? 'is-invalid':'' ?>" type="text" name="fullname_user", placeholder="Fullname"/>
                <div class="invalid-feedback">
                  <?php echo form_error('fullname_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Photo*</label>
                <input class="form-control-file <?php echo form_error('photo_user') 
                    ? 'is-invalid':'' ?>" 
                 type="file" name="photo_user"/>
                <div class="invalid-feedback">
                  <?php echo form_error('photo_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">No.HP*</label>
                <input class="form-control <?php echo form_error('nohp_user') ? 'is-invalid':'' ?>" type="number" name="nohp_user", placeholder="No.HP"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nohp_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Email*</label>
                <input class="form-control <?php echo form_error('email_user') ? 'is-invalid':'' ?>" name="email_user", placeholder="Email"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('email_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Password*</label>
                <input class="form-control <?php echo form_error('password_user') ? 'is-invalid':'' ?>" name="password_user", placeholder="Password"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('password_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Role*</label>
                <input class="form-control <?php echo form_error('role') ? 'is-invalid':'' ?>" name="role", placeholder="Role"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('role') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Is Active*</label>
                <input class="form-control <?php echo form_error('is_active') ? 'is-invalid':'' ?>" name="is_active", placeholder="Is Active"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('is_active') ?>
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