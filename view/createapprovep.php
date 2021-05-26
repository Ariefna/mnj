<?php
if (isset($_GET['spp'])) {
	$qury = "SELECT *, DATE_FORMAT(tanggal, '%d %M %Y') as tanggal, (select Nama from supplier where kodesup = a.kodesup) Nama, (select Alamat from supplier where kodesup = a.kodesup) Alamat, (select saldo from supplier where kodesup = a.kodesup) saldo, (select kode_orderpo from order_android where id_order = a.id_order) kode_orderpo FROM `table_spp` a where id_spp = ".$_GET['spp'];
	
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$id_spp = $_GET['spp'];
	$sts = $hasil['status'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Purchase Order</h1>
	</div>
	<!--<form action="" method="POST">-->
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Detail Purchase Order</h6>
					</div>
					<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<label for="inputAddress">Tanggal</label>
									<input type="text" class="form-control" value="<?php echo $hasil['tanggal']; ?>" name="tanggal" onchange="myFunction(this.value)" required="" readonly>
									<label for="inputAddress">Diskon</label>
											<input type="text" min="0" value="<?php echo $hasil['diskon']; ?> %" max="100"  onchange="disk()" class="form-control" id="disks" name="diskon" required="" readonly>
									<label for="inputAddress">Nama Penghasil</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['Nama']; ?>" readonly="">
									<label for="inputAddress">Kode Order PO</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['kode_orderpo']; ?>" readonly="">
								</div>
								<div class="col-md-6">
									<label for="inputAddress">Kode PO</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['kodesup']; ?>" readonly="">
									<input type="hidden" class="form-control" id="idsp" name="" value="<?php echo $hasil['id_spp']; ?>" readonly="">
									<label for="inputAddress">Alamat</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['Alamat']; ?>" readonly="">
									<label for="inputAddress">Saldo</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['saldo']; ?>" readonly="">
							    	<label for="inputAddress">Kode PO</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['kode_spp']; ?>" readonly="">
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
													<th>Saldo</th>
													<th>Nominal (Rp)</th>
													<!-- <th>Aksi</th> -->

												</tr>
											</thead>
											<tbody>
												<?php
												$sql = "SELECT *, (SELECT Nama FROM `supplier` where kodesup = g.kodesup) Namasup, COALESCE((SELECT (sum(debet)-sum(kredit)) FROM `table_hutang` a join supplier b on b.kodesup = a.kodesup where b.kodesup = g.kodesup ORDER by `kodehutang` DESC), 0) saldo from tabel_spp_acccount g join tabel_master h on g.kode_rekening = h.kode_rekening where g.id_spp_account = ".$_GET['spp'];
											
												$tot =0;
												$connect = mysqli_query($conn, $sql);
												while ($row = mysqli_fetch_array($connect)) {
													echo '<tr id="row"><td align="center"><input disabled="disabled" style="width: 100%;border: none;" value="'.$row['kode_rekening'].'" class="text-center"></td><td align="center"><input disabled="disabled" type="text" value="'.$row['nama_rekening'].'" id="nama" style="width: 100%;border: none;background: #fff;"></td><td><input disabled="disabled" style="width: 100%;border: none;background: #fff;" '.$row['saldo'].' type="number" ></td><td align="center"><input disabled="disabled" value="'.$row['nominal'].'" type="number" id="nama" name="nominal[]" class="text-center totalsubnya" oninput="disk21()" style="width: 100%;border: none;background: #fff;"></td></tr>';
													$tot += $row['nominal'];
												}
												?>
											</tbody>
											<tfoot>
												<tr>
													<th colspan="3" style="text-align: right;">Total</th>
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
													<th>Jumlah Pembelian</th>
													<th>Total</th>
												</tr>
											</thead>


											<?php
											$i = 0;
											$qury = "SELECT kode_produk, pph, ppn, diskon, nama_produk, a.harga as hrg, qty, total, b.status FROM table_spp s join table_spp_detail a on s.id_spp=a.id_spp join produk b on a.id_produk = b.id_produk WHERE a.id_spp = ".$_GET['spp'];
											$qc = mysqli_query($conn, $qury);
											$jum=0;
											$diskon=0;
											$jumq=0;
											while ($hasil = mysqli_fetch_array($qc)) {
												// $sts=$hasil['status'];
												$pph=$hasil['pph'];
												$ppn=$hasil['ppn'];
												$diskon = $hasil['diskon'];
												$jumq += $hasil['qty'];
												$i++;
												$jum += $hasil['total'];
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$hasil['kode_produk'].'</td>
												<td>'.$hasil['nama_produk'].'</td>
												<td align="center">'.number_format($hasil['hrg'],0,',','.').'</td>
												<td align="center">'.$hasil['qty'].'</td>
												<td align="center">'.number_format($hasil['total'],0,',','.').'</td>
												</tr>';
											}
											echo '
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">Total Qty</td>
											<td align="center">'.$jumq.'</td>
											<td align="center"></td>
											</tr>
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">Brutto (Rp)</td>
											<td align="center">'.number_format($jum,0,',','.').'</td>
											</tr>
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">Diskon (Rp)</td>
											<td align="center">-'.number_format(($jum*$diskon/100),0,',','.').'</td>
											</tr>
											
											</tr>
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">PPN (Rp)</td>
											<td align="center">'.number_format(($ppn),0,',','.').'</td>
											</tr>
											<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">Netto (Rp)</td>
											<td align="center">'.number_format(($jum-($jum*$diskon/100)+$ppn+$pph),0,',','.').'</td>
											</tr>';
											echo "<script>var netto = ".($jum-($jum*$diskon/100)+$ppn+$pph)."</script>";
											?>

										</table>
										<!-- <tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td align="right">PPH (Rp)</td>
											<td align="center">'.number_format(($pph),0,',','.').'</td>
											</tr> -->
									</div>
								</div>
							</div>
							<center>
								<?php
								if (($tot) < ($jum-($jum*$diskon/100))) {
								}
								if($sts != 1){
									echo '<button name="submit" type="submit" id="button_check_y" class="col-md-3 btn btn-primary">Approve</button>';
								}

								?>
							</center>

						</div>
					</form>
				</div>
			</div>
		</div>
		<!--</form>-->
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
			if ($('#totalnya').val() >= netto) {
				alert("sudah pas");
			}
			i2++;
			$('#dynamic_field2').append('<tr id="row'+i2+'"><td align="center"><input class="text-center" name="koderekening[]" id="kode'+i2+'" style="width: 100%;border: none;" readonly></td><td align="center"><input type="text" id="nama'+i2+'" style="width: 100%;border: none;background: #fff;" list="browsers2" onchange="sjsj'+i2+'(value);"><datalist id="browsers2"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `tabel_master` where nama_rekening like 'Kas%' OR nama_rekening like 'Bank%'");while ($rdjc = mysqli_fetch_array($rdcjn)) { echo '<option value="'.$rdjc['kode_rekening']." ".$rdjc['nama_rekening'].'">'; } ?></datalist></td><td align="center"><input type="text" id="kodesup'+i2+'" style="width: 100%;border: none;background: #fff;" list="browserss2" onchange="sjsjr'+i2+'(value);"><datalist id="browserss2"><?php $jdjd = mysqli_query($conn, "SELECT * FROM `supplier`");while ($dd = mysqli_fetch_array($jdjd)) { echo '<option value="'.$dd['Nama'].'">'; } ?></datalist><input type="hidden" id="kodesuphid'+i2+'" name="kodesuphid1[]"></td><td align="center"><input type="text" id="saldo'+i2+'" readonly="readonly" name="saldo[]" class="text-center" style="width: 100%;border: none;background: #fff;" ></td><td align="center"><input type="number" name="nominal[]" class="text-center totalsubnya" oninput="disk2'+i2+'()" style="width: 100%;border: none;background: #fff;" ></td><td align="center"><button type="button" name="remove" id="'+i2+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
			c2=i2;
		});
		$(document).on('click', '.btn_remove', function(){
			var button_id = $(this).attr("id");
			$('#row'+button_id+'').remove();
		});

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
			function sjsjr<?php echo $i; ?>(value){
				$.ajax({
					type: "POST",
					url: "autosuggest.php?kodesupp=1",
					data: {
						rek: value
					},
					success: function (data) {
						var json = JSON.parse(data);
						$('#kodesup<?php echo $i; ?>').val(json.Nama);
						$('#saldo<?php echo $i; ?>').val(json.saldo);
						$('#nominal<?php echo $i; ?>').val(json.saldo);
						$('#kodesuphid<?php echo $i; ?>').val(json.kodesup);
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

			}
		<?php } ?>
	</script>
	<?php
	if (isset($_POST['submit'])) {
		$tgl = date("Y-m-d");
		$sql = "UPDATE `table_spp` SET `status` = '1' WHERE `table_spp`.`id_spp` = ".$_GET['spp'];
		mysqli_query($conn, $sql);
		$sql = "SELECT * FROM `table_spp`".$_GET['spp'];
		$query = mysqli_query($conn, $sql);
		$qury = "SELECT s.kode_spp, kodesup, kode_produk, diskon, nama_produk, a.harga as hrg, qty, total, b.status FROM table_spp s join table_spp_detail a on s.id_spp=a.id_spp join produk b on a.id_produk = b.id_produk WHERE a.id_spp = ".$_GET['spp'];

		$qc = mysqli_query($conn, $qury);
		while ($hasil = mysqli_fetch_array($qc)) {
			if ($hasil['status'] == 1) {
				$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '1405.02', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '', '".$hasil['total']."', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $quy);
				$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '7404', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '".$hasil['total']."', '', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $qu);
			}
			else if ($hasil['status'] == 2) {
				$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '1108.01', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '', '".$hasil['total']."', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $quy);
				$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '7404', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '".$hasil['total']."', '', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $qu);
			}
			else if ($hasil['status'] == 3) {
				$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '1108.99', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '', '".$hasil['total']."', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $quy);
				$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$hasil['kode_spp']."', '7404', '".$tgl."', '".$hasil['kode_spp']."', 'Pembelian Barang ".$hasil['kode_spp']."', '".$hasil['total']."', '', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $qu);
			}
		}
		echo '<script language="javascript">window.location.assign("?page=approvep")</script>';
	}
	if (isset($_POST['simpan'])) {
		$number = count($_POST['koderekening'])-1;
		for ($i=0; $i <= $number; $i++) {
			$sql = "INSERT INTO `tabel_spp_acccount` (`id_spp_account`, `kode_rekening`, `id_spp`, `nominal`, `kodesup`) VALUES (NULL, '".$_POST['koderekening'][$i]."', '".$_GET['spp']."', '".$_POST['nominal'][$i]."', '".$_POST['kodesuphid1'][$i]."')";
			echo $sql;
			$query = mysqli_query($conn, $sql);
		}
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
	// echo "<script>alertku('$jenis_alert', '$alert')</script>";
		echo '<script language="javascript">window.location.assign("?page=createapprovep&spp='.$_GET['spp'].'")</script>';
	}
	?>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
