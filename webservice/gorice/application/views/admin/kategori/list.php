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
            <a href="<?php echo site_url('admin/kategoris/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Nama Kategori</th>
                              <th>Keterangan</th>
                              <th>Icon Kategori</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($kategoris as $kategori): ?>
                  <tr>
                              <td width="150">
                                <?php echo $kategori->nama_kategori ?>
                              </td>
                              <td class="small">
                                <?php echo substr($kategori->keterangan, 0, 120) ?>...
                              </td>
                              <td>
                                <img src="<?php echo base_url('upload/kategori/'.$kategori->icon_kategori) ?>" width="64"/>
                              </td>
                              
                              <td width="250">
                                <a href="<?php echo site_url('admin/kategoris/edit/'.$kategori->id_kategori)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i></a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/kategoris/delete/'.$kategori->id_kategori)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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