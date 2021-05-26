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

?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Form CN / DN</h1>
	</div>
	<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Input CN / DN</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<label for="inputAddress">Tanggal</label>
								<input type="date" class="form-control" name="tanggal" onchange="myFunction(this.value)" required>
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
								<input type="text" class="form-control" name="spku" value="
								readonly> -->
								<label for="inputAddress">Kode CN / DN</label>
								<input type="text" class="form-control" id="alamat" name="Kode_Pelanggan" readonly required>
								<input type="hidden" class="form-control" id="idsp" name="" value="<?php echo $id[0]; ?>" readonly>
								<label for="inputAddress">Kode Pemanfaat</label>
								<input type="text" class="form-control" id="kodepl" name="kodeplku" readonly required>
							</div>
							<div class="col-md-12">
								<label for="inputAddress">Debet / Kredit Note</label>
                <select class="form-control" name="dkn">
                  <option value="">Debet</option>
                  <option value="">Kredit</option>
                </select>
								<label for="inputAddress">Pilih Invoice</label>
                <select class="form-control" name="invoice">
                  <option value="">001</option>
                  <option value="">002</option>
                </select>
								<label for="inputAddress">Pilih Nominal</label>
								<input class="form-control" name="nominal" type="number" required></input>
							</div>
							<div class="col-md-12">
								<br>
                <center><button name="submit" type="submit" class="col-md-3 btn btn-primary" onclick="window.location.href=?psn=+i;">Simpan</button></center>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<script>
	var c = 0;
	var i=0;
	$('#add').click(function(){
		i++;
		$('#dynamic_field').append('<tr id="row'+i+'"><td align="center"><input class="text-center" style="width: 100%;border: none;background: #fff;" id="Kode_Buku'+i+'" name="scs[]" type="text" readonly><input class="text-center" style="width: 100%;border: none;background: #fff;" id="kode'+i+'" name="id_buku[]" type="hidden" readonly></td><td><input onchange="buku'+i+'(value);" list="browsers" style="width: 100%;border: none;"><datalist id="browsers"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `table_buku`");while ($rdjc = mysqli_fetch_array($rdcjn)) { echo '<option value="'.$rdjc['Judul_Buku'].'">'; } ?></datalist></td><td><input class="text-center" style="width: 100%;border: none;background: #fff;" id="harga'+i+'" type="text" disabled></td><td><input class=" text-center qty" value="0" style="width: 100%;border: none;" type="number" id="qty'+i+'" name="qty[]" onchange="sum'+i+'();"></td><td><input class="text-center tot" style="width: 100%;border: none;background: #fff;" id="total'+i+'" name="total[]" type="text" readonly></td><td align="center"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
		c=i;
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
		function buku<?php echo $i; ?>(value){
			$.ajax({
				type: "POST",
				url: "autosuggest.php?harga=<?php echo $_GET['zona']; ?>",
				data: {
					buku: value
				},
				success: function (data) {
					var json = JSON.parse(data);
					$('#harga<?php echo $i; ?>').val(json.harga);
					$('#kode<?php echo $i; ?>').val(json.id_buku);
					$('#Kode_Buku<?php echo $i; ?>').val(json.Kode_Buku);
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
			$('#totrp').text(sum2);
			disk = $('#disks').val();
			disk = sum2/100*disk;
			$('#disk').text(disk);
			var tot = sum2-disk;
			$('#net').text(tot);
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
</script>
