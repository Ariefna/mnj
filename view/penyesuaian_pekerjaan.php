<?php
if (isset($_GET['id_tk'])) {
	$qury = "select * from tugas_kerja a join pelanggan b on a.kodepl = b.kodepl where a.id_tk = ".$_GET['id_tk'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl = $hasil['kodepl'];
	$id_tk = $hasil['id_tk'];
	$kode_proyek = $hasil['kode_proyek'];
	$sales = $hasil['sales'];
	$Nama = $hasil['Nama'];
	$Alamat = $hasil['Alamat'];
}
?>
<script>
	function suggest(inputString){
		if(inputString.length == 0) {
			$('#suggestions').fadeOut();
		} else {
			$('#country').addClass('load');
			$.post("autosuggest.php", {queryString: ""+inputString+""}, function(data){
				if(data.length >0) {
					$('#suggestions').fadeIn();
					$('#suggestionsList').html(data);
					$('#country').removeClass('load');
				}
			});
		}
	}
	function fill(thisValue) {
		$('#country').val(thisValue);
		setTimeout("$('#suggestions').fadeOut();", 100);
	}
</script>
<?php
if (isset($_POST['submit'])) {
	$bulan = date('n', strtotime($_POST['tanggal']));
	$tahun = date('Y', strtotime($_POST['tanggal']));
	$sql = 'SELECT count(*) FROM penyelesaian_tk where year(tanggal) = '.$tahun;
	$query = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($query);
	$hitung = $row['count(*)'];
	$hitung = $hitung+1;
	if ($hitung>=1&&$hitung<=9) {
		$kode = "00".$hitung."/WOC-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=10&&$hitung<=99) {
		$kode = "0".$hitung."/WOC-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=100&&$hitung<=999) {
		$kode = $hitung."/WOC-PPP/".$bulan."/".$tahun;
	}
	$number = count($_POST['nama'])-1;
	$dch = "INSERT INTO `penyelesaian_tk` (`id_woc`, `id_tk`, `sales`, `kodepl`, `tanggal`, `status`, kode) VALUES (NULL, '".$id_tk."', '".$sales."', '".$kodepl."', '".$_POST['tanggal']."', '0', '".$kode."')";
	// echo $dch;
	$query = mysqli_query($conn, $dch);
	$last_id = mysqli_insert_id($conn);
	for ($i=0; $i <= $number; $i++) {
		$dch = "INSERT INTO `detail_penyelesaian_tk` (`id_woc_detail`, `id_woc`, `nama`, `qty`, `harga`, `total`) VALUES (NULL, '".$last_id."', '".$_POST['nama'][$i]."', '".$_POST['qty'][$i]."', '".$_POST['harga'][$i]."', '".$_POST['total'][$i]."')";
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
	echo '<script language="javascript">window.location.assign("penyelesaian.php?kode='.$kode.'")</script>';
}else {
	$dch = "SELECT AUTO_INCREMENT FROM  INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'akutansi_db' AND   TABLE_NAME   = 'tabel_transaksi';";
	$query = mysqli_query($conn, $dch);
	$id = mysqli_fetch_array($query);
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Penyelesaian Pekerjaan</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Form Penyelesaian Pekerjaan</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Tanggal</label>
								<input type="date" class="form-control" name="tanggal" onchange="myFunction(this.value)" required>
								<label for="inputAddress">Sales</label>
								<input readonly type="text" value="<?php echo $sales; ?>" class="form-control" id="Kode_Pelanggan" name="sales" required>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input type="text" class="form-control" id="alamat" name="Kode_Pelanggan" value="<?php echo $Nama; ?>" readonly required>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Kode Proyek</label>
								<input type="text" class="form-control" name="spku" value="<?php echo $kode_proyek; ?>" readonly>
								<input type="hidden" class="form-control" id="idsp" name="" value="<?php echo $id[0]; ?>" readonly>
								<!-- <label for="inputAddress">Kode penyelesaian</label>
									<input type="text" class="form-control" name="spku" value="" readonly> -->
									<label for="inputAddress">Kode Pemanfaat</label>
									<input type="text" value="<?php echo $kodepl; ?>" class="form-control" id="kodepl" name="kodeplku" readonly required>
									<label for="inputAddress">Alamat</label>
									<input type="text" value="<?php echo $Alamat; ?>" class="form-control" id="alamat" name="Kode_Pelanggan" readonly required>
								</div>
								<div class="col-md-12">

								</div>
								<div class="col-md-12">
									<br>
									<div class="table-responsive">
										<table class="table bordered" id="penjualan" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>Nama Barang</th>
													<th>Qty</th>
													<th>sisa</th>
													<th>Qty Kirim</th>
													<th>Harga</th>
													<th>Total</th>
												</tr>
											</thead>
											<tbody>
												<?php
												$no = 1;
												$sql = mysqli_query($conn, "select *, coalesce((select sum(qty) from detail_penyelesaian_tk where id_tk = a.id_tk and nama = a.nama_barang group by id_tk),'0') as kurang from tk_penjualan a where a.id_tk = ".$id_tk);

												while ($rows = mysqli_fetch_array($sql)) {
													if (($rows['qty']-$rows['kurang'])!=0) {
														echo '<tr>
														<td>'.$no++.'</td>
														<td><input style="width: 100%;border: none;background: #fff;" readonly type="text" name="nama[]" value="'.$rows['nama_barang'].'"></td>
														<td><input style="width: 100%;border: none;background: #fff;text-align: center;" readonly type="text" name="" value="'.$rows['qty'].'"></td>
														<td><input style="width: 100%;border: none;background: #fff;text-align: center;" class="qtyku" readonly type="number" value="'.($rows['qty']-$rows['kurang']).'"></td>
														<td><input style="width: 100%;border: none;background: #fff;text-align: center;" class="qty" type="number" min="0" max="'.($rows['qty']-$rows['kurang']).'" name="qty[]" value="0"></td>
														<td><input style="width: 100%;border: none;background: #fff;text-align: center;" class="price" readonly type="number" name="harga[]" value="'.$rows['harga'].'"></td>
														<td><input style="width: 100%;border: none;background: #fff;text-align: center;" class="amount" type="text" name="total[]" value="0"></td>
														</tr>';
													}

												}
												?>
											</tbody>
											<tfoot>
												<th colspan="3" align="left" style="text-align: right;">Total</th>
												<th class="qtykutot"></th>
												<th class="qtytot"></th>
												<th></th>
												<th class="total">0</th>
											</tfoot>
											<?php
											?>
										</table>
									</div>
								</div>
							</div>
							<center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="window.location.href=?page=approve_penyesuaian_pekerjaan">Simpan</button></center>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<script>
		$(document).ready(function(){
			total();
			$('.qty').change(function() {
				total();
			});
			$('.amount').change(function() {
				total();
			});
		});
		function total()
		{
			var sum = 0;
			var sumqty = 0;
			var sumqtyku = 0;
			$('#penjualan > tbody  > tr').each(function() {
				var qty = $(this).find('.qty').val();
				var price = $(this).find('.price').val();
				var qtyku = $(this).find('.qtyku').val();
				var amount = (qty*price);
				sum+=amount;
				sumqtyku+=parseInt(qtyku);
				sumqty+=parseInt(qty);
				$(this).find('.amount').val(amount);
			});
			$('.total').text(sum);
			$('.qtykutot').text(sumqtyku);
			$('.qtytot').text(sumqty);
		}
	</script>
