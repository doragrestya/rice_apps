<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login Admin</title>
    
    <!-- Bootstrap core CSS-->
    <link href="<?php echo base_url('css/sb-admin-2.min.css') ?>" rel="stylesheet">
</head>

<body class="bg-gradient-primary">
<div class="container">
    <div class="col-12 col-md-6 text-center mt-5 mx-auto p-4">
        <div class="card o-hidden border-0">
            <div class="p-5">
                <div class="text-center">
                    <h1 class="h4 text-white-900 mb-4">Login Admin</h1>
                  </div>
                        <form action="<?= site_url('admin/login') ?>" method="POST">
                            <div class="form-group">
                                <input type="text" class="form-control form-control-user" name="email" placeholder="Email.." required />
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control form-control-user" name="password" placeholder="Password.." required />
                            </div>
                            <div class="form-group">
                                <input type="submit" class="btn bg-gradient-primary  btn-user btn-block" value="LOGIN" />
                            </div>
                        </form>
                 </div>
             </div>
         </div>
     </div>

 </body>
</html>






