<?php
if (isset($_GET['po'])) {
	$qury = "SELECT *, CONCAT(b.Alamat,', ',b.kota) as alamat FROM `table_spp` a join pelanggan b on a.kodepl = b.kodepl join history_sp_detail hs on a.id_spp=hs.id_spp where a.id_spp = ".$_GET['po'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Penerimaan Produk</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Penerimaan Produk</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								</div>
								<div class="col-md-6">
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
													<th>Penghasil</th>
													<th>Total Pembelian</th>
													<th>Sisa Penerimaan</th>
													<th>Jumlah Penerimaan</th>
													<th>Stok</th>
												</tr>
											</thead>
											<?php
											$i=0;
											$qury = "SELECT s.kodesup,a.id_produk ,kode_produk, (SELECT Nama FROM `supplier` where kodesup = s.kodesup) Namasup, diskon, nama_produk, a.harga as hrg, qty, (SELECT sum(qty) FROM table_pp_detail pp join table_pp p on pp.id_pp=p.id_pp WHERE id_spp=a.id_spp AND id_produk=a.id_produk) qty2, total, s.status FROM table_spp s join table_spp_detail a on s.id_spp=a.id_spp join produk b on a.id_produk = b.id_produk WHERE a.id_spp = ".$_GET['po'];
											$qc = mysqli_query($conn, $qury);
											while ($hasil = mysqli_fetch_array($qc)) {
												$stok = $hasil['qty'];
												$sisa_penerimaan = $hasil['qty']-$hasil['qty2'];
												$i++;
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center"><input name="kode_produk'.$i.'" style="width: 100%" width="100%" type="hidden" readonly value="'.$hasil['id_produk'].'">'.$hasil['kode_produk'].'</td>
												<td>'.$hasil['nama_produk'].'</td>
												<td>'.$hasil['Namasup'].'</td>
												<td align="center">'.$stok.'</td>
												<td align="center">'.$sisa_penerimaan.'
												<input style="background: transparent;border: none; width:100%; text-align:center" type="text" name="harga'.$i.'" value="'.$hasil['hrg'].'" hidden><input style="" type="text" name="kodesup'.$i.'" value="'.$hasil['kodesup'].'" hidden></td>
												<td><input required style="background: transparent;border: none; width:100%; text-align:center" name="qty'.$i.'" style="width: 100%" value="0" min="0" max="'.$sisa_penerimaan.'" type="number"></td>
												<td><input style="background: transparent;border: none; text-align:center; width:100%" type="text" value="'.$hasil['qty'].'" disabled></td>
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
		$sql = 'SELECT count(*) FROM table_pp where year(tanggal) = '.$tahun;
		$query = mysqli_query($conn, $sql);
		$row = mysqli_fetch_assoc($query);
		$hitung = $row['count(*)'];
		$hitung = $hitung+1;
		if ($hitung>=1&&$hitung<=9) {
			$kode = "00".$hitung."/SH-PP/".$romawi."/".$tahun;
		} else if ($hitung>=10&&$hitung<=99) {
			$kode = "0".$hitung."/SH-PP/".$romawi."/".$tahun;
		} else if ($hitung>=100&&$hitung<=999) {
			$kode = $hitung."/SH-PP/".$romawi."/".$tahun;
		}
		$jml = $i;
		$dch = "INSERT INTO `table_pp` (`id_pp`, `kode_pp`, `id_spp`, `tanggal`, `status`, `status_gdg`) VALUES (NULL, '".$kode."', '".$_GET['po']."', NULL, '0', '0')";
		mysqli_query($conn, $dch);
		// echo $dch;
		$last_id = mysqli_insert_id($conn);
		for ($i=1; $i <= $jml; $i++) {
			if ($_POST['qty'.$i]!=0) {
				$dch = "INSERT INTO `table_pp_detail` (`id_pp_detail`,`kodesup`, `id_pp`, `id_produk`, `harga`, `qty`, `total`) VALUES (NULL, '".$_POST['kodesup'.$i]."', '".$last_id."', '".$_POST['kode_produk'.$i]."', '".$_POST['harga'.$i]."', '".$_POST['qty'.$i]."', '".$_POST['harga'.$i]*$_POST['qty'.$i]."')";
				$query = mysqli_query($conn, $dch);
				// echo $dch;
			}
		}
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
		echo '<script language="javascript">window.location.assign("?page=penerimaanpembelian")</script>';
	}
	?>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
