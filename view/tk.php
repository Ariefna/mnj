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
	$sql = 'SELECT count(*) FROM tugas_kerja';
	$query = mysqli_query($conn, $sql);
	$row = mysqli_fetch_assoc($query);
	$hitung = $row['count(*)'];
	$hitung = $hitung+1;
	if ($hitung>=1&&$hitung<=9) {
		$kode = "00".$hitung."/KTK-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=10&&$hitung<=99) {
		$kode = "0".$hitung."/KTK-PPP/".$bulan."/".$tahun;
	} else if ($hitung>=100&&$hitung<=999) {
		$kode = $hitung."/KTK-PPP/".$bulan."/".$tahun;
	}
	$dch = "INSERT INTO `tugas_kerja` (`id_tk`, `kode_proyek`, `kodepl`, `sales`, `tempo`, `margin`, `tanggal`) VALUES (NULL, '".$kode."', '".$_POST['kodepl']."', '".$_POST['sales']."', '".$_POST['tempo']."', '".$_POST['margin']."', '".$_POST['tanggal']."');";
	$query = mysqli_query($conn, $dch);
	$last_id = mysqli_insert_id($conn);
	$number = count($_POST['nama_barang'])-1;
	$number2 = count($_POST['keterangan'])-1;
	for ($i=0; $i <= $number; $i++) {
		$sql = "INSERT INTO `tk_penjualan` (`id_penjualan_tk`, `id_tk`, `qty`, `harga`, `nama_barang`) VALUES (NULL, '".$last_id."', '".$_POST['qty'][$i]."', '".$_POST['harga'][$i]."', '".$_POST['nama_barang'][$i]."')";
		mysqli_query($conn, $sql);
	}
	for ($s=0; $s <= $number2; $s++) {
		$sql = "INSERT INTO `anggaran_tk` (`id_anggaran`, `id_tk`, `keterangan`, `qty`, `harga`, `total`) VALUES (NULL, '".$last_id."', '".$_POST['keterangan'][$s]."', '".$_POST['qty2'][$s]."', '".$_POST['harga2'][$s]."', '".$_POST['harga2'][$s]*$_POST['qty2'][$s]."');";
		mysqli_query($conn, $sql);
	}
	echo '<script language="javascript">window.location.assign("tugas.php?kode_proyek='.$kode.'")</script>';	
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Proyek</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Form Proyek</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Tanggal</label>
								<input type="date" class="form-control" name="tanggal" onchange="myFunction(this.value)" required>
								<label for="inputAddress">Sales</label>
								<input type="text" class="form-control" id="Kode_Pelanggan" name="sales" required>
								<label for="inputAddress">Jatuh Tempo (Hari)</label>
								<input class="form-control" name="tempo" type="number" required></input>
								<label for="inputAddress">Nama Pemanfaat</label>
								<div class="form-row">
									<div class="form-group col-md-12">
										<input autocomplete="off" type="text" class="form-control" onKeyUp="suggest2(this.value);" name="nama"  onBlur="fill2();" id="nama" required>
										<div class="suggestionsBox col-md-12" id="suggestions" style="display: none;">
											<div class="suggestionList" id="suggestionsList" style="cursor: pointer;">&nbsp;</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<!-- <label for="inputAddress">Kode Surat Pesanan</label>
									<input type="text" class="form-control" name="spku" value="" readonly> -->
									<input type="hidden" class="form-control" id="idsp" name="" value="<?php echo $id[0]; ?>" readonly>
									<label for="inputAddress">Kode Pemanfaat</label>
									<input type="text" class="form-control" id="kodepl" name="kodepl" readonly required>
									<label for="inputAddress">Alamat</label>
									<input type="text" class="form-control" id="alamat" name="Kode_Pelanggan" readonly required>
									<label for="inputAddress">Saldo</label>
									<input type="text" class="form-control" id="saldo" name="saldo" readonly required>
								</div>
								<div class="col-md-12">
									<br>
									<div class="table-responsive">
										<button type="button" name="add" id="add1" class="btn btn-success btn-sm">Tambah Penjualan</button><br><br>
										<table class="table bordered" id="penjualan" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>Nama Barang</th>
													<th>Qty</th>
													<th>Harga</th>
													<th>Total</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tfoot>
												<th colspan="3" align="left" style="text-align: right;">Total</th>
												<th class="total1">0</th>
												<th></th>
											</tfoot>
										</table>
									</div>
								</div>
								<div class="col-md-12">
									<br>
									<div class="table-responsive">
										<button type="button" name="add2" id="add2" class="btn btn-success btn-sm">Tambah Anggaran</button><br><br>
										<table class="table bordered" id="anggaran" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th width="30%">keterangan</th>
													<th>Qty</th>
													<th>Harga</th>
													<th>Total</th>
													<th>Aksi</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td><input style="width: 100%;border: none;background: #fff;" type="text" name="keterangan[]" value="Bahan Baku"></td>
													<td><input class="qty2" name="qty2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="price2" name="harga2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="amount2" name="total[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><button type="button" name="remove" id="" class="btn btn-danger btn-sm btn_remove">hapus</button></td></td>
												</tr>
												<tr>
													<td><input name="keterangan[]" style="width: 100%;border: none;background: #fff;" type="text" value="Tenaga Kerja"></td>
													<td><input class="qty2" name="qty2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="price2" name="harga2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="amount2" name="total[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><button type="button" name="remove" id="" class="btn btn-danger btn-sm btn_remove">hapus</button></td></td>
												</tr>
												<tr>
													<td><input name="keterangan[]" style="width: 100%;border: none;background: #fff;" type="text" value="Overhead"></td>
													<td><input class="qty2" name="qty2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="price2" name="harga2[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><input class="amount2" name="total[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td>
													<td><button type="button" name="remove" id="" class="btn btn-danger btn-sm btn_remove">hapus</button></td></td>
												</tr>
											</tbody>
											<tfoot>
												<th colspan="3" align="left" style="text-align: right;">Total</th>
												<th class="total2">0</th>
												<th></th>
											</tfoot>
											<?php
											?>
										</table>
									</div>
								</div>
							</div>
							<h4 class="text-right" >margin : <input type="number" id="margin" value="0" style="border: none;width: auto;" name="margin" readonly></h4>
							<center><button id="submit" name="submit" type="submit" class="col-md-3 btn btn-primary">Simpan</button></center>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<script>
		var c = 0;
		var i=0;
		var c2 = 0;
		var i2=0;
		$('#add1').click(function(){
			i++;
			$('#penjualan').append('<tr id="row'+i+'"><td align="center"><input style="width: 100%;border: none;" type="text" name="nama_barang[]"></td><td><input oninput="total1()" class="qty1" type="number" value="0" style="width: 100%;border: none;"  name="qty[]"></td><td><input oninput="total1()" class="price1" value="0" style="width: 100%;border: none;" type="number" name="harga[]"></td><td><input style="width: 100%;border: none;" name="" class="amount1" value="0" style="width: 100%;border: none;" type="number" id="qty'+i+'" name="" onchange="sum'+i+'();"></td><td align="center"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
			c=i;
		});
		$('#add2').click(function(){
			i2++;
			$('#anggaran').append('<tr id="row'+i2+'"><td align="center"><input style="width: 100%;border: none;" type="text" name="keterangan[]"></td><td><input oninput="total2()" class="qty2" type="number" value="0" style="width: 100%;border: none;" name="qty2[]"></td><td><input oninput="total2()" class="price2" value="0" style="width: 100%;border: none;" type="number" name="harga2[]" onchange="total2()"></td><td><input class="amount2" name="total[]" value="0" style="width: 100%;border: none;background: #fff;" type="number"></td><td align="center"><button type="button" name="remove" id="'+i2+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
			c2=i2;
		});

		$(document).on('click', '.btn_remove', function(){
			var button_id = $(this).attr("id");
			$('#row'+button_id+'').remove();
		});
		function suggest2(inputString){
			if(inputString.length == 0) {
				$('#suggestions').fadeOut();
			} else {
				$('#country').addClass('load');
				$.post("autosuggest.php", {pelanggan: ""+inputString+""}, function(data){
					if(data.length >0) {
						$('#suggestions').fadeIn();
						$('#suggestionsList').html(data);
						$('#country').removeClass('load');
					}
				});
			}
		}

		function pelanggan(nama, saldo, alamat, kodepl) {
			$('#nama').val(nama);
			$('#kodepl').val(kodepl);
			$('#saldo').val(saldo);
			$('#alamat').val(alamat);
			setTimeout("$('#suggestions').fadeOut();", 100);
		}
	</script>
	<script>
		$(document).ready(function(){
			total1();
			total2();
			$('.qty1').on('input', function() {
				total1();
			});
			$('.price1').on('input', function() {
				total1();
			});
			$('.amount1').on('input', function() {
				total1();
			}); 
			$('.qty2').on('input', function() {
				total2();
			});
			$('.price2').on('input', function() {
				total2();
			});
			$('.amount2').on('input', function() {
				total2();
			});               
		});
		function total1()
		{
			var sum1 = 0;
			$('#penjualan > tbody  > tr').each(function() {
				var qty = $(this).find('.qty1').val();
				var price = $(this).find('.price1').val();
				var amount1 = (qty*price);
				sum1+=amount1;
				$(this).find('.amount1').val(amount1);
			});
			$('.total1').text(sum1);
			margin();
			// return sum1;
		}
		function total2()
		{
			var sum2 = 0;
			$('#anggaran > tbody  > tr').each(function() {
				var qty = $(this).find('.qty2').val();
				var price = $(this).find('.price2').val();
				var amount2 = (qty*price);
				sum2+=amount2;
				$(this).find('.amount2').val(amount2);
			});
			$('.total2').text(sum2);
			margin();
			// return sum2;
			
		}
		function margin() {
			var total1 = $(".total1").text();
			var total2 = $(".total2").text();
			var margin = parseInt(total1)-parseInt(total2);
			// if (margin != 0) { $('#submit').prop('disabled', true); }else {
			// 	$('#submit').prop('disabled', false);
			// }
			$('#margin').val(margin);
		}
	</script>
