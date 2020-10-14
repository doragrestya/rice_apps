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

        <!-- DataTables -->
        <div class="card mb-3">
          <div class="card-header">
            <a href="<?php echo site_url('admin/users/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Username</th>
                              <th>Fullname</th>
                              <th>Photo</th>
                              <th>No. HP</th>
                              <th>Email</th>
                              <th>Password</th>
                              <th>Role</th>
                              <th>Created_at</th>
                              <th>Update_at</th>
                              <th>Last Login</th  >
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($users as $user): ?>
                  <tr>
                              <td width="150">
                                <?php echo $user->username_user?>
                              </td>
                              <td>
                                <?php echo $user->fullname_user ?>
                              </td>
                              <td>
                                <img src="<?php echo base_url('upload/user/'.$user->photo_user) ?>" width="64"/>
                              </td>
                              <td>
                                <?php echo $user->nohp_user ?>
                              </td>
                              <td>
                                <?php echo $user->email_user ?>
                              </td>
                              <td width="10">
                                <?php echo $user->password_user ?>
                              </td>
                              <td>
                                <?php echo $user->role ?>
                              </td>
                              <td>
                                <?php echo $user->created_at ?>
                              </td>
                              <td>
                                <?php echo $user->update_at ?>
                              </td>
                              <td>
                                <?php echo $user->last_login ?>
                              </td>
                              <td width="250">
                                <a href="<?php echo site_url('admin/users/edit/'.$user->id_user)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i>Edit</a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/users/delete/'.$user->id_user)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i>Hapus</a>
                              </td>
                            </tr>
                  <?php endforeach; ?>

                </tbody>
              </table>
            </div>
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
  <?php $this->load->view("admin/_partials/modal.php") ?>

  <?php $this->load->view("admin/_partials/js.php") ?>

  <script>
function deleteConfirm(url){
  $('#btn-delete').attr('href', url);
  $('#deleteModal').modal();
}
</script>

</body>

</html>