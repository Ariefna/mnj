	<?php

	$qury = "SELECT * FROM `pembayaran` a join pelanggan b on a.kodepl = b.kodepl where kode_pem = '".$_GET['kode_pem']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$Nama = $hasil['Nama'];
	$kode_pem = $hasil['kode_pem'];
	$tanggal = $hasil['tanggal'];
	$total_pem = $hasil['total_pem'];
	$kode_inv = $hasil['kode_inv'];
	$jenis_transaksi = $hasil['jenis_transaksi'];
	$hidden1 = "";
	$hidden2 = "";
	if (strstr($jenis_transaksi, 'BKK')) {
		$jk = "Keluar";
		$jenis = "Kas";
		$hidden2 = "hidden";
	} elseif (strstr($jenis_transaksi, 'BKM')) {
		$jk = "Masuk";
		$jenis = "Kas";
		$hidden2 = "hidden";
	} elseif (strstr($jenis_transaksi, 'BBK')) {
		$jk = "Keluar";
		$jenis = "Bank";
		$hidden1 = "hidden";
	} elseif (strstr($jenis_transaksi, 'BBM')) {
		$jk = "Masuk";
		$jenis = "Bank";
		$hidden1 = "hidden";
	}
	if (isset($_POST['submit'])) {

		$qu = "UPDATE `pembayaran` SET `status` = '1' WHERE `pembayaran`.`kode_pem` = '".$kode_pem."'";
		$query = mysqli_query($conn, $qu);
		$qu = "INSERT INTO `table_piutang` (`kodepiutang`, `kodepl`, `tanggal`, `keterangan`, `debet`, `kredit`) VALUES (NULL, '".$kodepl."', '".$_POST['tanggal']."', 'Pembayaran ".$_POST['kodeinv']."', '0', '".$_POST['totalp']."')";
		$query = mysqli_query($conn, $qu);
		// echo "<script>alertku('$jenis_alert', '$alert')</script>";
	// 	if($query){
	// 	$jenis_alert = "success";
	// 	$alert = "Sukses Insert Data";
	// }else{
	// 	$jenis_alert = "danger";
	// 	$alert = mysqli_error($conn);
	// }
	echo "<script language='javascript'>window.location.assign('?page=approvepay');</script>";
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
		<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
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
									<input type="text" class="form-control" name="nama" value="<?php echo $Nama; ?>" readonly required>
								</div>
								<div class="col-md-6">
									<label for="inputAddress">Kode Pembayaran</label>
									<input type="text" class="form-control" name="kode_pem" value="<?php echo $kode_pem;?>" readonly required>
									<label for="inputAddress">Tanggal</label>
									<input type="date" class="form-control" name="tanggal" value="<?php echo $tanggal;?>" required>

								</div>

							</div>
							<div class="row">
								<div class="col-md-12">
									<label for="inputAddress">Pilih Metode Pembayaran</label><br>
									<!-- <input type="checkbox" class="form-checkbox"> Transfer Bank <br> -->
									<input onclick="btnSearch_Click();" type="radio" class="" name="metode" <?php if ($jenis == 'Kas'){ echo 'checked="true"';} ?> value="1" id="kas" readonly required> Kas
									<input onclick="btnSearch_Click2();" type="radio" class="" <?php if ($jenis == 'Bank'){ echo 'checked="true"';} ?> name="metode" value="2" id="bank" readonly required> Bank <br>
									<label for="inputAddress">Kode Voucher</label>
									<select class="form-control" name="voucher1" id="pbank1" <?php echo $hidden1; ?> readonly>
										<option value="">~ pilih kode voucher ~</option>
										<?php
										$djndn = "select * from tabel_transaksi where NOT debet = 0 AND jenis_transaksi like '%BKM%'";
										$dj = mysqli_query($conn, $djndn);
										while ($jdbvj = mysqli_fetch_array($dj)) {
											$selected = "";
											if ($jdbvj['jenis_transaksi'] == $jenis_transaksi) {
												$selected = "selected";
											}

											echo '<option value="'.$jdbvj['jenis_transaksi'].'"  '.$selected.'>'.$jdbvj['jenis_transaksi'].'</option>';

										}
										?>
									</select>
									<select class="form-control" name="voucher2" id="pbank" <?php echo $hidden2; ?> readonly>
										<option value="">~ pilih kode voucher ~</option>
										<?php
										$djndn = "select * from tabel_transaksi where NOT debet = 0 AND jenis_transaksi like '%BBM%'";
										$dj = mysqli_query($conn, $djndn);
										while ($jdbvj = mysqli_fetch_array($dj)) {
											$selected = "";
											if ($jdbvj['jenis_transaksi'] == $jenis_transaksi) {
												$selected = "selected";
											}

											echo '<option value="'.$jdbvj['jenis_transaksi'].'" '.$selected.'>'.$jdbvj['jenis_transaksi'].'</option>';

										}
										?>
									</select>

									<label for="inputAddress">Kode Invoice</label>
									<select class="form-control" name="kodeinv" id="inv" readonly>
										<option value="">~ pilih ~</option>
										<?php
										$djndn = "SELECT kode_inv from table_kodesj tk join table_sj ts on tk.id_sj=ts.id_sj where kodepl='$kodepl' and NOT kode_inv = ''";
										$dj = mysqli_query($conn, $djndn);
										while ($jdbvj = mysqli_fetch_array($dj)) {
											$selected = "";
											if ($jdbvj['kode_inv'] == $kode_inv) {
												$selected = "selected";
											}
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
												echo '<option value="'.$jdbvj['kode_inv'].'" '.$selected.'>'.$jdbvj['kode_inv'].'</option>';
											}
										}
										?>
									</select>
									<label for="inputAddress">Total Tagihan</label>
									<input type="text" id="tott" class="form-control" name="total" value="" readonly>
												<label for="inputAddress">Total Pembayaran</label>
												<input type="number" id="totalp" value="<?php echo $total_pem; ?>" class="form-control" name="totalp" value="" required readonly>
											</div>
										</div>
										<br>
										<center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="">Approve</button></center>
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
