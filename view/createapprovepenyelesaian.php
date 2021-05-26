<?php
if (isset($_GET['id_woc'])) {
	$qury = "select *, a.status as status1 from penyelesaian_tk a join pelanggan b on a.kodepl = b.kodepl join tugas_kerja c on c.id_tk = a.id_tk where a.id_woc = ".$_GET['id_woc'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kode = $hasil['kode'];
	$id_woc = $hasil['id_woc'];
	$Nama = $hasil['Nama'];
	$sales = $hasil['sales'];
	$kodepl = $hasil['kodepl'];
	$Alamat = $hasil['Alamat'];
	$tanggal = $hasil['tanggal'];
	$id_tk = $hasil['id_tk'];
	$status = $hasil['status1'];
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
	$qu = "select kode_inv from table_kodesj where not kode_inv = '' order by 1 DESC LIMIT 1";
	$qc2 = mysqli_query($conn, $qu);
	$hasil2 = mysqli_fetch_array($qc2);
	$inv = $hasil2['kode_inv'];
	$hitung = intval($inv)+1;
	$bulan = date('n', strtotime($tanggal));
	$tahun = date('Y', strtotime($tanggal));
	if ($hitung>=1&&$hitung<=9) {
		$kodr = "00".$hitung."/INV-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=10&&$hitung<=99) {
		$kodr = "0".$hitung."/INV-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=100&&$hitung<=999) {
		$kodr = $hitung."/INV-PPP/".$bulan."/".$tahun;
	}
	$qu = "INSERT INTO `table_kodesj` (`id_kode`, `kode_sj`, `kode_inv`, `id_sj`, `Kode_tk`, `tanggal_k`) VALUES (NULL, '', '".$kodr."', '', '".$kode."', '".$tanggal."')";
	mysqli_query($conn, $qu);
	$sjt = array_sum($_POST['total']);
	$query = "UPDATE `penyelesaian_tk` SET `status`= 1 WHERE `id_woc`='".$_GET['id_woc']."'";
	mysqli_query($conn, $query);
	$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$kode."', '4101.06', '".$tanggal."', '".$kodr."', 'Tugas Kerja ".$kodr."', '', '".$sjt."', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	mysqli_query($conn, $quy);
	$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$kode."', '1105.00', '".$tanggal."', '".$kodr."', 'Tugas Kerja ".$kodr."', '".$sjt."', '', '', '', '".$kodepl."', '".$_SESSION['id_admin']."')";
	mysqli_query($conn, $qu);
	echo "<script language='javascript'>window.location.assign('?page=approve_penyesuaian_pekerjaan');</script>";
	
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
								<input type="date" readonly class="form-control" name="tanggal" value="<?php echo $tanggal; ?>" onchange="myFunction(this.value)" required>
								<label for="inputAddress">Sales</label>
								<input readonly type="text" value="<?php echo $sales; ?>" class="form-control" id="Kode_Pelanggan" name="sales" required>
								<label for="inputAddress">Nama Pemanfaat</label>
								<input type="text" class="form-control" id="alamat" name="Kode_Pelanggan" value="<?php echo $Nama; ?>" readonly required>
							</div>
							<div class="col-md-6">
								<label for="inputAddress">Kode Penyelesaian</label>
								<input type="text" class="form-control" name="spku" value="<?php echo $kode; ?>" readonly>
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
													<th>Qty Kirim</th>
													<th>Harga</th>
													<th>Total</th>
												</tr>
											</thead>
											<tbody>
												<?php 
												$no = 1;
												$query = "select *, coalesce((select sum(qty) from detail_penyelesaian_tk c where id_woc = '".$id_woc."' and nama = a.nama_barang group by id_woc),'0') as kurang from tk_penjualan a where a.id_tk = ".$id_tk;
												$sql = mysqli_query($conn, $query);

												while ($rows = mysqli_fetch_array($sql)) {
													echo '<tr>
													<td>'.$no++.'</td>
													<td><input readonly style="width: 100%;border: none;background: #fff;" type="text" name="nama[]" value="'.$rows['nama_barang'].'"></td>
													<td><input class="qtyku" style="width: 100%;border: none;background: #fff;text-align: center;" readonly type="number" value="'.($rows['qty']).'"></td>
													<td><input class="qty" style="width: 100%;border: none;background: #fff;text-align: center;" type="number" value="'.($rows['kurang']).'" name="qty[]" readonly></td>
													<td><input class="price" style="width: 100%;border: none;background: #fff;text-align: center;" readonly type="number" name="harga[]" value="'.$rows['harga'].'"></td>
													<td><input class="amount" style="width: 100%;border: none;background: #fff;text-align: center;" type="text" name="total[]" value="0" readonly></td>
													</tr>';

												}
												?>
											</tbody>
											<tfoot>
												<th colspan="2" align="left" style="text-align: right;">Total</th>
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
							
							<?php 
							if ($status == 0) {
								echo '<center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="window.location.href=?page=approve_penyesuaian_pekerjaan">Approve</button></center>';
							} ?>
							
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