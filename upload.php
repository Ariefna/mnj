<?php include 'model/koneksi.php'; ?>
<?php
session_start();
// file name
$target_dir = "uploads/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$docFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
// Check if file already exists
if(file_exists($target_file)) unlink($target_file);
// if (file_exists($target_file)) {
// 	$alert =  "Sorry, file already exists.";
// 	$jenis_alert = "danger";
// 	$uploadOk = 0;
// }
if ($uploadOk == 0) {
	$alert =  "Sorry, your file was not uploaded.";
	$jenis_alert = "danger";
  // if everything is ok, try to upload file
} else {
	if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
  // unset($_SESSION['gagal']);
		$sukses = "The file ". basename( $_FILES["fileToUpload"]["name"]). " has been uploaded.";
	} else {
		$uploadOk = 0;
		$alert =  "Sorry, there was an error uploading your file.";
		$jenis_alert = "danger";
		// print_r($_FILES);
	}
}
if ($uploadOk == 1) {
	$alert =  "YES, there was an error uploading your file.";
	$jenis_alert = "danger";
}
set_include_path(get_include_path() . PATH_SEPARATOR . 'Classes/');
include 'PHPExcel/IOFactory.php';
$inputFileName = './'.$target_file;
try {
	$objPHPExcel = PHPExcel_IOFactory::load($inputFileName);
} catch(Exception $e) {
	die('Error loading file "'.pathinfo($inputFileName,PATHINFO_BASENAME).'": '.$e->getMessage());
}
$sheet = $objPHPExcel->getSheet(0);
$data = $objPHPExcel->getActiveSheet()->toArray(null,true,true,true);
$baris = $sheet->getHighestRow();
for ($i=2; $i<=$baris; $i++)
{
	$id_admin = $_SESSION['id_admin'];
	$kode_transaksi=$data[$i]['E'];
	$Kode_Pelanggan=$data[$i]['K'];
	$date= $data[$i]['F']; //dd/mm/yy
	$mm=substr($date, 0, 2);
	$dd=substr($date, 3, 2);
	$yy=substr($date, 6, 2);
$tanggal_transaksi= "20".$yy."-".$mm."-".$dd; // yyyy-mm-dd.

$keterangan_transaksi=ucwords($data[$i]['G'].$data[$i]['H']);
$kode_rekening=$data[$i]['A'];
$posisi=$data[$i]['I'];
if($posisi==''){
	$dk=$data[$i]['J'];
	$posisi="kredit";
}else{
	$dk=$data[$i]['I'];
	$posisi="debet";
}
$BU = $data[$i]['E'];
$query=mysqli_query($conn,"insert into tabel_transaksi(kode_transaksi,kode_rekening,tanggal_transaksi, jenis_transaksi, keterangan_transaksi,".$posisi.",id_admin, Kode_Pelanggan)
	values('$kode_transaksi','$kode_rekening','$tanggal_transaksi','$BU','$keterangan_transaksi','$dk','$id_admin', '$Kode_Pelanggan')");
}
if($query){
	$jenis_alert = "success";
	$alert = "Sukses Import Data Excel";
}else{
	$jenis_alert = "danger";
	$alert = mysqli_error($conn);
}
$jsone = array(
	'jenis_alert' => $jenis_alert,
	'alert'   => $alert
);
$response = json_encode($jsone);
echo $response;