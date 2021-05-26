<?php
if (isset($_GET['retur'])) {
	$qury = "SELECT keterangan,nopo,j.kodepl, kode_sj, kode_sp, nama, alamat, kota, kode_inv from table_kodesj s join table_sj j on s.id_sj=j.id_sj join pelanggan p on j.kodepl=p.kodepl join table_sp sp on j.id_sp=sp.id_sp where s.id_sj = '".$_GET['retur']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$kode_sp = $hasil['kode_sp'];
	$kode_sj = $hasil['kode_sj'];
	$kode_inv = $hasil['kode_inv'];
	$nama = $hasil['nama'];
	$alamat = $hasil['alamat'];
	$id_sj = $_GET['retur'];
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
								<input value="<?php
								$tahun = date('Y');
								$sql = "SELECT count(*) FROM retur where kode_rt like '%".$tahun."%'";
								$query = mysqli_query($conn, $sql);
								$row = mysqli_fetch_assoc($query);
								$hitung = $row['count(*)'];
								$hitung = $hitung+1;
								$bulan = date('m');

								if ($hitung>=1&&$hitung<=9) {
									$kode = "00".$hitung."/SH-RT/".$bulan."/".$tahun;
									} else if ($hitung>=10&&$hitung<=99) {
										$kode = "0".$hitung."/SH-RT/".$bulan."/".$tahun;
										} else if ($hitung>=100&&$hitung<=999) {
											$kode = $hitung."/SH-RT/".$bulan."/".$tahun;
										}
										echo $kode;
										?>" type="text" class="form-control" name="koderetur" readonly>
									</div>
									<div class="col-md-6">
										<label for="inputAddress">Kode Pemanfaat</label>
										<input value="<?php echo $hasil['kodepl']; ?>" type="text" class="form-control" id="Kode_Pelanggan" name="kodepl" readonly>
										<label for="inputAddress">Nama Pemanfaat</label>
										<input type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['nama']; ?>" readonly>
										<label for="inputAddress">Alamat</label>
										<input type="text" class="form-control" value="<?php echo $alamat.', '.$hasil['kota']; ?>" name="alamat" disabled>
										<label for="inputAddress">Nomor PO Pemanfaat</label>
										<input type="text" class="form-control" value="<?php echo $hasil['nopo']; ?>" name="alamat" disabled>
									</div>
									<div class="col-md-12">
									<label for="inputAddress">Keterangan</label>
									<textarea class="form-control" name="keterangan" readonly><?php echo $hasil['keterangan']; ?></textarea>
									</div>
									<div class="col-md-12">
										<br>
										<div class="table-resjonsive">
											<table class="table bordered" id="" width="100%" cellsjacing="0">
												<thead>
													<tr>
														<th>No</th>
														<th width="90px">Kode Buku</th>
														<th>Judul Buku</th>
														<th width="100px">Harga</th>
														<th width="100px">Jumlah Kirim</th>
														<th width="100px">Jumlah Retur</th>
														<th width="100px">Total</th>
													</tr>
												</thead>
												<tfoot>
													<th>No</th>
													<th>Kode Buku</th>
													<th>Judul Buku</th>
													<th>Harga</th>
													<th>Jumlah Kirim</th>
													<th>Jumlah Retur</th>
													<th>Total</th>
												</tfoot>
												<?php
												$qury = "SELECT harga_produk, kode_produk, nama_produk, d.qty-(SELECT COALESCE(sum(qty),0) FROM `retur_detail` a join retur b on a.id_retur = b.id_rt where kode_inv = j.kode_inv) as qty, d.id_produk, id_sj_detail FROM table_sj s join table_sj_detail d on s.id_sj=d.id_sj join produk b on d.id_produk=b.id_produk join table_kodesj j on s.id_sj=j.id_sj WHERE s.id_sj = '".$_GET['retur']."' group by kode_produk, d.id_sj_detail";
												$i = 0;
												$qc = mysqli_query($conn, $qury);
												while ($hasil = mysqli_fetch_array($qc)) {
													if ($hasil['qty']!=0) {
														$i++;
														echo '<tr>
														<td align="center">'.$i.'</td>
														<td align="center">'.$hasil['kode_produk'].'<input style="background: transjarent;border: none; width:100%; text-align:center" name="id_produk[]" style="width: 100%" value="'.$hasil['id_produk'].'" type="hidden"></td>
														<td>'.$hasil['nama_produk'].'</td>
														<td align="center">'.$hasil['harga_produk'].'<input value="'.$hasil['harga_produk'].'" class="text-center" style="width: 100%;border: none;background: #fff;" id="harga'.$i.'" type="hidden" ></td>
														<td align="center">'.$hasil['qty'].'</td>
														<td><input style="background: transjarent;border: none; width:100%; text-align:center" name="qty[]" style="width: 100%" value="0" min="0" max="'.$hasil['qty'].'" id="qty'.$i.'" onchange="sum'.$i.'();" type="number"></td>
														<td><input style="background: transjarent;border: none; width:100%; text-align:center" name="total[]" style="width: 100%" value="0" id="total'.$i.'" type="number" readonly></td>
														</tr>';
													}
												}
												?>
											</table>

										</div>
									</div>
								</div>
								<center><button name="submit" type="submit" class="col-md-3 btn btn-primary">Simpan</button></center>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<?php
		$tot = $i;
		if (isset($_POST['submit'])) {
			// $number = count($_POST['id_buku'])-1;
			$number = $i;
			$dch = "INSERT INTO `retur`(`kode_rt`, `kode_sp`, `kode_sj`, `kode_inv`, `kodepl`) VALUES ('".$_POST['koderetur']."','".$_POST['kodesp']."','".$_POST['kodesj']."','".$_POST['kodeinv']."','".$_POST['kodepl']."')";
			$query = mysqli_query($conn, $dch);
			$last_id = mysqli_insert_id($conn);
			for ($i=0; $i < $number; $i++) {
				$dch = "INSERT INTO `retur_detail` (`id_retur`, `id_produk`, `qty`, `total`) VALUES ('".$last_id."', '".$_POST['id_produk'][$i]."', '".$_POST['qty'][$i]."', '".$_POST['total'][$i]."')";
				$query = mysqli_query($conn, $dch);
				// echo $dch;
			}
			if($query){
				$jenis_alert = "success";
				$alert = "Sukses Insert Data";
			}else{
				$jenis_alert = "danger";
				$alert = mysqli_error($conn);
			}
			echo "<script>alertku('$jenis_alert', '$alert')</script>";

			echo "<script language='javascript'>window.location.assign('?page=retur');</script>";
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
