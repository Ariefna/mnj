<?php
if (isset($_GET['sp'])) {
	$qury = "SELECT *, CONCAT(b.Alamat,', ',b.kota) as alamat, DATE_FORMAT(tanggal, '%d %M %Y') as tanggal FROM `table_sp` a join pelanggan b on a.kodepl = b.kodepl where id_sp = ".$_GET['sp'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$id_sp = $_GET['sp'];
	$saldo =$hasil['saldo'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Sales Order</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card  mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Detail Sales Order</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Tanggal</label>
								<input type="text" class="form-control" value="<?php echo $hasil['tanggal']; ?>" name="tanggal" onchange="myFunction(this.value)" required="" readonly>
								<div class="row">
									<div class="col-md-6">
										<label for="inputAddress">Diskon</label>
										<input type="text" min="0" value="<?php echo $hasil['diskon']; ?> %" max="100"  onchange="disk()" class="form-control" id="disks" name="diskon" required="" readonly>
									</div>
									<div class="col-md-6">
										<label for="inputAddress">Termin</label>
										<input type="text" min="0" value="<?php echo $hasil['tempo']; ?> Hari" max="100"  onchange="disk()" class="form-control" id="disks" name="diskon" required="" readonly>
									</div>
								</div>
								<label for="inputAddress">Nama Pelanggan</label>
								<input type="text" class="form-control" id="idsp" name="" value="<?php echo $hasil['Nama']; ?>" readonly="">
								<label for="inputAddress">Nomor PO Customer</label>
								<input type="text" class="form-control" id="idsp" name="" value="<?php echo $hasil['nopo']; ?>" readonly="">
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Kode SO</label>
								<input type="text" class="form-control" name="spku" value="<?php echo $hasil['kode_sp']; ?>" readonly="">
								<input type="hidden" class="form-control" id="idsp" name="" value="<?php echo $hasil['id_sp']; ?>" readonly="">
								<label for="inputAddress">Kode Pelanggan</label>
								<input type="text" class="form-control" id="kodepl" value="<?php echo $hasil['kodepl']; ?>" name="kodeplku" readonly="" required="">
								<label for="inputAddress">Alamat</label>
								<input type="text" class="form-control" id="alamat" value="<?php echo $hasil['alamat']; ?>" name="Kode_Pelanggan" readonly="" required="">
								<label for="inputAddress">Saldo</label>
								<input type="text" class="form-control" id="saldo" value="<?php echo $hasil['saldo']; ?>" name="saldo" readonly="" required="">
							</div>
							<div class="col-md-12">
							<label for="inputAddress">Keterangan</label>
							<textarea class="form-control" name="keterangan" readonly><?php echo $hasil['keterangan']; ?></textarea>
							</div>
							<div class="col-md-12">
								<br>
								<!-- <button type="button" name="add2" id="add2" class="btn btn-success btn-sm">Tambah Akun</button> -->
								<div class="table-responsive">
									<table class="table bordered" id="dynamic_field2" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>Kode Akun</th>
												<th>Nama Akun</th>
												<th>Nominal (Rp)</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tbody>
											<?php
											$sql = "SELECT * from tabel_sp_acccount a join tabel_master b on a.kode_rekening = b.kode_rekening where a.id_sp = ".$_GET['sp'];
											$tot =0;
											$connect = mysqli_query($conn, $sql);
											while ($row = mysqli_fetch_array($connect)) {
												echo '<tr id="row"><td align="center"><input disabled="disabled" style="width: 100%;border: none;" value="'.$row['kode_rekening'].'" class="text-center"></td><td align="center"><input disabled="disabled" type="text" value="'.$row['nama_rekening'].'" id="nama" style="width: 100%;border: none;background: #fff;"></td><td align="center"><input disabled="disabled" value="'.$row['nominal'].'" type="number" id="nama" name="nominal[]" class="text-center totalsubnya" oninput="disk21()" style="width: 100%;border: none;background: #fff;"></td><td align="center"></td></tr>';
												$tot += $row['nominal'];
											}
											?>
										</tbody>
										<tfoot>
											<tr>
												<th colspan="2" style="text-align: right;">Total</th>
												<th colspan="1" id="totalnya"><?php echo number_format($tot,0,',','.'); ?></th>
												<th></th>
												<th></th>
											</tr>
										</tfoot>
									</table>
								</div>
							</div>
							<div class="col-md-12">
								<br>
								<div class="table-responsive">
									<table class="table bordered" id="" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Produk</th>
												<th>Nama Produk</th>
												<th>Harga</th>
												<th>Nama Akun</th>
												<th>Jumlah Pembelian</th>
												<th>Total</th>
											</tr>
										</thead>
										
										<?php
										$i = 0;
										$qury = "SELECT kode_produk, ppn, diskon, nama_produk, a.harga as hrg, qty, kode_rekening, (select uraian from akun_perkiraan where kode_perkiraan = a.kode_rekening) uraian, total, s.status, status_mrk FROM table_sp s join table_sp_detail a on s.id_sp=a.id_sp join produk b on a.id_produk = b.id_produk WHERE a.id_sp = ".$_GET['sp'];
										// echo $qury;
										$qc = mysqli_query($conn, $qury);
										$jum=0;
										$diskon=0;
										$jumq=0;
										while ($hasil = mysqli_fetch_array($qc)) {
											$sts=$hasil['status'];
											$ppn=$hasil['ppn'];
											$sts1=$hasil['status_mrk'];
											$diskon = $hasil['diskon'];
											$jumq += $hasil['qty'];
											$i++;
											$jum += $hasil['total'];
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$hasil['kode_produk'].'</td>
											<td>'.$hasil['nama_produk'].'</td>
											<td align="center">'.number_format($hasil['hrg'],0,',','.').'</td>
											<td>'.$hasil['uraian'].'<input type="hidden" name="akun[]" value="'.$hasil['kode_rekening'].'"></td>
											<td align="center">'.$hasil['qty'].'</td>
											<td align="center">'.number_format($hasil['total'],0,',','.').'</td>
											</tr>';
										}
										echo '
										<tr>
										<td></td>
										<td></td>
										<td colspan="2"></td>
										<td align="right">Total Qty</td>
										<td align="center">'.$jumq.'</td>
										<td align="center"></td>
										</tr>
										<tr>
										<td></td>
										<td></td>
										<td colspan="2"></td>
										<td></td>
										<td align="right">Brutto (Rp)</td>
										<td align="center">'.number_format($jum,0,',','.').'</td>
										</tr>
										<tr>
										<td></td>
										<td></td>
										<td colspan="2"></td>
										<td></td>
										<td align="right">Diskon (Rp)</td>
										<td align="center">-'.number_format(($jum*$diskon/100),0,',','.').'</td>
										</tr>
										<tr>
										<td></td>
										<td></td>
										<td colspan="2"></td>
										<td></td>
										<td align="right">PPN (Rp)</td>
										<td align="center">'.number_format(($ppn),0,',','.').'</td>
										</tr>
										<tr>
										<td></td>
										<td></td>
										<td colspan="2"></td>
										<td></td>
										<td align="right">Netto (Rp)</td>
										<td align="center">'.number_format(($jum-($jum*$diskon/100)+$ppn),0,',','.').'</td>
										</tr>';
										echo "<script>var netto = ".($jum-($jum*$diskon/100)+$ppn)."</script>";
										$button = "";


										?>
									</table>
								</div>
							</div>

						</div>
						<center>
							<?php
							if (($tot+$saldo) < ($jum-($jum*$diskon/100))) {
							}
							if($sts != 1){
								echo '<button name="submit" type="submit" id="button_check_y" class="col-md-3 btn btn-primary">Approve</button>';
							}

							?>

						</center>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<script>
	function convertToRupiah(angka)
	{
		var rupiah = '';
		var angkarev = angka.toString().split('').reverse().join('');
		for(var i = 0; i < angkarev.length; i++) if(i%3 == 0) rupiah += angkarev.substr(i,3)+'.';
			return rupiah.split('',rupiah.length-1).reverse().join('');
	}
	var c2 = 0;
	var i2=0;
	$('#add2').click(function(){
		i2++;
		$('#dynamic_field2').append('<tr id="row'+i2+'"><td align="center"><input class="text-center" name="koderekening[]" id="kode'+i2+'" style="width: 100%;border: none;" readonly></td><td align="center"><input type="text" id="nama'+i2+'" style="width: 100%;border: none;background: #fff;" list="browsers2" onchange="sjsj'+i2+'(value);"><datalist id="browsers2"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `tabel_master` where nama_rekening like 'Kas%' OR nama_rekening like 'Bank%'");while ($rdjc = mysqli_fetch_array($rdcjn)) { echo '<option value="'.$rdjc['kode_rekening']." ".$rdjc['nama_rekening'].'">'; } ?></datalist></td><td align="center"><input type="number" name="nominal[]" class="text-center totalsubnya" oninput="disk2'+i2+'()" style="width: 100%;border: none;background: #fff;" ></td><td align="center"><button type="button" name="remove" id="'+i2+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
		c2=i2;
	});
	$(document).on('click', '.btn_remove', function(){
		var button_id = $(this).attr("id");
		$('#row'+button_id+'').remove();
		disk21();
	});
	function button_check(total) {
		if (total >= netto) {
			$('#button_check_y').prop("disabled", false);
		}else {
			$('#button_check_y').prop("disabled", true);
		}
	}
	<?php
	for ($i=1; $i <= 1000; $i++) {
		?>
		function sjsj<?php echo $i; ?>(value){
			$.ajax({
				type: "POST",
				url: "autosuggest.php?koderek=1",
				data: {
					rek: value
				},
				success: function (data) {
					var json = JSON.parse(data);
					$('#kode<?php echo $i; ?>').val(json.kode);
					$('#nama<?php echo $i; ?>').val(json.nama);
				}
			});
		}
		function disk2<?php echo $i; ?>(value){
			var jumlahk = 0;
			$('.totalsubnya').each(function(){
				var input = $(this).val();
				if($.isNumeric(input)){
					jumlahk += parseFloat(input);
				}
			});
			$('#totalnya').text(convertToRupiah(jumlahk));
			button_check(jumlahk);
		}
	<?php } ?>
</script>
<?php
if (isset($_POST['submit'])) {
	$tgl = date("Y-m-d");
	$sql = "UPDATE `table_sp` SET `status` = '1' WHERE `table_sp`.`id_sp` = ".$_GET['sp'];
	mysqli_query($conn, $sql);
	$sql = "SELECT *, (SELECT kodepl FROM `table_sp` where id_sp = a.id_sp) kodepl, (SELECT kode_sp FROM `table_sp` where id_sp = a.id_sp) kode_sp from tabel_sp_acccount a join tabel_master b on a.kode_rekening = b.kode_rekening where a.id_sp = ".$_GET['sp'];
	$query = mysqli_query($conn, $sql);
	while ($row = mysqli_fetch_array($query)) {
		$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$row['kode_sp']."', '2101.10', '".$tgl."', '".$row['kode_sp']."', 'Penerimaan DP. Pekerjaan ".$row['kode_sp']."', '', '".$row['nominal']."', '', 'Post', '".$row['kodepl']."', '".$_SESSION['id_admin']."')";
		mysqli_query($conn, $quy);
		$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$row['kode_sp']."', '".$row['kode_rekening']."', '".$tgl."', '".$row['kode_sp']."', 'Penerimaan DP. Pekerjaan ".$row['kode_sp']."', '".$row['nominal']."', '', '', 'Post', '".$row['kodepl']."', '".$_SESSION['id_admin']."')";
		mysqli_query($conn, $qu);
	}
	echo '<script language="javascript">window.location.assign("?page=approve")</script>';
}
if (isset($_POST['simpan'])) {
	$number = count($_POST['koderekening'])-1;
	for ($i=0; $i <= $number; $i++) {
		$sql = "INSERT INTO `tabel_sp_acccount` (`id_sp_account`, `kode_rekening`, `id_sp`, `nominal`) VALUES (NULL, '".$_POST['koderekening'][$i]."', '".$_GET['sp']."', '".$_POST['nominal'][$i]."')";
		$query = mysqli_query($conn, $sql);
	}
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
	echo '<script language="javascript">window.location.assign("?page=createapprove&sp='.$_GET['sp'].'")</script>';
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
