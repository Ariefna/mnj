<?php
$query_hitung_mutasi=mysqli_query($conn,"select kode_rekening from tabel_transaksi where keterangan_posting='Post' group by kode_rekening");
// $query_hitung_mutasi=mysqli_query($conn,"select kode_rekening from tabel_master");
if (isset($_GET['mode'])) {
	$mode = $_GET['mode'];
}else {
	$mode = $waktu['year'];
}
while($row_hit_mut=mysqli_fetch_array($query_hitung_mutasi)){
	$kode_rekening=$row_hit_mut['kode_rekening'];
	$kndknv = "update tabel_master set mut_debet=(SELECT sum(debet) FROM tabel_transaksi WHERE kode_rekening ='$kode_rekening' and keterangan_posting='Post' and year(tanggal_transaksi) = $mode group by kode_rekening), mut_kredit=(SELECT sum(kredit) FROM tabel_transaksi WHERE kode_rekening ='$kode_rekening' and keterangan_posting='Post' and year(tanggal_transaksi) = $mode group by kode_rekening) where kode_rekening='$kode_rekening';";
	$update_mutasi=mysqli_query($conn,$kndknv);
}
if($query_hitung_mutasi){
	$query_hitung_sisa=mysqli_query($conn,"select  * from tabel_master");
	while($row_hit_sisa=mysqli_fetch_array($query_hitung_sisa)){
		$normal=$row_hit_sisa['normal'];
		$kode_rekening=$row_hit_sisa['kode_rekening'];
		$awal_debet=$row_hit_sisa['awal_debet'];
		$awal_kredit=$row_hit_sisa['awal_kredit'];
		$mutasi_debet=$row_hit_sisa['mut_debet'];
		$mutasi_kredit=$row_hit_sisa['mut_kredit'];
		if($normal=="Debit"){
			$hitung_sisa_debet=($awal_debet+$mutasi_debet)-$mutasi_kredit;
			if($hitung_sisa_debet<0){
				$positif_sisa_kredit=abs($hitung_sisa_debet);
				$update_mutasi=mysqli_query($conn,"update tabel_master set sisa_debet=0, sisa_kredit='$positif_sisa_kredit' where kode_rekening='$kode_rekening'");
			}else{
				$update_mutasi=mysqli_query($conn,"update tabel_master set sisa_debet='$hitung_sisa_debet', sisa_kredit='0' where kode_rekening='$kode_rekening'");
			}
		}
		if($normal=="Kredit"){
			$hitung_sisa_kredit=($awal_kredit-$mutasi_debet)+$mutasi_kredit;
			if($hitung_sisa_kredit<0){
				$positif_sisa_debet=abs($hitung_sisa_kredit);
				$update_mutasi=mysqli_query($conn,"update tabel_master set sisa_debet='$positif_sisa_debet', sisa_kredit='0' where kode_rekening='$kode_rekening'");
			}else{
				$update_mutasi=mysqli_query($conn,"update tabel_master set sisa_debet=0, sisa_kredit='$hitung_sisa_kredit' where kode_rekening='$kode_rekening'");
			}
		}
	}
}
$master=mysqli_query($conn, "select * from tabel_master");
while($row=mysqli_fetch_array($master)){
	$posisi=$row['posisi'];
	$sisa_debet=$row['sisa_debet'];
	$sisa_kredit=$row['sisa_kredit'];
	$kode_rekening=$row['kode_rekening'];

	if($posisi=='Laba Rugi'){
				//update rugi laba
		$update=mysqli_query($conn, "update tabel_master set rl_debet='$sisa_debet', rl_kredit='$sisa_kredit' where kode_rekening='$kode_rekening'");
	}else{
				//update neraca
		$update=mysqli_query($conn, "update tabel_master set nrc_debet='$sisa_debet', nrc_kredit='$sisa_kredit' where kode_rekening='$kode_rekening'");
	}
}
$hapus_tabel_temporial=mysqli_query($conn, "DELETE FROM `tabel_rugi_laba`");
if($hapus_tabel_temporial){
			//1. Tahap Penginputan
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba SELECT `kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal` FROM `tabel_master` where posisi = 'Laba Rugi'");
			//2. Tahap Perhitungan
	$query_jumlah=mysqli_fetch_array(mysqli_query($conn, "select sum(rl_debet) as debet_rl, sum(rl_kredit) as kredit_rl from tabel_rugi_laba"));
	$debet_rl=$query_jumlah['debet_rl'];
	$kredit_rl=$query_jumlah['kredit_rl'];
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba(kode_rekening, nama_rekening, rl_kredit) values('III','JUMLAH PENDAPATAN', '$debet_rl')");
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba(kode_rekening, nama_rekening, rl_debet) values('IV','JUMLAH BIAYA','$kredit_rl')");
	$pendapatan=$debet_rl;
	$biaya=$kredit_rl;
	$hitung_rl_debet=$debet_rl-$kredit_rl;
	$sisa_hasil_usaha=$hitung_rl_debet;
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba(kode_rekening, nama_rekening, rl_debet) values('V','Sisa Hasil Usaha Tahun Berjalan','$hitung_rl_debet')");
	$hitung_rl_biaya_shu=$biaya+$sisa_hasil_usaha;
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba(kode_rekening, nama_rekening,rl_debet,rl_kredit) values('VI','Total Balance', '$hitung_rl_biaya_shu','$pendapatan')");

			//4. Simpan tanggal periode
	mysqli_query($conn, "INSERT INTO tabel_rugi_laba(kode_rekening, nama_rekening, tanggal_awal) values('VII','TAHUN PERIODE', '$mode')");

}else{
	echo mysqli_error($conn);
}
$hapus_tabel_temporial=mysqli_query($conn, "DELETE FROM `tabel_neraca`");
if($hapus_tabel_temporial){
	mysqli_query($conn, "INSERT INTO tabel_neraca SELECT `kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal` FROM `tabel_master` where posisi = 'Neraca'");
	$update=mysqli_query($conn, "update tabel_neraca set nrc_debet='$hitung_rl_debet', nrc_kredit='0' where kode_rekening='3402.01.09'");
}else{
	echo mysqli_error($conn);
}
$_SESSION['status'] = '0';
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<title>PT. Metatu Nusantara Jaya</title>
	<link rel="icon" type="image/png" href="img/LOGO-MNJ2.jpg">
	<!-- summernote -->
	<link rel="stylesheet" href="https://lenteraid.my.id/kumpulan-asset/plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<!-- Custom fonts for this template-->
	<link href="https://lenteraid.my.id/kumpulan-asset/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<!-- <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"> -->
	<!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet"> -->
	<link href="https://lenteraid.my.id/kumpulan-asset/css/font.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.18/b-1.5.6/b-colvis-1.5.6/b-flash-1.5.6/b-html5-1.5.6/b-print-1.5.6/datatables.min.css"/>
	<!-- Custom styles for this template-->
	<link href="https://lenteraid.my.id/kumpulan-asset/css/sb-admin-2.css" rel="stylesheet">
	<!-- <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script> -->
	<script src="https://lenteraid.my.id/kumpulan-asset/vendor/jquery/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-iBBXm8fW90+nuLcSKlbmrPcLa0OT92xO1BIsZ+ywDWZCvqsWgccV3gFoRBv0z+8dLJgyAHIhR35VZc2oM/gI1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<style>
		.heade {
			margin-top: -3px;
			margin-left: -3px;
			margin-right: -3px;
		}
		.bgg {
			background-color: #eeeeee ;
		}
	</style>
