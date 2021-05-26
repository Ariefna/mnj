<?php
date_default_timezone_set("Asia/Jakarta");
$tanggal = date("Y-m-d");

$qury = "SELECT * FROM `manual_book`";
$qc = mysqli_query($conn, $qury);
$hasil = mysqli_fetch_array($qc);
$keterangan = $hasil['keterangan'];

if (isset($_POST['submit'])) {
  $dch = "UPDATE `manual_book` SET `keterangan` = '".$_POST['keterangan']."' WHERE `id_manual` = 1";
	$query = mysqli_query($conn, $dch);
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";

	echo '<script language="javascript">window.location.assign("?page=manualbook")</script>';
}else {
	$dch = "SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'akutansi_db' AND   TABLE_NAME   = 'table_sp';";
	$query = mysqli_query($conn, $dch);
	$id = mysqli_fetch_array($query);
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Manual Book Android</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Input Manual Book Android</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
                <label for="inputAddress">Keterangan</label>
                <textarea class="textarea" placeholder="Place some text here" style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" name="keterangan" required><?php echo $keterangan; ?></textarea>
							</div>
						</div>
            <br>
						<center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="window.location.href=?psn=+i;">Simpan</button></center>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<script>

</script>
