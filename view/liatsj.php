<?php
if (isset($_GET['sj'])) {
	$qury = "SELECT *, CONCAT(b.Kelurahan,',',b.kota) as alamat FROM `table_sj` a join pelanggan b on a.kodepl = b.kodepl where id_sj = ".$_GET['sj'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$id_sp = $_GET['sj'];
	// echo $qury;
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Surat Jalan</h1>
	</div>
	<form action="" method="POST">
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
								<input value="Arief Nur Abdullah" type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['kodepl']; ?>" readonly>
								<label for="inputAddress">Sales</label>
								<input type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['sales']; ?>" readonly>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Alamat</label>
								<input type="text" class="form-control" value="<?php echo $hasil['alamat']; ?>" name="Kode_Pelanggan" disabled>
								<label for="inputAddress">Kode Surat Jalan</label>
								<input type="text" class="form-control" name="kodesuratjalan" value="<?php
								$sql = 'SELECT count(*) FROM table_kodesj';
								$query = mysqli_query($conn, $sql);
								$row = mysqli_fetch_assoc($query);
								$hitung = $row['count(*)'];
								$hitung = $hitung+1;
								$bulan = date('m');
								$tahun = date('Y');
								if ($hitung>=1&&$hitung<=9) {
									$kode = "00".$hitung."/SJ-PPP/".$bulan."/".$tahun;
								} else if ($hitung>=10&&$hitung<=99) {
									$kode = "0".$hitung."/SJ-PPP/".$bulan."/".$tahun;
								} else if ($hitung>=100&&$hitung<=999) {
									$kode = $hitung."/SJ-PPP/".$bulan."/".$tahun;
								}
								echo $kode;
								 ?>" name="Kode_Pelanggan" disabled>
								 <input type="text" class="form-control" name="kodeinvoice" value="<?php
 								$sql = 'SELECT count(*) FROM table_kodesj';
 								$query = mysqli_query($conn, $sql);
 								$row = mysqli_fetch_assoc($query);
 								$hitung = $row['count(*)'];
 								$hitung = $hitung+1;
 								$bulan = date('m');
 								$tahun = date('Y');
 								if ($hitung>=1&&$hitung<=9) {
 									$kodei = "00".$hitung."/INV-PPP/".$bulan."/".$tahun;
 								} else if ($hitung>=10&&$hitung<=99) {
 									$kodei = "0".$hitung."/INV-PPP/".$bulan."/".$tahun;
 								} else if ($hitung>=100&&$hitung<=999) {
 									$kodei = $hitung."/INV-PPP/".$bulan."/".$tahun;
 								}
 								echo $kodei;
 								 ?>" name="Kode_Pelanggan" hidden>
							</div>
							<div class="col-md-12">
								<br>
								<div class="table-responsive">
									<table class="table bordered" id="" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Buku</th>
												<th>Judul</th>
												<th>Jumlah Pembelian</th>
												<th>Jumlah Kirim</th>
												<th>Stok</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Buku</th>
											<th>Judul</th>
											<th>Jumlah Pembelian</th>
											<th>Jumlah Kirim</th>
											<th>Stok</th>

										</tfoot>


										<?php
										$qury = "SELECT * FROM `table_sj` WHERE id_sj = ".$_GET['sj'];
										$i = 0;
										$qc = mysqli_query($conn, $qury);
										$cek = mysqli_num_rows($qc);
										if($cek > 0){
											$qury = "SELECT * FROM `table_sj_detail` a join table_buku b on a.id_buku = b.id_buku join table_sj_detail c on c.id_buku = b.id_buku WHERE a.id_sj = ".$_GET['sj']." GROUP by a.id_buku";

										}else {
											$qury = "SELECT * FROM `table_sj_detail` a join table_buku b on a.id_buku = b.id_buku WHERE a.id_sj = ".$_GET['sj']." GROUP by a.id_buku";
										}
										
										$qc = mysqli_query($conn, $qury);
										while ($hasil = mysqli_fetch_array($qc)) {
											if ($hasil[3]!=0) {
												$i++;
												echo '<tr>
												<td>'.$i.'</td>
												<td><input name="id_buku'.$i.'" style="width: 100%" width="100%" type="hidden" readonly value="'.$hasil['id_buku'].'">'.$hasil['Kode_Buku'].'</td>
												<td><input style="background: transparent;border: none; width:100%" type="text" value="'.$hasil['Judul_Buku'].'" disabled></td>
												<td><input style="background: transparent;border: none; width:100%; text-align:center" type="text" name="stok'.$i.'" value="'.$hasil[3].'" readonly></td>
												<td><input style="background: transparent;border: none; width:100%; text-align:center" name="qty'.$i.'" style="width: 100%" value="" min="0" max="'.$hasil['stok'].'" type="number"></td>
												<td><input style="background: transparent;border: none; text-align:center; width:100%" type="text" value="'.$hasil['stok'].'" disabled></td>
												</tr>';
											}

										}
										?>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<center>
		<a href="invoice.php?kode_sj='<?php echo $kode; ?>" class="text-white col-md-3 btn btn-primary"><i class="fas fa-fw fa-print"></i></a> 
		<button onclick="hehe()" name="submit" type="submit" class="col-md-3 btn btn-secondary">selesai</button></center>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script language='javascript'>
	
	function hehe() {
		window.location.assign('?page=suratjalan');
	}

</script>
