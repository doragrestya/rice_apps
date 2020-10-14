<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-tree"></i>
        </div>
        <div class="sidebar-brand-text mx-3">GORICE</div>
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-tree"></i>
        </div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item <?php echo $this->uri->segment(2) == '' ? 'active': '' ?>">
        <a class="nav-link" href="<?php echo site_url('admin') ?>">
          <i class="fas fa-fw fa-home"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'sliders' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-spinner"></i>
          <span>Slider</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/sliders/add')?>">New Slider</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/sliders')?>">List Slider</a>
        </div>
      </li> 
      
      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'kategoris' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-list"></i>
          <span>Kategori</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/kategoris/add')?>">New Kategori</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/kategoris')?>">List Kategori</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'products' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-box"></i>
          <span>Produk</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/products/add')?>">New Product</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/products')?>">List Product</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'payments' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="far fa-money-bill-alt"></i>
          <span>Payment</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/payments/add')?>">New Payment</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/payments')?>">List Payment</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'shippings' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-truck"></i>
          <span>Shipping</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/shippings/add')?>">New Shipping</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/shippings')?>">List Shipping</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'konsumens' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-user"></i>
          <span>Konsumen</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/konsumens/add')?>">New Konsumen</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/konsumens')?>">List Konsumen</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'keranjangs' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-cart-arrow-down"></i>
          <span>Keranjang</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/keranjangs/add')?>">New Keranjang</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/keranjangs')?>">List Keranjang</a>
        </div>
      </li> 

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'statuss' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-spinner"></i>
          <span>Status Transaksi</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/statuss/add')?>">New Status Transaksi</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/statuss')?>">List Status Transaksi</a>
        </div>
      </li>     

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'orders' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-shopping-basket"></i>
          <span>Order</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/orders/add')?>">New Order</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/orders')?>">List Order</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'konfirmasis' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-file-alt"></i>
          <span>Konfirmasi</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/konfirmasis/add')?>">New Konfirmasi</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/konfirmasis')?>">List Konfirmasi</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'orders' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-tag"></i>
          <span>Satuan</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/satuans/add')?>">New Satuan</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/satuans')?>">List Satuan</a>
        </div>
      </li>

      <li class="nav-item dropdown <?php echo $this->uri-> segment(2) == 'orders' ? 'active': ''?>">
        <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-fw fa-users"></i>
          <span>User</span>
        </a>
        <div class="dropdown-menu" aria-labelledby="pagesDropdown">
          <a class="dropdown-item" href="<?php echo site_url('admin/users/add')?>">New User</a>
          <a class="dropdown-item" href="<?php echo site_url('admin/users')?>">List User</a>
        </div>
      </li>

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>