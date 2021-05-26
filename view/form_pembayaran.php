<?php
if (isset($_GET['kodepl'])) {
	$qury = "SELECT kodepl, nama FROM  pelanggan  WHERE kodepl = '".$_GET['kodepl']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl=$hasil['kodepl'];
	$nama=$hasil['nama'];
}
if (isset($_POST['submit'])) {
    
    $sql = 'SELECT max(kode_pem) kode_pem FROM pembayaran';
	$query = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($query);
	$kode_pem = $row['kode_pem'];
	$hitung = intval($kode_pem)+1;;
	$bulan = date('m');
	$tahun = date('Y');
	if ($hitung>=1&&$hitung<=9) {
		$kode = "00".$hitung."/PAY-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=10&&$hitung<=99) {
		$kode = "0".$hitung."/PAY-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=100&&$hitung<=999) {
		$kode = $hitung."/PAY-PPP/".$bulan."/".$tahun;
	}
	$qury = "SELECT kodepl, nama FROM  pelanggan  WHERE kodepl = '".$_GET['kodepl']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl=$hasil['kodepl'];
	$nama=$hasil['nama'];
	if ($_POST['metode']==1) {
		$dch="INSERT INTO `pembayaran`(`kode_pem`, `kodepl`, `tanggal`, `kode_inv`, `jenis_transaksi`, `total_pem`, `keterangan`, status) VALUES ('".$kode."','".$_POST['kodepl']."','".$_POST['tanggal']."','".$_POST['kodeinv']."','".$_POST['metode']."','".$_POST['voucher1']."','".$_POST['totalp']."','Pembayaran ".$_POST['kodeinv']."', '0')";
	} else {
		$dch="INSERT INTO `pembayaran`(`kode_pem`, `kodepl`, `tanggal`, `kode_inv`, `jenis_transaksi`, `total_pem`, `keterangan`, status) VALUES ('".$kode."','".$_POST['kodepl']."','".$_POST['tanggal']."','".$_POST['kodeinv']."','".$_POST['voucher2']."','".$_POST['totalp']."','Pembayaran ".$_POST['kodeinv']."', '0')";
	}
	$query = mysqli_query($conn, $dch);
// 	$qu = "INSERT INTO `table_piutang` (`kodepiutang`, `kodepl`, `tanggal`, `keterangan`, `debet`, `kredit`) VALUES (NULL, '".$kodepl."', '".$_POST['tanggal']."', 'Pembayaran ".$_POST['kodeinv']."', '0', '".$_POST['totalp']."')";
// 	mysqli_query($conn, $qu);
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
	echo "<script language='javascript'>window.location.assign('?page=pembayaran');</script>";
}else {
	$dch = "SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'akutansi_db' AND   TABLE_NAME   = 'table_sp';";
	$query = mysqli_query($conn, $dch);
	$id = mysqli_fetch_array($query);
}
?>
<script>
	function btnSearch_Click() {

		document.getElementById("pbank").hidden = true;
		document.getElementById("pbank1").hidden = false;
	}
	function btnSearch_Click2() {

		document.getElementById("pbank").hidden = false;
		document.getElementById("pbank1").hidden = true;
	}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Pembayaran</h1>
	</div>
	<form action="" method="POST">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Detail Pembayaran</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Kode Pemanfaat</label>
								<input type="text" class="form-control" name="kodepl" value="<?php echo $kodepl; ?>" readonly required>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input type="text" class="form-control" name="nama" value="<?php echo $nama; ?>" readonly required>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Kode Pembayaran</label>
								<input type="text" class="form-control" name="kode_pem" value="<?php $sql = 'SELECT count(*) FROM pembayaran';
								$query = mysqli_query($conn, $sql);
								$row = mysqli_fetch_assoc($query);
								$hitung = $row['count(*)'];
								$hitung = $hitung+1;
								$bulan = date('m');
								$tahun = date('Y');
								if ($hitung>=1&&$hitung<=9) {
									$kode = "00".$hitung."/PAY-PPP/".$bulan."/".$tahun;
									} else if ($hitung>=10&&$hitung<=99) {
										$kode = "0".$hitung."/PAY-PPP/".$bulan."/".$tahun;
										} else if ($hitung>=100&&$hitung<=999) {
											$kode = $hitung."/PAY-PPP/".$bulan."/".$tahun;
										}
										echo $kode;
										
										?>" readonly required>
										<label for="inputAddress">Tanggal</label>
										<input type="date" class="form-control" name="tanggal" value="" required>

									</div>

								</div>
								<div class="row">
									<div class="col-md-12">
										<label for="inputAddress">Pilih Metode Pembayaran</label><br>
										<!-- <input type="checkbox" class="form-checkbox"> Transfer Bank <br> -->
										<input onclick="btnSearch_Click();" type="radio" class="" name="metode" value="1" id="kas" readonly required> Kas
										<input onclick="btnSearch_Click2();" type="radio" class="" checked="true" name="metode" value="2" id="bank" readonly required> Bank <br>
										<label for="inputAddress">Kode Voucher</label>
										
										<!-- <label for="inputAddress">Kode Voucher</label> -->
										<select class="form-control" name="voucher1" id="pbank1" hidden>
											<option value="">~ pilih kode voucher ~</option>
											<?php
											$djndn = "select * from tabel_transaksi where NOT debet = 0 AND jenis_transaksi like '%BKM%'";
											$dj = mysqli_query($conn, $djndn);
											while ($jdbvj = mysqli_fetch_array($dj)) {
												
												echo '<option value="'.$jdbvj['jenis_transaksi'].'">'.$jdbvj['jenis_transaksi'].$jdbvj['ga'].'</option>';
												
											}
											?>
										</select>
										<select class="form-control" name="voucher2" id="pbank" >
											<option value="">~ pilih kode voucher ~</option>
											<?php
											$djndn = "select * from tabel_transaksi where NOT debet = 0 AND jenis_transaksi like '%BBM%'";
											$dj = mysqli_query($conn, $djndn);
											while ($jdbvj = mysqli_fetch_array($dj)) {
												
												echo '<option value="'.$jdbvj['jenis_transaksi'].'">'.$jdbvj['jenis_transaksi'].$jdbvj['ga'].'</option>';
												
											}
											?>
										</select>
										
										<label for="inputAddress">Kode Invoice</label>
										<select class="form-control" name="kodeinv" id="inv">
											<option value="">~ pilih ~</option>
											<?php
											$djndn = "SELECT kode_inv from table_kodesj tk join table_sj ts on tk.id_sj=ts.id_sj where kodepl='$kodepl' and NOT kode_inv = ''";
											$dj = mysqli_query($conn, $djndn);
											while ($jdbvj = mysqli_fetch_array($dj)) {
												$kodein=$jdbvj['kode_inv'];

												$dja = "SELECT sum(total) as total from table_kodesj tk join table_sj ts on tk.id_sj=ts.id_sj join table_sj_detail sj on ts.id_sj=sj.id_sj where kode_inv='$kodein'";
												$djb = mysqli_query($conn, $dja);
												while ($jdbv = mysqli_fetch_array($djb)) {
													$totala=$jdbv['total'];
												}

												$djc = "SELECT sum(total_pem) as total from pembayaran where kode_inv='$kodein'";
												$djd = mysqli_query($conn, $djc);
												while ($jdb = mysqli_fetch_array($djd)) {
													$totalb=$jdb['total'];
												}
												if ($totala!=$totalb) {
													echo '<option value="'.$jdbvj['kode_inv'].'">'.$jdbvj['kode_inv'].'</option>';
												}
											}
											?>
										</select>
										<label for="inputAddress">Total Tagihan</label>
										<input type="text" id="tott" class="form-control" name="total" value="" readonly required>
										
										<!-- <label for="inputAddress">Pilih Bank</label>
											<select class="form-control"  name="kbank" id="pbank"> -->
												<?php
											// $djndn = "SELECT kode_rekening, nama_rekening from tabel_master where nama_rekening like '%mandiri%'";
											// $dj = mysqli_query($conn, $djndn);
											// while ($jdbvj = mysqli_fetch_array($dj)) {
											// 	echo '<option value="'.$jdbvj['kode_rekening'].'">'.$jdbvj['kode_rekening'].' - '.$jdbvj['nama_rekening'].'</option>';
											// }
												?>

												<!-- </select> -->
												<!-- <select class="form-control"  name="inv" id="pbank1" hidden>
													<option value="1101.01.09">1101.01.09 - KAS BESAR</option>
												</select> -->
												<label for="inputAddress">Total Pembayaran</label>
												<input type="number" id="totalp" class="form-control" name="totalp" value="" required>
											</div>
										</div>
										<br>
										<center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="">Simpan</button></center>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<script>

					$(document).ready(function() {
						$("#inv").change(function(event){

							var selected = $(this).val();
							$.ajax({
								type: "GET",
								url: 'inv.php',
								data: { selected: selected },
								success:  function(data) {
									var json = JSON.parse(data);
							// console.log(data);
							$('#tott').val(json.total);
							$('#totalp').val(json.total);
							// alert(json.total);
						}
					});
						});
					});
				</script>
				<script type="text/javascript">


					$(document).ready(function(){
						$('.form-checkbox').click(function(){
							if($(this).is(':checked')){
								$('#pbank').attr('disable','false');
							}
						});
					});
				</script>