</head>
<!-- <body id="page-top" oncontextmenu="return false;"> -->
	<body id="page-top">
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!-- Sidebar -->
			<ul class="navbar-nav sidebar sidebar-light accordion toggled" id="accordionSidebar" aria-expanded="false">
				<!-- Sidebar - Brand -->
				<div class="bg-success heade">
					<a class="sidebar-brand d-flex align-items-center justify-content-center" href=".">
						<div class="sidebar-brand-icon">
							<img src="img/LOGO-MNJ2.jpg" alt="" width="50px">
						</div>
						<div class="sidebar-brand-text text-light mx-3">Admin Panel</div>
					</a>
				</div>
				<!-- Nav Item - Dashboard -->
				<?php include 'view/template/navbar.php'; ?>
				<!-- End of Sidebar -->
				<!-- Content Wrapper -->
				<div id="content-wrapper" class="d-flex flex-column">
					<!-- Main Content -->
					<div id="content">
						<!-- Topbar -->
						<nav class="navbar navbar-expand bg-success navbar2 topbar mb-4 static-top">
							<!-- Sidebar Toggle (Topbar) -->
							<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
								<i class="fa fa-bars text-light"></i>
							</button>
							<!-- Topbar Search -->
							<!-- Topbar Navbar -->
							<ul class="navbar-nav ml-auto">
								<!-- Nav Item - Search Dropdown (Visible Only XS) -->
								<li class="nav-item dropdown no-arrow d-sm-none">
									<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<i class="fas fa-search text-light fa-fw"></i>
									</a>
									<!-- Dropdown - Messages -->
									<div class="dropdown-menu dropdown-menu-right p-3 animated--grow-in" aria-labelledby="searchDropdown">
										<form class="form-inline mr-auto w-100 navbar-search">
											<div class="input-group">
												<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
												<div class="input-group-append">
													<button class="btn btn-primary" type="button">
														<i class="fas fa-search fa-sm"></i>
													</button>
												</div>
											</div>
										</form>
									</div>
								</li>

								<!-- Nav Item - User Information -->
								<li class="nav-item dropdown no-arrow">
									<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<span class="mr-2 d-none d-lg-inline text-light small"><?php echo $_SESSION['nama']; ?></span>
										<img class="img-profile rounded-circle" src="img/undraw_profile_pic_ic5t.svg">
									</a>
									<!-- Dropdown - User Information -->
									<div class="dropdown-menu dropdown-menu-right animated--grow-in" aria-labelledby="userDropdown">
										<!-- <a class="dropdown-item" href="#">
											<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
											Profile
										</a>
										<a class="dropdown-item" href="#">
											<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
											Settings
										</a>
										<a class="dropdown-item" href="#">
											<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
											Activity Log
										</a>
										<div class="dropdown-divider"></div> -->
										<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
											<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
											Logout
										</a>
									</div>
								</li>

							</ul>

						</nav>
						<!-- End of Topbar -->
						<!-- modal SP -->
						<div class="modal" id="myModal" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Zona Berapa?</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form method="GET" action="">
										<div class="modal-body">
											<input type="hidden" value="suratpesanan" name="page">
											<!-- <input name="zona" type="number" class="form-control"> -->
											<select name="zona" class="form-control">
												<option value="1">Harga Zona 1</option>
												<option value="2">Harga Zona 2</option>
												<option value="3">Harga Zona 3</option>
												<option value="4">Harga Zona 4</option>
											</select>

										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Pilih</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- modal SP -->
						<!-- modal order pembelian -->
						<div class="modal" id="myModal2" tabindex="-1" role="dialog">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Beli Berapa?</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<form method="GET" action="">
										<div class="modal-body">
											<input type="hidden" value="orderbeli" name="page">
											<input name="psn" type="text" class="form-control">
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Save changes</button>
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!-- modal order pembelian -->
