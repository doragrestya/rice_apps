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
            <a href="<?php echo site_url('admin/konsumens/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Fullname</th>
                              <th>Email</th>
                              <th>Password</th>
                              <th>No. HP</th>
                              <th>Alamat</th>
                              <th>Photo</th>
                              <th>Created at</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($konsumens as $konsumen): ?>
                  <tr>
                              <td>
                                <?php echo $konsumen->fullname_konsumen ?>
                              </td>

                              <td width="100">
                                <?php echo $konsumen->email_konsumen ?>
                              </td>

                              <td width="100">
                                <?php echo $konsumen->password_konsumen ?>
                              </td>

                              <td>
                                <?php echo $konsumen->nohp_konsumen ?>
                              </td>

                              <td>
                                <?php echo $konsumen->alamat_konsumen ?>
                              </td>

                              <td>
                                <img src="<?php echo base_url('upload/konsumen/'.$konsumen->photo_konsumen) ?>" width="64"/>
                              </td> 
                              <td width="100">
                                <?php echo $konsumen->created_at ?>
                              </td>

                              <td width="270">
                                <a href="<?php echo site_url('admin/konsumens/edit/'.$konsumen->id_konsumen)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i>Edit</a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/konsumens/delete/'.$konsumen->id_konsumen)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i>Hapus</a>
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