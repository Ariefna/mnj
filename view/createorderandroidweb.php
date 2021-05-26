<?php
if (isset($_GET['id'])) { 
	$qury = "SELECT *, (select Nama from supplier where kodesup=a.kodesup) as nama_pt, (select Kota from supplier where kodesup=a.kodesup) as kota FROM order_android a where id_order = ".$_GET['id'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$sts = $hasil['status'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Create Operasional</h1>
	</div>
	<!--<form action="" method="POST">-->
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Create Operasional</h6>
					</div>
					<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<label for="inputAddress">Kode Order PO</label>
									<input type="text" class="form-control" name="kode_orderpo" value="<?php echo $hasil['kode_orderpo']; ?>" readonly="">
									<label for="inputAddress">Nama Penghasil</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['nama_pt']; ?>" readonly="">
								</div>
								<div class="col-md-6">
									
									<label for="inputAddress">Nama Pemanfaat</label>
									<input type="text" required class="form-control" name="namandyc" id="kodeplnyaid" oninput="kodeplnya(this.value)" list="browsers3"><datalist id="browsers3"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `pelanggan` a");
									while ($rdjc = mysqli_fetch_array($rdcjn)) { 
										// echo '<option value="'.$rdjc['Nama'].'">';
										echo '<option value="'.$rdjc['kodepl'].'" data-id="'.$rdjc['Nama'].'">'.$rdjc['Nama'].'</option>';
										} ?>
									</datalist>
									<input type="hidden" name="kodepl" id="kodeplreal">
									<label for="inputAddress">Ongkos Kerja</label>
							    	<input type="number" class="form-control" name="ongkir" value="0" required>
									</div>
								<div class="col-md-12">
								<br>
							</div>
								
							</div>

								<!-- <button type="button" name="add" id="add" class="btn btn-success btn-sm">Tambah Limbah</button> -->
									<div class="table-responsive">
										<table class="table bordered" id="dynamic_field" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>Jenis Limbah</th>
													<th>Qty Penghasil</th>
													<th>Status</th>
												</tr>
											</thead>
											<tbody>
											<?php
											$djndn = "SELECT * FROM `order_android_detail` a join produk b on a.produk_id = b.id_produk join satuan c on a.id_satuan = c.id_satuan where a.id_order = ".$_GET['id'];
											$dj = mysqli_query($conn, $djndn);
											$i=1;
											while ($jdbvj = mysqli_fetch_array($dj)) {
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['nama_produk'].'</td>
												<td align="center">'.$jdbvj['quantity_order'].'</td>
												<td align="center">'.$jdbvj['nama_satuan'].'</td>
												</tr>';
												$i++;
											}
											?>
											</tbody>

										</table>
									</div>
									<br>
									<button type="button" name="add2" id="add2" class="btn btn-success btn-sm">Tambah Kendaraan</button>
									<div class="table-responsive">
										<table class="table bordered" id="dynamic_field2" width="100%" cellspacing="0">
											<thead>
												<tr>
												<th>Kode Kendaraan</th>
													<th>Nama Kendaraan</th>
													<th>Plat Nomor</th>
													<th>Driver</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>
												
											</tbody>

										</table>
									</div>
								
							<center>
								<br>
								<?php
								if($sts != 2){
									echo '<button name="submit" type="submit" id="button_check_y" class="col-md-3 btn btn-primary">Simpan</button>';
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
	function kodeplnya(value){
		var id = $('#browsers3 option[value=' + value +']').attr('data-id');
		// var nama = $('#browsers3 option[value=' + value +']').attr('data-nama');
		$('#kodeplreal').val(value);
		$('#kodeplnyaid').val(id);
	}
	function kendaraannya(value, no){
		var id = $('#browsers1 option[value=' + value +']').attr('data-id');
		var nama = $('#browsers1 option[value=' + value +']').attr('data-nama');
		var plat = $('#browsers1 option[value=' + value +']').attr('data-plat');
		// var nama = $('#browsers3 option[value=' + value +']').attr('data-nama');
		$('#kodekendaraan'+no).val(value);
		$('#nama'+no).val(nama);
		$('#plat'+no).val(plat);
		$('#idku'+no).val(id);
	}
	$('#mySelect').change(function(){ 
    var value = $(this).val();
});
		function valuechange(){
			// alert();
			var qty = $('#qty1').val();
			// alert(qty);
			var harga = $('#harga').val();
			var total = qty * harga;
			$('#totalku').val(total);
		}
		
	</script>
	<?php
	if (isset($_POST['submit'])) {
		$tgl = date("Y-m-d");
		$sql = "UPDATE `order_android` SET `status` = '2',`kodepl` = '".$_POST['kodepl']."',`ongkir` = '".$_POST['ongkir']."' WHERE `order_android`.`id_order` = ".$_GET['id'];
		mysqli_query($conn, $sql);
		$number = count($_POST['idku'])-1;
		for ($i=0; $i <= $number; $i++) {
			$sql = "INSERT INTO `order_android_kendaraan` (`id_order_android_kendaraan`, `id_kendaraan`, `id_order`, `driver`) VALUES (NULL, '".$_POST['idku'][$i]."', '".$_GET['id']."', '".$_POST['driver'][$i]."')";
			$query = mysqli_query($conn, $sql);
		}
		$quy = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$_POST['kode_orderpo']."', '1108.99', '".$tgl."', '".$_POST['kode_orderpo']."', 'Ongkos Kirim ".$_POST['kode_orderpo']."', '', '".$_POST['ongkir']."', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $quy);
				$qu = "INSERT INTO `tabel_transaksi` (`id_transaksi`, `kode_transaksi`, `kode_rekening`, `tanggal_transaksi`, `jenis_transaksi`, `keterangan_transaksi`, `debet`, `kredit`, `tanggal_posting`, `keterangan_posting`, `Kode_Pelanggan`, `id_admin`) VALUES (NULL, '".$_POST['kode_orderpo']."', '7404', '".$tgl."', '".$_POST['kode_orderpo']."', 'Ongkos Kirim ".$_POST['kode_orderpo']."', '".$_POST['ongkir']."', '', '', '', '".$hasil['kodesup']."', '".$_SESSION['id_admin']."')";
				mysqli_query($conn, $qu);
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
		echo '<script language="javascript">window.location.assign("?page=createorderandroid")</script>';

	}

	?>
	
	<datalist id="browsers1" oninput="kendaraan"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `kendaraan`");while ($rdjc = mysqli_fetch_array($rdcjn)) { echo '<option data-id="'.$rdjc['id_kendaraan'].'" data-kode="'.$rdjc['kode_kendaraan'].'" data-plat="'.$rdjc['plat_nomor'].'" data-nama="'.$rdjc['nama_kendaraan'].'" value="'.$rdjc['kode_kendaraan'].'">'.$rdjc['nama_kendaraan'].'</option>'; } ?></datalist>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>
	var c = 0;
	var i=0;
	var c2 = 0;
	
	var i2=0;
	$('#add2').click(function(){
		i2++;
		$('#dynamic_field2').append('<tr id="row'+i2+'"><td align="center"><input type="hidden" id="idku'+i2+'" name="idku[]"><input class="text-center" name="kodekendaraan[]" id="kodekendaraan'+i2+'" style="width: 100%;border: none;" readonly></td><td align="center"><input type="text" id="nama'+i2+'" style="width: 100%;border: none;background: #fff;" oninput="kendaraannya(this.value, '+i2+')" list="browsers1"></td><td align="center"><input type="text" id="plat'+i2+'" name="plat[]" class="text-center totalsubnya" style="width: 100%;border: none;background: #fff;" readonly></td><td align="center"><input type="text" name="driver[]" class="text-center" style="width: 100%;border: none;background: #fff;"></td><td align="center"><button type="button" name="remove" id="'+i2+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
		c2=i2;
		
	});

	function disk(){
		var sum2 = $('#totrp').text();
		disk = $('#disks').val();
		disk = sum2/100*disk;
		$('#disk').text(disk);
		var tot = sum2-disk;
		$('#net').text(tot);
	}

	<?php
	for ($i=1; $i <= 1000; $i++) {
		?>
		function produk<?php echo $i; ?>(value){
			$.ajax({
				type: "POST",
				url: "autosuggest.php",
				data: {
					produk: value
				},
				success: function (data) {
					var json = JSON.parse(data);
					$('#harga<?php echo $i; ?>').val(json.harga_produk);
					$('#kode<?php echo $i; ?>').val(json.id_produk);
					$('#kode_produk<?php echo $i; ?>').val(json.kode_produk);
				}
			});
		}
		function sum<?php echo $i; ?>(value){
			var harga = $('#harga<?php echo $i; ?>').val();
			var qty = $('#qty<?php echo $i; ?>').val();
			$('#total<?php echo $i; ?>').val(harga*qty);
			var sum = 0;
			var sum2 = 0;
			$('.qty').each(function(){
				var input = $(this).val();
				if($.isNumeric(input)){
					sum += parseFloat(input);
				}
			});
			$('.tot').each(function(){
				var input = $(this).val();
				if($.isNumeric(input)){
					sum2 += parseFloat(input);
				}
			});
			$('#totqty').text(sum);
			$('#totrp').text(convertToRupiah(sum2));
			disk = $('#disks').val();
			disk = sum2/100*disk;
			$('#disk').text(convertToRupiah(disk));
			var tot = sum2-disk;
			var ppn;
			ppn = $('#tambahan0').val();
			$('#nilai2').text(convertToRupiah(tot*(ppn/100)));
			$('#valuetambahan0').val(tot*(ppn/100));
			$('#net').text(convertToRupiah(tot+(tot*(ppn/100))));
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
		<?php
	}
	?>
	function pelanggan(nama, saldo, alamat, kodepl) {
		$('#nama').val(nama);
		$('#kodepl').val(kodepl);
		$('#saldo').val(saldo);
		$('#alamat').val(alamat);
		setTimeout("$('#suggestions').fadeOut();", 100);
	}
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
					$('#kodes<?php echo $i; ?>').val(json.kode);
					$('#nama<?php echo $i; ?>').val(json.nama);
				}
			});
		}
	<?php } ?>
</script>
	</script>
