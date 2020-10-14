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
            <a href="<?php echo site_url('admin/products/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Nama</th>
                              <th>Harga</th>
                              <th>Stok</th>
                              <th>Gambar</th>
                              <th>Detail</th>
                              <th>Total Jual</th>
                              <th>Kategori</th>
                              <th>Konsumen</th>
                              <th>Satuan</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($products as $product): ?>
                  <tr>
                              <td width="150">
                                <?php echo $product->nama_produk ?>
                              </td>
                              <td>
                                <?php echo $product->harga_produk ?>
                              </td>
                              <td>
                                <?php echo $product->stok_produk ?>
                              </td>
                              <td>
                                <img src="<?php echo base_url('upload/product/'.$product->gambar_produk) ?>" width="64"/>
                              </td>
                              <td width="270">
                                <?php echo substr($product->detail_produk, 0, 120) ?>...
                              </td>

                              <td>
                                <?php echo $product->total_jual?>
                              </td>

                              <td width="150">
                                <?php echo $product->nama_kategori ?>
                              </td>

                              <td width="150">
                                <?php echo $product->fullname_konsumen ?>
                              </td>

                              <td width="150">
                                <?php echo $product->nama_satuan ?>
                              </td>
                        
                              <td width="150">
                                <a href="<?php echo site_url('admin/products/edit/'.$product->id_produk)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i></a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/products/delete/'.$product->id_produk)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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