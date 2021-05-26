<?php
if (isset($_GET['sj'])) {
	$qury = "SELECT *, CONCAT(b.Alamat,', ',b.kota) as alamat FROM `table_sp` a join pelanggan b on a.kodepl = b.kodepl join table_sj sj on a.id_sp=sj.id_sp join table_kodesj kd on sj.id_sj=kd.id_sj where sj.id_sj = ".$_GET['sj'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$id_sp = $_GET['sj'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Edit Surat Jalan</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Surat Jalan</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Nomor Pelanggan</label>
								<input value="<?php echo $hasil['kodepl']; ?>" type="text" class="form-control" id="Kode_Pelanggan" name="Kode_Pelanggan" readonly>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['Nama']; ?>" readonly>
								<label for="inputAddress">Sales</label>
								<input type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['sales']; ?>" readonly>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Alamat</label>
								<input type="text" class="form-control" value="<?php echo $hasil['alamat']; ?>" name="Kode_Pelanggan" disabled>
								<label for="inputAddress">Kode Surat Jalan</label>
								<input type="text" class="form-control" name="kodesuratjalan" value="<?php echo $hasil['kode_sj']; ?>" name="Kode_Pelanggan" disabled>
							</div>
							<div class="col-md-12">
								<br>
								<div class="table-responsive">
									<table class="table bordered" id="" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th width="30px">No</th>
												<th width="90px">Kode Buku</th>
												<th>Judul</th>
												<th width="130px">Jumlah Pembelian</th>
												<th width="130px">Jumlah Kirim</th>
												<th width="70px">Edit Kirim</th>
												<th width="60px">Stok</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Buku</th>
											<th>Judul</th>
											<th>Jumlah Pembelian</th>
											<th>Jumlah Kirim</th>
											<th>Edit Kirim</th>
											<th>Stok</th>
										</tfoot>
										<?php
										$qury = "SELECT * FROM `table_sj` WHERE id_sp = ".$_GET['sj'];
										$i = 0;
										$qc = mysqli_query($conn, $qury);
										$cek = mysqli_num_rows($qc);
										// if($cek > 0){
										// 	$qury = "SELECT * FROM `table_sj_detail` a join table_buku b on a.id_buku = b.id_buku join table_sj_detail c on c.id_buku = b.id_buku WHERE a.id_sj = ".$_GET['sj']." GROUP by a.id_buku";
										// }else {
											// $qury = "SELECT * FROM `table_sj_detail` a join table_buku b on a.id_buku = b.id_buku WHERE a.id_sj = ".$_GET['sj']." GROUP by a.id_buku";
											$qury = "SELECT *, d.qty 'qtysp' FROM `table_sj_detail` a join table_buku b on a.id_buku = b.id_buku join table_sj c on a.id_sj = c.id_sj join table_sp_detail d on c.id_sp = d.id_sp WHERE a.id_sj = ".$_GET['sj']." GROUP by a.id_buku";
										// }
										// echo $qury;
										$qc = mysqli_query($conn, $qury);
										while ($hasil = mysqli_fetch_array($qc)) {
											// if ($hasil[3]!=0) {
												$i++;
												if ($hasil['stok'] > $hasil[3]) {
													$max = $hasil[3];
												}else {
													$max = $hasil['stok'];
												}
												// echo $max;
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center"><input name="id_buku'.$i.'" style="width: 100%" width="100%" type="hidden" readonly value="'.$hasil['id_buku'].'">'.$hasil['Kode_Buku'].'</td>
												<td><input style="background: transparent;border: none; width:100%" type="text" value="'.$hasil['Judul_Buku'].'" disabled></td>
												<td><input style="background: transparent;border: none; width:100%; text-align:center" type="text" value="'.$hasil['qtysp'].'" readonly></td>
												<td><input style="background: transparent;border: none; width:100%; text-align:center" type="text" name="stok'.$i.'" value="'.$hasil[3].'" readonly></td>
												<td><input required style="background: transparent;border: none; width:100%; text-align:center" name="qty'.$i.'" style="width: 100%" value="'.$hasil[3].'" min="0" max="'.$max.'" type="number"></td>
												<td><input style="background: transparent;border: none; text-align:center; width:100%" type="text" value="'.$hasil['stok'].'" disabled></td>
												</tr>';
											}
										// }
										?>
									</table>
								</div>
							</div>
						</div>
						<center><button name="submit" type="submit" class="btn btn-primary col-md-3">Simpan</button></center>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
<?php
if (isset($_POST['submit'])) {
	$jml = $i;
	// $tanggal = date('Y-m-d');
	// $dch = "INSERT INTO `table_sj` (`id_sj`, `id_sp`, `kodepl`, `tanggal`) VALUES (NULL, '".$id_sp."', '".$kodepl."', '".$tanggal."')";
	// mysqli_query($conn, $dch);
	// $last_id = mysqli_insert_id($conn);
	for ($i=1; $i <= $jml; $i++) {
		$dch = "INSERT INTO `table_sj_detail` (`id_sj_detail`, `id_sj`, `id_buku`, `qty`) VALUES (NULL, '".$last_id."', '".$_POST['id_buku'.$i]."', '".$_POST['qty'.$i]."')";
		mysqli_query($conn, $dch);
		$select = "SELECT stok FROM table_buku WHERE id_buku='".$_POST['id_buku'.$i]."'";
		$querys = mysqli_query($conn, $select);
		$rdjc = mysqli_fetch_array($querys);
		$stok = $rdjc['stok'];
		$sa = $stok-$_POST['qty'.$i];
		echo $sa;
		$qu = "UPDATE `table_buku` SET `stok`= ".$sa." WHERE `id_buku`='".$_POST['id_buku'.$i]."'";
		mysqli_query($conn, $qu);
		$stoka=$_POST['stok'.$i]-$_POST['qty'.$i];
		$qu = "UPDATE `table_sp_detail` SET `qty`= ".$stoka." WHERE `id_buku`='".$_POST['id_buku'.$i]."' AND id_sp='".$id_sp."'";
		mysqli_query($conn, $qu);
	}
	$dch = "INSERT INTO `table_kodesj` (`kode_sj`,`kode_inv`, `id_sj`) VALUES ('".$kode."','".$kodei."', '".$last_id."')";
	$query = mysqli_query($conn, $dch);
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
	header("location: akuntansi/?page=suratjalan");
	echo '<script language="javascript">document.location.href="sj.php?kode_sj='.$kode.'";</script>';
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
