<?php
if(isset($_POST['username'])){
  $username=htmlentities((trim($_POST['username'])));
  $password=htmlentities(md5($_POST['password']));
  $login=mysqli_query($conn,"select * from tabel_admin where username='$username' and password='$password'");
  $cek_login=mysqli_num_rows($login);
  if (empty($cek_login))
  {
    ?><script language="javascript">alert("Username atau password salah");</script><?php
  }else{
    while ($row=mysqli_fetch_array($login))
    {

      $id_admin=$row['id_admin'];
      $nama=$row['nama'];
      $tanggal=$row['tanggal'];
      $_SESSION['id_admin']=$id_admin;
      $_SESSION['nama']=$nama;
      $_SESSION['sts']=$row['status'];
      $_SESSION['tanggal']=$tanggal;
      mysqli_query($conn,"update tabel_admin set tanggal='$waktu2' where id_admin='$id_admin'");
      if ($nama == "kacab") {
        $_SESSION['rule'] = "kacab";
      }elseif ($nama == "keuangan") {
        $_SESSION['rule'] = "keuangan";
      }
    }
    ?>
    <script language="javascript">document.location.href="?page=home";</script>
    <?php
  }
}else{
  unset($_POST['username']);


}
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>PT. Metatu Nusantara Jaya - Login</title>
	<link rel="icon" type="image/png" href="img/LOGO-MNJ2.jpg">

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.css" rel="stylesheet">

</head>

<body class="bg-gradient-gray">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-4 col-lg-4 col-md-9">

        <div style="background-color: #fff" class="card o-hidden border-0 my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <!-- <div class="col-lg-6 d-none d-lg-block bg-login-image"></div> -->
              <div class="col-lg-12">
                <div class="p-4">
                  <div class="text-center">
                    <img class="img-fluid login-img" src="img/LOGO-MNJ2.jpg" alt="" width="100px"><br><br>
                  </div>
                  <form class="user" method="POST" action="">
                    <div class="form-group">
                      <input name="username" id="username" type="text" class="form-control" id="exampleInputEmail" placeholder="Username" autofocus>
                    </div>
                    <div class="form-group">
                      <input name="password" type="password" class="form-control" id="password-field" placeholder="Password">
                      <span toggle="#password-field" style="padding:8px"  class="fa fa-fw fa-eye field-icon toggle-password"></span>
                    </div>
                    <!-- <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div> -->
                    <button class="btn btn-primary btn-block" id="btn-login">
                      Login
                    </button>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>
  <script>$(".toggle-password").click(function() {
    var input = $($(this).attr("toggle"));
    $(this).toggleClass("fa-eye fa-eye-slash");
    if (input.attr("type") == "password") {
      input.attr("type", "text");
    } else {
      input.attr("type", "password");
    }
  });
  if (localStorage.checkBoxValidation && localStorage.checkBoxValidation != '') {
    $('#customCheck').attr('checked', 'checked');
    $('#username').val(localStorage.userName);
    $('#password').val(localStorage.password);
  } else {
    $('#customCheck').removeAttr('checked');
    $('#username').val('');
    $('#password').val('');
  }
  $('#customCheck').click(function() {
    if ($('#customCheck').is(':checked')) {
            // save username and password
            localStorage.userName = $('#username').val();
            localStorage.password = $('#password').val();
            localStorage.checkBoxValidation = $('#customCheck').val();
          } else {
            localStorage.userName = '';
            localStorage.password = '';
            localStorage.checkBoxValidation = '';
          }
        });
      </script>

    </body>

    </html>
