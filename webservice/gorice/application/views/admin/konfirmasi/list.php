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
            <a href="<?php echo site_url('admin/konfirmasis/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Id Checkout</th>
                              <th>Nama Konsumen</th>
                              <th>Notelp</th>
                              <th>Jumlah Transfer</th>
                              <th>Image</th>
                              <th>Tanggal</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($konfirmasis as $konfirmasi): ?>
                  <tr>
                              <td width="150">
                                <?php echo $konfirmasi->id_checkout ?>
                              </td>

                              <td width="150">
                                <?php echo $konfirmasi->nama_konsumen ?>
                              </td>

                              <td width="150">
                                <?php echo $konfirmasi->notelp ?>
                              </td>

                              <td width="150">
                                <?php echo $konfirmasi->jumlah_transfer ?>
                              </td>

                              <td>
                                <img src="<?php echo base_url('upload/transfer/'.$konfirmasi->image) ?>" width="64"/>
                              </td>

                              <td width="150">
                                <?php echo $konfirmasi->tanggal ?>
                              </td>
                              
                              <td width="250">
                                <a href="<?php echo site_url('admin/konfirmasis/edit/'.$konfirmasi->id_konfirmasi)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i></a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/konfirmasis/delete/'.$konfirmasi->id_konfirmasi)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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