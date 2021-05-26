<?php
if (isset($_GET['sj'])) {
	$qury = "SELECT *, CONCAT(b.Alamat,', ',b.kota) as alamat FROM `table_sp` a join pelanggan b on a.kodepl = b.kodepl join history_sp_detail hs on a.id_sp=hs.id_sp where a.id_sp = ".$_GET['sj'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$nama = $hasil['Nama'];
	$id_sp = $_GET['sj'];
	// echo $qury;
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Delivery Order</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Delivery Order</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Nomor Pelanggan</label>
								<input value="<?php echo $hasil['kodepl']; ?>" type="text" class="form-control" id="Kode_Pelanggan" name="Kode_Pelanggan" readonly>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input  type="text" class="form-control" name="Kode_Pelanggan" value="<?php echo $hasil['Nama']; ?>" readonly>

							</div>
							<div class="col-md-6">
								<label for="inputAddress">Alamat</label>
								<input type="text" class="form-control" value="<?php echo $hasil['alamat']; ?>" name="Alamat" disabled>
								<!-- <label for="inputAddress">Kode Delivery Order</label> -->
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
																<th>Sisa Pengiriman</th>
																<th>Jumlah Kirim</th>
																<th>Stok</th>
															</tr>
														</thead>
														<?php
														$i=0;
														$qury = "SELECT a.id_produk ,kode_produk, diskon, nama_produk, a.harga as hrg, qty, total, s.status, status_mrk, (SELECT sum(qty) FROM table_sj a join table_sj_detail b on a.id_sj=b.id_sj WHERE id_sp = s.id_sp AND id_produk = a.id_produk) as qty2, (SELECT sum(masuk) FROM history_produk WHERE id_produk=a.id_produk) as masuk, (SELECT sum(keluar) FROM history_produk WHERE id_produk=a.id_produk) as keluar FROM table_sp s join table_sp_detail a on s.id_sp=a.id_sp join produk b on a.id_produk = b.id_produk WHERE a.id_sp = ".$_GET['sj'];
														$qc = mysqli_query($conn, $qury);
														while ($hasil = mysqli_fetch_array($qc)) {
															$stok = $hasil['qty']-$hasil['qty2'];
									            $total_stok = $hasil['masuk']-$hasil['keluar'];
															$i++;
															echo '<tr>
															<td align="center">'.$i.'</td>
															<td align="center"><input name="kode_produk'.$i.'" style="width: 100%" width="100%" type="hidden" readonly value="'.$hasil['id_produk'].'">'.$hasil['kode_produk'].'</td>
															<td>'.$hasil['nama_produk'].'</td>
															<td><input style="background: transparent;border: none; width:100%; text-align:center" type="text" name="stok'.$i.'" value="'.$stok.'" readonly>
															<input style="background: transparent;border: none; width:100%; text-align:center" type="text" name="harga'.$i.'" value="'.$hasil['hrg'].'" hidden></td>
															<td><input required style="background: transparent;border: none; width:100%; text-align:center" name="qty'.$i.'" style="width: 100%" value="0" min="0" max="'.$stok.'" type="number"></td>
															<td><input style="background: transparent;border: none; text-align:center; width:100%" type="text" value="'.$total_stok.'" disabled></td>
															</tr>';
														}
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
				date_default_timezone_set("Asia/Jakarta");
				$tanggal = date("Y-m-d");
					$bulan = date('n', strtotime($tanggal));
					if ($bulan==1) {
						$romawi="I";
					} elseif ($bulan==2) {
						$romawi="II";
					} elseif ($bulan==3) {
						$romawi="III";
					} elseif ($bulan==4) {
						$romawi="IV";
					} elseif ($bulan==5) {
						$romawi="V";
					} elseif ($bulan==6) {
						$romawi="VI";
					} elseif ($bulan==7) {
						$romawi="VII";
					} elseif ($bulan==8) {
						$romawi="VIII";
					} elseif ($bulan==9) {
						$romawi="IX";
					} elseif ($bulan==10) {
						$romawi="X";
					} elseif ($bulan==11) {
						$romawi="XI";
					} elseif ($bulan==12) {
						$romawi="XII";
					}
					$tahun = date('Y', strtotime($tanggal));
					$sql = 'SELECT count(*) FROM table_kodesj a join table_sj b on a.id_sj = b.id_sj where NOT a.kode_sj = "" AND year(b.tanggal) = '.$tahun;
					$query = mysqli_query($conn, $sql);
					$row = mysqli_fetch_assoc($query);
					$hitung = $row['count(*)'];
					$hitung = $hitung+1;
					if ($hitung>=1&&$hitung<=9) {
						$kode = "00".$hitung."/SH-DO/".$romawi."/".$tahun;
					} else if ($hitung>=10&&$hitung<=99) {
						$kode = "0".$hitung."/SH-DO/".$romawi."/".$tahun;
					} else if ($hitung>=100&&$hitung<=999) {
						$kode = $hitung."/SH-DO/".$romawi."/".$tahun;
					}
					$jml = $i;
					$dch = "INSERT INTO `table_sj` (`id_sj`, `id_sp`, `kodepl`, `tanggal`) VALUES (NULL, '".$id_sp."', '".$kodepl."', '".$tanggal."')";
					mysqli_query($conn, $dch);
					$last_id = mysqli_insert_id($conn);
					for ($i=1; $i <= $jml; $i++) {
						if ($_POST['qty'.$i]!=0) {
							$dch = "INSERT INTO `table_sj_detail` (`id_sj_detail`, `id_sj`, `id_produk`, `harga`, `qty`, `total`) VALUES (NULL, '".$last_id."', '".$_POST['kode_produk'.$i]."','".$_POST['harga'.$i]."', '".$_POST['qty'.$i]."', '".$_POST['harga'.$i]*$_POST['qty'.$i]."')";
							mysqli_query($conn, $dch);
						}
					}
					$dch = "INSERT INTO `table_kodesj` (`kode_sj`,`id_sj`) VALUES ('".$kode."','".$last_id."')";
					$query = mysqli_query($conn, $dch);
					if($query){
						$jenis_alert = "success";
						$alert = "Sukses Insert Data";
					}else{
						$jenis_alert = "danger";
						$alert = mysqli_error($conn);
					}
					echo '<script language="javascript">window.location.assign("?page=suratjalan")</script>';
				}
				?>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
