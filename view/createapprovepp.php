<?php
if (isset($_GET['pp'])) {
	$qury = "SELECT * FROM `table_pp` where id_pp = ".$_GET['pp'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kode_pp = $hasil['kode_pp'];
	$sts = $hasil['status'];
	$id_pp = $hasil['id_pp'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Penerimaan Produk</h1>
	</div>
	<!--<form action="" method="POST">-->
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Penerimaan Produk <?php if ($sts == 2) { ?><button class="btn btn-danger float-right"><?php echo "BATAL"; ?></button> <?php	} ?></h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Kode Penerimaan Produk</label>
								<input type="text" class="form-control" name="kodesuratjalan" value="<?php echo $hasil['kode_pp']; ?>" name="Kode_Pelanggan" disabled>
							</div>
							<div class="col-md-6">
							</div>
							<div class="col-md-12">
								<br><form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
								<div class="table-responsive">
									<table class="table bordered" id="" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th width="50px">No</th>
												<th width="120px">Kode Produk</th>
												<th>Nama Produk</th>
												<th width="200px">Jumlah Penerimaan</th>
											</tr>
										</thead>


										<?php
										$qury = "SELECT * FROM `table_pp` WHERE id_pp = ".$_GET['pp'];
										$i = 0;
										$qc = mysqli_query($conn, $qury);
										$cek = mysqli_num_rows($qc);
										if($cek > 0){
											$qury = "SELECT * FROM `table_pp_detail` a join produk b on a.id_produk = b.id_produk join table_pp c on c.id_pp = a.id_pp WHERE a.id_pp = ".$_GET['pp']." GROUP by a.id_produk";

										}else {
											$qury = "SELECT * FROM `table_pp_detail` a join produk b on a.id_produk = b.id_produk join table_pp c on c.id_pp = a.id_pp WHERE a.id_pp = ".$_GET['pp']." GROUP by a.id_produk";
										}

										$qc = mysqli_query($conn, $qury);
										while ($hasil = mysqli_fetch_array($qc)) {
											$sts=$hasil['status'];
											if ($hasil[3]!=0) {
												$i++;
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center"><input name="id_produk'.$i.'" style="width: 100%" width="100%" type="hidden" readonly value="'.$hasil['id_produk'].'">'.$hasil['kode_produk'].'</td>
												<td>'.$hasil['nama_produk'].'</td>

												<td><input name="qty'.$i.'" style="background: transparent;border: none; text-align:center; width:100%" type="text" value="'.$hasil['qty'].'" readonly></td>
												</tr>';
											}
										}
										?>
									</table>
								</div>
							</div>
						</div>
						<center>
							<?php if ($sts!=1) { ?>
								<button name="submit1" type="submit" class="col-md-3 btn btn-primary">Approve</button>
							<?php } ?>

						</form></center>
					</div>
				</div>
			</div>
		</div>
		<!--</form>-->

	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script language='javascript'>
		function hehe() {
			window.location.assign('?page=suratjalan');
		}

	</script>
	<?php
	if (isset($_POST['submit1'])) {
		$qu = "UPDATE `table_pp` SET `status_gdg`= 1, `status`= 1 WHERE `id_pp`='".$id_pp."'";
		mysqli_query($conn, $qu);
		$jml = $i;
		for ($i=1; $i <= $jml; $i++) {
			$select = "INSERT INTO `history_produk` (`id_stok`, `id_produk`, `masuk`, `keluar`, `date`) VALUES (NULL, '".$_POST['id_produk'.$i]."', '".$_POST['qty'.$i]."', '0', CURRENT_TIMESTAMP);";
			$querys = mysqli_query($conn, $select);
		}
		echo "<script language='javascript'>window.location.assign('?page=approvepen');</script>";
	}
	// if (isset($_POST['submit'])) {
	// 	date_default_timezone_set("Asia/Jakarta");
	// 	$tanggal = date("Y-m-d");
	// 	$qu = "SELECT kode_inv from table_kodesj where not kode_inv = '' order by 1 DESC LIMIT 1";
	// 	$qc2 = mysqli_query($conn, $qu);
	// 	$hasil2 = mysqli_fetch_array($qc2);
	// 	$inv = $hasil2['kode_inv'];
	// 	$hitung = intval($inv)+1;
	// 		$bulan = date('n', strtotime($tgl));
	// 		if ($bulan==1) {
	// 			$romawi="I";
	// 		} elseif ($bulan==2) {
	// 			$romawi="II";
	// 		} elseif ($bulan==3) {
	// 			$romawi="III";
	// 		} elseif ($bulan==4) {
	// 			$romawi="IV";
	// 		} elseif ($bulan==5) {
	// 			$romawi="V";
	// 		} elseif ($bulan==6) {
	// 			$romawi="VI";
	// 		} elseif ($bulan==7) {
	// 			$romawi="VII";
	// 		} elseif ($bulan==8) {
	// 			$romawi="VIII";
	// 		} elseif ($bulan==9) {
	// 			$romawi="IX";
	// 		} elseif ($bulan==10) {
	// 			$romawi="X";
	// 		} elseif ($bulan==11) {
	// 			$romawi="XI";
	// 		} elseif ($bulan==12) {
	// 			$romawi="XII";
	// 		}
	// 	$tahun = date('Y', strtotime($tgl));
	// 	if ($hitung>=1&&$hitung<=9) {
	// 		$kodr = "00".$hitung."/SH-INV/".$romawi."/".$tahun;
	// 	} else if ($hitung>=10&&$hitung<=99) {
	// 		$kodr = "0".$hitung."/SH-INV/".$romawi."/".$tahun;
	// 	} else if ($hitung>=100&&$hitung<=999) {
	// 		$kodr = $hitung."/SH-INV/".$romawi."/".$tahun;
	// 	}
	// 	$qu = "UPDATE `table_pp` SET `status`= 1 WHERE `id_pp`='".$id_pp."'";
	// 	mysqli_query($conn, $qu);
	// 	$qu = "UPDATE `table_kodesj` SET `kode_inv` = '".$kodr."', tanggal_k = '".$tgl."' WHERE `table_kodesj`.`kode_pp` = '".$kodesj."'";
	// 	mysqli_query($conn, $qu);
	// 	$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$kodesj."', '4101.06', '".$tgl."', '".$kodr."', 'Penjualan ".$kodr."', '', '".$sjt."', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	// 	mysqli_query($conn, $quy);
	// 	$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$kodesj."', '1105.00', '".$tgl."', '".$kodr."', 'Penjualan ".$kodr."', '".$sjt."', '', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	// 	mysqli_query($conn, $qu);
	// 	$qu = "INSERT INTO `table_piutang` (`kodepiutang`, `kodepl`, `tanggal`, `debet`, `kredit`, `keterangan`) VALUES (NULL, '".$kodepl."', '".$tgl."', '".$sjt."', '0', 'Penjualan ".$kodr."')";
	// 	mysqli_query($conn, $qu);
	// 	echo "<script language='javascript'>window.location.assign('?page=approvesj');</script>";
	// }
	?>
