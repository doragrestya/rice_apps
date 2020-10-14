<!DOCTYPE html>
<html lang="en">
<head>
  <?php $this->load->view("admin/_partials/head.php") ?>
</head>
<body id="page-top">

  <?php $this->load->view("admin/_partials/sidebar.php") ?>


    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

      <div class="container-wrapper">
             <?php $this->load->view("admin/_partials/navbar.php") ?>

             <div class="container-fluid">
              
              <div class="alert alert-primary" role="alert">
               <i class="fas fa-fw fa-tachometer-alt"></i>
                <h7>Dashboard</h7>
              </div>

              <div class="alert alert-primary" role="alert">
                <h4>Selamat Datang</h4><i class="fas fa-laugh-wink"></i>
                <h7>Selamat Datang di Sistem GoRice!</h7>
              </div>

             </div>
        </div>
      </div>
     <!-- End of Content Wrapper -->
  <!-- Logout Modal-->
  

  <!-- Bootstrap core JavaScript-->
  
<?php $this->load->view("admin/_partials/modal.php") ?>
<?php $this->load->view("admin/_partials/scrolltop.php") ?>
<?php $this->load->view("admin/_partials/js.php") ?>


</body>

</html>
