<?php
if (isset($_GET['kode_rt'])) {
	$qury = "SELECT j.kodepl, kode_sj, kode_sp, nama, alamat, kota, kode_inv, diskon from table_kodesj s join table_sj j on s.id_sj=j.id_sj join pelanggan p on j.kodepl=p.kodepl join table_sp sp on j.id_sp=sp.id_sp where kode_sj = '".$_GET['sj']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$kode_sp = $hasil['kode_sp'];
	$kode_sj = $hasil['kode_sj'];
	$kode_inv = $hasil['kode_inv'];
	$nama = $hasil['nama'];
	$diskon = $hasil['diskon'];
	$alamat = $hasil['alamat'];

	// $id_sj = $_GET['retur'];
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Surat Retur</h1>
	</div>

	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Detail Retur</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Kode Sales Order</label>
								<input value="<?php echo $kode_sp; ?>" type="text" class="form-control" name="kodesp" readonly>
								<label for="inputAddress">Kode Delivery Order</label>
								<input value="<?php echo $kode_sj; ?>" type="text" class="form-control" name="kodesj" readonly>
								<label for="inputAddress">Kode Invoice</label>
								<input value="<?php echo $kode_inv;?>" type="text" class="form-control" name="kodeinv" readonly>
								<label for="inputAddress">Kode Retur</label>
								<input value="<?php echo $_GET['kode_rt'] ?>" type="text" class="form-control" name="koderetur" readonly>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Kode Pemanfaat</label>
								<input value="<?php echo $hasil['kodepl']; ?>" type="text" class="form-control" id="Kode_Pelanggan" name="kodepl" readonly>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['nama']; ?>" readonly>
								<label for="inputAddress">Alamat</label>
								<input type="text" class="form-control" value="<?php echo $alamat.', '.$hasil['kota']; ?>" name="alamat" disabled>
							</div>
							<div class="col-md-12">
								<br>
								<div class="table-resjonsive">
									<table class="table bordered" id="" width="100%" cellsjacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th width="90px">Kode Produk</th>
												<th>Judul Produk</th>
												<th width="100px">Harga</th>
												<th width="100px">Jumlah Retur</th>
												<th width="100px">Total</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Produk</th>
											<th>Judul Produk</th>
											<th>Harga</th>
											<th>Jumlah Retur</th>
											<th>Total</th>
										</tfoot>
										<?php
										$qury = "SELECT harga_produk, kode_produk, b.nama_produk, d.qty, d.id_produk, s.status FROM retur s join retur_detail d on s.id_rt=d.id_retur join produk b on d.id_produk=b.id_produk WHERE s.kode_rt = '".$_GET['kode_rt']."'";
										$i = 0;
										$qc = mysqli_query($conn, $qury);
										$button = '';
										while ($hasil = mysqli_fetch_array($qc)) {
											if ($hasil['qty']!=0) {
												$i++;
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$hasil['kode_produk'].'<input style="background: transjarent;border: none; width:100%; text-align:center" name="id_buku[]" style="width: 100%" value="'.$hasil['id_produk'].'" type="hidden"></td>
												<td>'.$hasil['nama_produk'].'</td>
												<td align="center">'.$hasil['harga_produk'].'<input value="'.$hasil['harga_produk'].'" class="text-center" style="width: 100%;border: none;background: #fff;" id="harga'.$i.'" type="hidden" ></td>
												<td><input style="background: transjarent;border: none; width:100%; text-align:center" name="qty[]" style="width: 100%" value="'.$hasil['qty'].'" min="0" max="'.$hasil['qty'].'" id="qty'.$i.'" onchange="sum'.$i.'();" type="number"></td>
												<td><input style="background: transjarent;border: none; width:100%; text-align:center" name="total[]" style="width: 100%" value="'.$hasil['harga_produk']*$hasil['qty'].'" id="total'.$i.'" type="number" readonly></td>
												</tr>';
											}
											if ($hasil['status'] == '1') {
												$button = 'style="display: none;"';
											}
										}
										?>
									</table>

								</div>
							</div>
						</div>
						<center><button <?php echo $button; ?> name="submit" type="submit" class="col-md-3 btn btn-primary">Approve</button></center>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<?php
$tot = $i;
if (isset($_POST['submit'])) {
	// echo "string";
	

	$dch = "UPDATE `retur` SET `status` = '1' WHERE `retur`.`kode_rt` = '".$_GET['kode_rt']."';";
	// echo $dch;
	$query = mysqli_query($conn, $dch);
	$number2 = count($_POST['qty']);
for ($i=0; $i < $number2; $i++) { 
	$dch = "INSERT INTO `history_produk` (`id_stok`, `id_produk`, `masuk`, `keluar`, `date`) VALUES (NULL, '.$_POST['id_buku'][$i].', '".$_POST['qty'][$i]."', '0', current_timestamp())";
	$query = mysqli_query($conn, $dch);
}
	
	$tgl = Date('Y-m-d');
	$number = count($_POST['total']);
	$totalku = 0;
	for ($i=0; $i < $number; $i++) {
		$totalku +=$_POST['total'][$i];
	}
	$sjt = $totalku-($totalku*$diskon/100);
	$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$_GET['kode_rt']."', '4401.06', '".$tgl."', '".$kode_inv."', 'Retur Penjualan ".$kode_inv."', '".$sjt."', '', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	mysqli_query($conn, $quy);
	echo $quy;
	$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$_GET['kode_rt']."', '1105.00', '".$tgl."', '".$kode_inv."', 'Retur Penjualan ".$kode_inv."', '', '".$sjt."', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	mysqli_query($conn, $qu);
	echo $qu;
	$number = $i;

	echo $dch;
	$qu = "INSERT INTO `table_piutang` (`kodepiutang`, `kodepl`, `tanggal`, `debet`, `kredit`, `keterangan`) VALUES (NULL, '".$kodepl."', '".$tgl."', '0', '".$sjt."', 'Retur Penjualan ".$kode_inv."')";
	mysqli_query($conn, $qu);
	echo $qu;
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";


	echo "<script language='javascript'>window.location.assign('?page=approveretur');</script>";
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script>
	<?php
	for ($i=1; $i <= $tot; $i++) {
		?>
		function sum<?php echo $i; ?>(value){
			var harga = $('#harga<?php echo $i; ?>').val();
			var qty = $('#qty<?php echo $i; ?>').val();
			$('#total<?php echo $i; ?>').val(harga*qty);
		}
	<?php } ?>
</script>
