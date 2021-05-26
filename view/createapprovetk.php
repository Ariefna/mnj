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
if (isset($_GET['id_tk'])) {
  $qury = "SELECT * FROM `tugas_kerja` where id_tk = '".$_GET['id_tk']."'";
  $qc = mysqli_query($conn, $qury);
  $hasil = mysqli_fetch_array($qc);
  $kode_proyek = $hasil['kode_proyek'];
  $kodepl = $hasil['kodepl'];
  $sales = $hasil['sales'];
  $tempo = $hasil['tempo'];
  $tanggal = $hasil['tanggal'];
  $status = $hasil['status'];

	$qura = "SELECT * FROM `pelanggan` where kodepl = '$kodepl'";
  $qa = mysqli_query($conn, $qura);
  $hasila = mysqli_fetch_array($qa);
  $nama = $hasila['Nama'];
  $saldo = $hasila['saldo'];
  $alamat = $hasila['Alamat'].", ".$hasila['Kota'];
  // $id_sj = $_GET['retur'];
}
if (isset($_POST['submit'])) {
	$query = "UPDATE `tugas_kerja` SET `status`= 1 WHERE `id_tk`='".$_GET['id_tk']."'";
	// echo $query;
  mysqli_query($conn, $query);
	echo '<script>window.location="?page=approvetk";</script>';
}
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Tugas Kerja</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to approve?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Form Tugas Kerja</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Tanggal</label>
								<input type="date" class="form-control" name="tanggal" value="<?php echo $tanggal; ?>" onchange="myFunction(this.value)" readonly required>
								<label for="inputAddress">Sales</label>
								<input type="text" class="form-control" id="Kode_Pelanggan" value="<?php echo $sales; ?>" name="sales" readonly required>
								<label for="inputAddress">Jatuh Tempo (Hari)</label>
								<input class="form-control" name="tempo" type="number" value="<?php echo $tempo; ?>" required readonly></input>
								<label for="inputAddress">Nama Pemanfaat</label>
								<div class="form-row">
									<div class="form-group col-md-12">
										<input autocomplete="off" type="text" class="form-control" onKeyUp="suggest2(this.value);" name="nama" value="<?php echo $nama; ?>" onBlur="fill2();" id="nama" readonly required>
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
									<input type="text" class="form-control" id="kodepl" name="kodepl" value="<?php echo $kodepl; ?>" readonly required>
									<label for="inputAddress">Alamat</label>
									<input type="text" class="form-control" id="alamat" name="Kode_Pelanggan" value="<?php echo $alamat; ?>" readonly required>
									<label for="inputAddress">Saldo</label>
									<input type="text" class="form-control" id="saldo" name="saldo" value="<?php echo $saldo; ?>" readonly required>
								</div>
								<div class="col-md-12">
									<br>
									<div class="table-responsive">
										<table class="table bordered" id="penjualan" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>Nama Barang</th>
													<th>Qty</th>
													<th>Harga</th>
													<th>Total</th>
												</tr>
											</thead>
											<tbody>
												<?php
												$totalan=0;
												$sql = "SELECT * FROM tk_penjualan where id_tk='".$_GET['id_tk']."'";
												$result = mysqli_query($conn, $sql);
												while ($row = mysqli_fetch_array($result)) {
													$total=$row['qty']*$row['harga'];
													$totalan=$total+$totalan;
													echo "<tr>
													<td>$row[nama_barang]</td>
													<td align='center'>$row[qty]</td>
													<td align='center'>$row[harga]</td>
													<td align='center'>$total</td>
													</tr>";
												}
												 ?>
											</tbody>
											<tfoot>
												<th colspan="3" align="left" style="text-align: right;">Total</th>
												<th class=""><?php echo $totalan; ?></th>
												<th></th>
											</tfoot>
										</table>
									</div>
								</div>
								<div class="col-md-12">
									<br>
									<div class="table-responsive">
										<table class="table bordered" id="anggaran" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th width="30%">keterangan</th>
													<th>Qty</th>
													<th>Harga</th>
													<th>Total</th>
												</tr>
											</thead>
											<tbody>
												<?php
												$totalin=0;
												$sql = "SELECT * FROM anggaran_tk where id_tk='".$_GET['id_tk']."'";
												$result = mysqli_query($conn, $sql);
												while ($row = mysqli_fetch_array($result)) {
													$totalin=$totalin+$row['total'];
													// if ($row['keterangan']=='Bahan Baku') {
													// 	$qtybb=$row['qty'];
													// 	$hargabb=$row['harga'];
													// } elseif ($row['keterangan']=='Tenaga Kerja') {
													// 	$qtytk=$row['qty'];
													// 	$hargatk=$row['harga'];
													// } elseif ($row['keterangan']=='Overhead') {
													// 	$qtyo=$row['qty'];
													// 	$hargao=$row['harga'];
													// }
													echo '<tr>
													 <td><input style="width: 100%;border: none;background: #fff;" type="text" name="keterangan[]" value="'.$row['keterangan'].'" readonly></td>
													 <td><input class="qty2" name="qty2[]" style="width: 100%;border: none;background: #fff;text-align: center;" type="number" value="'.$row['qty'].'" readonly></td>
													 <td><input class="price2" name="harga2[]" style="width: 100%;border: none;background: #fff;text-align: center;" type="number" value="'.$row['harga'].'" readonly></td>
													 <td><input class="amount2" name="total[]" value="'.$row['total'].'" style="width: 100%;border: none;background: #fff;text-align: center;" type="number" readonly></td>

												 </tr>';
												}
												 ?>

												 <!-- <tr>
													 <td><input name="keterangan[]" style="width: 100%;border: none;background: #fff;" type="text" value="Tenaga Kerja"></td>
													 <td><input class="qty2" name="qty2[]" style="width: 100%;border: none;background: #fff;" type="number" value="<?php echo $qtytk; ?>" readonly></td>
													 <td><input class="price2" name="harga2[]" style="width: 100%;border: none;background: #fff;" type="number" value="<?php echo $hargatk; ?>" readonly></td>
													 <td><input class="amount2" name="total[]" style="width: 100%;border: none;background: #fff;" type="number" readonly></td>
													 <td><button type="button" name="remove" id="" class="btn btn-danger btn-sm btn_remove">hapus</button></td></td>
												 </tr>
												 <tr>
													 <td><input name="keterangan[]" style="width: 100%;border: none;background: #fff;" type="text" value="Overhead"></td>
													 <td><input class="qty2" name="qty2[]" style="width: 100%;border: none;background: #fff;" type="number" value="<?php echo $qtyo; ?>" readonly></td>
													 <td><input class="price2" name="harga2[]" style="width: 100%;border: none;background: #fff;" type="number" value="<?php echo $hargao; ?>" readonly></td>
													 <td><input class="amount2" name="total[]" style="width: 100%;border: none;background: #fff;" type="number" readonly></td>
													 <td><button type="button" name="remove"  class="btn btn-danger btn-sm btn_remove">hapus</button></td></td>
												 </tr> -->
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
							<h4 class="text-right" >margin : <span id=""><?php echo $totalan-$totalin; ?></span></h4>
							<?php if ($status==0) {
								echo '<center><button id="" name="submit" type="submit" class="col-md-3 btn btn-primary">Approve</button></center>';
							} ?>

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
			$('#penjualan').append('<tr id="row'+i+'"><td align="center"><input style="width: 100%;border: none;" type="text" name="nama_barang[]"></td><td><input onchange="total1()" class="qty1" type="number" value="0" style="width: 100%;border: none;"  name="qty[]"></td><td><input onchange="total1()" class="price1" value="0" style="width: 100%;border: none;" type="number" name="harga[]"></td><td><input style="width: 100%;border: none;" name="" class="amount1" value="0" style="width: 100%;border: none;" type="number" id="qty'+i+'" name="" onchange="sum'+i+'();"></td><td align="center"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
			c=i;
		});
		$('#add2').click(function(){
			i2++;
			$('#anggaran').append('<tr id="row'+i2+'"><td align="center"><input style="width: 100%;border: none;" type="text" name="keterangan[]"></td><td><input type="number" style="width: 100%;border: none;" class="qty2" name="qty2[]"></td><td><input class="price2" style="width: 100%;border: none;" type="number" name="harga2[]"></td><td><input class=" text-center qty" class="amount2" name="total[]" value="0" style="width: 100%;border: none;" type="number" id="qty'+i2+'" name="" onchange="sum'+i2+'();"></td><td align="center"><button type="button" name="remove" id="'+i2+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
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
			$('.qty1').change(function() {
				total1();
			});
			$('.price1').change(function() {
				total1();
			});
			$('.amount1').change(function() {
				total1();
			});
			$('.qty2').change(function() {
				total2();
			});
			$('.price2').change(function() {
				total2();
			});
			$('.amount2').change(function() {
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

		}
		function margin() {
			var total1 = $(".total1").text();
			var total2 = $(".total2").text();
			var margin = parseInt(total1)-parseInt(total2);
			if (margin != 0) { $('#submit').prop('disabled', true); }else {
				$('#submit').prop('disabled', false);
			}
			$('#margin').text(margin);
		}
	</script>
