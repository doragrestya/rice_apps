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

            <form action="" method="post" enctype="multipart/form-data">

              <input type="hidden" name="id" value="<?php echo $user->id_user?>"/>

              <div class="form-group">
                <label for="username_user">Username*</label>
                <input class="form-control <?php echo form_error('username_user') ? 'is-invalid':'' ?>" type="text" name="username_user", placeholder="Username" value="<?php echo $user->username_user ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('username_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="fullname_user">Fullname*</label>
                <input class="form-control <?php echo form_error('fullname_user') ? 'is-invalid':'' ?>" type="text" name="fullname_user", placeholder="Fullname" value="<?php echo $user->fullname_user ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('fullname_user') ?>
                </div>
              </div>

  

              <div class="form-group">
                <label for="name">Photo*</label>
                <input class="form-control-file <?php echo form_error('photo_user') ? 'is-invalid':'' ?>" type="file" name="photo_user"/>
                <input type="hidden" name="old_image" value="<?php echo $user->photo_user ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('photo_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">No.HP*</label>
                <input class="form-control <?php echo form_error('nohp_user') ? 'is-invalid':'' ?>" type="number" name="nohp_user", placeholder="No.HP" value="<?php echo $user->nohp_user ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nohp_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Email*</label>
                <input class="form-control <?php echo form_error('email_user') ? 'is-invalid':'' ?>" name="email_user", placeholder="Email"  value="<?php echo $user->email_user ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('email_user') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Password*</label>
                <input class="form-control <?php echo form_error('password_user') ? 'is-invalid':'' ?>" name="password_user", placeholder="Password" value="<?php echo $user->password_user ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('password_user') ?>
                </div>
              </div>


              <div class="form-group">
                <label for="role">Role*</label>
                <input class="form-control <?php echo form_error('role') ? 'is-invalid':'' ?>" name="role", placeholder="Role" value="<?php echo $user->role ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('role') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="created_at">Created at*</label>
                <input class="form-control <?php echo form_error('created_at') ? 'is-invalid':'' ?>" name="created_at", placeholder="Created at" value="<?php echo $user->created_at ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('created_at') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="update_at">Update at*</label>
                <input class="form-control <?php echo form_error('update_at') ? 'is-invalid':'' ?>" name="update_at", placeholder="Update at" value="<?php echo $user->update_at ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('update_at') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="last_login">Last Login*</label>
                <input class="form-control <?php echo form_error('last_login') ? 'is-invalid':'' ?>" name="Last Login", placeholder="Created at" value="<?php echo $user->last_login ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('last_login') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="is_active">Is Active*</label>
                <input class="form-control <?php echo form_error('is_active') ? 'is-invalid':'' ?>" name="is_active", placeholder="Is Active" value="<?php echo $user->is_active ?>"></input>
                <div class="invalid-feedback">
                  <?php echo form_error('is_active') ?>
                </div>
              </div>

              

              <!-- <div class="form-group">
              <label for="name">Role*</label>

                <div class="col-sm-6">
                  <select id="role" class="form-control" name="role">
                    <option value="">Please Select</option>
                    <?php
                    $query = mysqli_query($con, "SELECT * FROM tb_user");
                    while($row = mysqli_fetch_array($query)){?>
                    <option id="role" value="<?php echo $row['role']; ?>">
                      <?php echo $row['role'];?>
                    </option>
                    <?php } ?>
                  </select>
                </div>
              </div> -->

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