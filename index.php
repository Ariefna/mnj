<?php
session_start(); 
ob_start();

include 'model/koneksi.php'; 

$waktu= getdate();
$waktu2= date("Y-m-d H:i:s");

if (isset($_SESSION['nama'])) {
	?>
	<?php
	if (isset($_GET['laporan'])) {
		if ($_GET['laporan'] == "laba-rugi") {
			require 'laba-rugi.php';
		}
		else {
			require 'neraca.php';
		}
	}elseif (isset($_SESSION['rule'])) {
		if ($_GET['page'] == "logout") {
			include 'view/logout.php';
		}
		include 'view/template/headerp.php';
		if ($_SESSION['rule'] == "kacab") {
			include 'view/kacab.php';
		}
		elseif ($_SESSION['rule'] == "keuangan") {
			include 'view/keuangan.php';
		}
		include 'view/template/footer.php';
	}
	else {
		?>
		<!-- Model -->
		<?php include 'model/db.php'; ?>
		<!-- Header -->
		<?php include 'view/template/header.php'; ?>
		<!-- Start alert -->
		<?php include 'view/template/alert.php'; ?>
		<!-- Begin Page Content -->
		<?php
		if(isset($_GET['page'])){
			$page=$_GET['page'];
			$halaman="view/$page.php";
			if($page == "restore"){
				include "view/404.php";
			}elseif ($page == "backup") {
				include 'model/backup.php';
				include 'view/RestoreBackup.php';
			}elseif (!file_exists($halaman) || empty($page)) {
				include "view/404.php";
			}
			else{
				include "$halaman";
			}
		}else{
			include 'view/home.php';
		}
		?>
		<!-- Footer -->
		<?php include 'view/template/footer.php'; ?>
		<!-- End of Footer -->
		<?php
	}}
	elseif (isset($_GET['laporan'])) {
		if ($_GET['laporan'] == "laba-rugi") { require 'laba-rugi.php'; }
		else require 'neraca.php';
	}
	else {
		include 'view/login.php';

	}
	?>
