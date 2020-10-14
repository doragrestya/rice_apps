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
            <a href="<?php echo site_url('admin/sliders/add') ?>"><i class="fas fa-plus"></i> Add New</a>
          </div>
          <div class="card-body">

            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                            <tr>
                              <th>Gambar</th>
                              <th>Keterangan</th>
                              <th>Action</th>
                            </tr>
                          </thead>
                <tbody>
                  <?php foreach ($sliders as $slider): ?>
                  <tr>
          
                              <td>
                                <img src="<?php echo base_url('upload/slider/'.$slider->image_slider) ?>" width="64"/>
                              </td>
                              <td>
                                <?php echo $slider->keterangan ?>
                              </td>
                              
                              <td width="250">
                                <a href="<?php echo site_url('admin/sliders/edit/'.$slider->id_slider)?>"
                                  class="btn btn-success"><i class="fas fa-edit"></i></a>
                                  <a onclick="deleteConfirm('<?php echo site_url('admin/sliders/delete/'.$slider->id_slider)?>')" href="#!" class="btn btn-danger"><i class="fas fa-trash"></i></a>
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