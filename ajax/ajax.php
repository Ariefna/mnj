<?php
session_start();
include '../model/koneksi.php';
if (isset($_GET['jurnal'])) {
	if(isset($_POST['simpan'])){
		$id_admin = $_SESSION['id_admin'];
		$kode_transaksi=$_POST['kode_bukti'];
		$tanggal_transaksi=$_POST['tanggal_transaksi'];
		$keterangan_transaksi=ucwords($_POST['keterangan_transaksi']);
		$kode_rekening=$_POST['kode_rekening'];
		$posisi=$_POST['posisi'];
		$jumlah_dk=ucwords($_POST['jumlah_dk']);
		if($posisi=='debet'){
			$dk='debet';
		}else{
			$dk='kredit';
		}
		$query=mysqli_query($conn,"insert into tabel_transaksi(kode_transaksi,kode_rekening,tanggal_transaksi, jenis_transaksi, keterangan_transaksi,".$dk.",id_admin)
			values('$kode_transaksi','$kode_rekening','$tanggal_transaksi','Bukti Umum','$keterangan_transaksi','$jumlah_dk','$id_admin')");
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
	}
	if (isset($_GET['delete'])) {
		$query=mysqli_query($conn,"DELETE FROM `tabel_transaksi` WHERE `tabel_transaksi`.`id_transaksi` = ".$_GET['delete']);
	}
}
if (isset($_GET['perkiraan'])) {
	if (isset($_POST['field'])) {
		$field = $_POST['field'];
		$value = $_POST['value'];
		$editid = $_POST['id'];
		$qy = "UPDATE `tabel_master` SET `".$field."` = '".$value."' WHERE `tabel_master`.`kode_rekening` = '".$editid."'";
		$query = mysqli_query($conn, $qy);
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Update Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
	}
}
if (isset($_GET['userset'])) {
	if (isset($_POST['ubah'])) {
		$nama = $_POST['nama'];
		$id = $_POST['id'];
		$username = $_POST['username'];
		if ($_POST['Password'] == null) {
			$password = "";
		}else {
			$password = md5($_POST['Password']);
		}
		$hiddPassword = $_POST['hiddPassword'];
		$akses = $_POST['akses'];
		$oldPassword = md5($_POST['oldPassword']);
		if ($password == "") {
			$qwr = "UPDATE `tabel_admin` SET `nama` = '$nama', `username` = '$username', `status` = '$akses' WHERE `tabel_admin`.`id_admin` = ".$id;
		}else {
			if ($hiddPassword == $oldPassword) {
				$qwr = "UPDATE `tabel_admin` SET `nama` = '$nama', `username` = '$username', `password` = '$password', `status` = '$akses' WHERE `tabel_admin`.`id_admin` = ".$id;
			}
			else {
				$jenis_alert = "danger";
				$alert = mysqli_error($conn);
			}
		}
		$query = mysqli_query($conn, $qwr);
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Update Data User";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
	}
	if (isset($_POST['insert'])) {
		$nama = $_POST['nama'];
		$username = $_POST['username'];
		$akses = $_POST['akses'];
		$password = md5($_POST['password']);
		$date = date("YYYY-MM-DD HH:MI:SS");
		$qwr = "INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `tanggal`, `status`) VALUES (NULL, '$nama', '$username', '$password', '', '$akses')";
		$query = mysqli_query($conn, $qwr);
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";

		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);

		}
	}
	if (isset($_GET['delete'])) {
		$id = $_GET['delete'];
		$qwr = "DELETE FROM `tabel_admin` WHERE `tabel_admin`.`id_admin` = ".$id;
		$query = mysqli_query($conn, $qwr);
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Delete Data User";

		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);

		}
	}
}




$jsone = array(
	'jenis_alert' => $jenis_alert,
	'alert'   => $alert
);
$response = json_encode($jsone);
echo $response;
?>
