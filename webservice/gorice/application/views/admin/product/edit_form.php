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
            <a href="<?php echo site_url('admin/products/') ?>"><i class="fas fa-arrow-left"></i> Back</a>
          </div>
          <div class="card-body">

            <form action="" method="post" enctype="multipart/form-data">

              <input type="hidden" name="id" value="<?php echo $product->id_produk?>"/>

              <div class="form-group">
                <label for="nama_produk">Nama Produk*</label>
                <input class="form-control <?php echo form_error('nama_produk') ? 'is-invalid':'' ?>" type="text" name="nama_produk", placeholder="Nama Produk" value="<?php echo $product->nama_produk ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('nama_produk') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="harga_produk">Harga Produk*</label>
                <input class="form-control <?php echo form_error('harga_produk') ? 'is-invalid':'' ?>" type="number" name="harga_produk", placeholder="Harga Produk" value="<?php echo $product->harga_produk ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('harga_produk') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Stok*</label>
                <input class="form-control <?php echo form_error('stok_produk') ? 'is-invalid':'' ?>" type="number" name="stok_produk", placeholder="Stok" value="<?php echo $product->stok_produk ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('stok_produk') ?>
                </div>
              </div>
              
              <div class="form-group">
                <label for="gambar_produk">Gambar*</label>
                <input class="form-control-file <?php echo form_error('gambar_produk') ? 'is-invalid':'' ?>" type="file" name="gambar_produk"/>
                <input type="hidden" name="old_image" value="<?php echo $product->gambar_produk ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('gambar_produk') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Detail Produk*</label>
                <textarea class="form-control <?php echo form_error('detail_produk') ? 'is-invalid':'' ?>" name="detail_produk", placeholder="Detail Produk..." ><?php echo $product->detail_produk ?></textarea>
                <div class="invalid-feedback">
                  <?php echo form_error('detail_produk') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Total Jual</label>
                <input class="form-control <?php echo form_error('total_jual') ? 'is-invalid':'' ?>" type="number" name="total_jual", placeholder="Total Jual" value="<?php echo $product->total_jual ?>"/>
                <div class="invalid-feedback">
                  <?php echo form_error('total_jual') ?>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Kategori</label>
                <div class="form-line">
                  <select name="kategori" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Kategori---</option>
                    <?php foreach ($dd_kategori as $dd_kategori) : ?>
                      <option value="<?php echo $dd_kategori->id_kategori ?>"><?php echo $dd_kategori->nama_kategori ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Konsumen</label>
                <div class="form-line">
                  <select name="konsumen" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Konsumen---</option>
                    <?php foreach ($dd_konsumen as $dd_konsumen) : ?>
                      <option value="<?php echo $dd_konsumen->id_konsumen ?>"><?php echo $dd_konsumen->fullname_konsumen ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label for="name">Satuan</label>
                <div class="form-line">
                  <select name="satuan" class="form-control" style="width: 300px">
                    <option value="---">---Pilih Satuan---</option>
                    <?php foreach ($dd_satuan as $dd_satuan) : ?>
                      <option value="<?php echo $dd_satuan->id_satuan ?>"><?php echo $dd_satuan->nama_satuan ?></option>
                    <?php endforeach ?>
                  </select>
                </div>
              </div>

              <input class="btn btn-success" type="submit" name="btn" value="Save"/>
            </form>
    
          </div>

          <div class="card-footer small text-muted">
            * required fields
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