<?php
if (isset($_POST['field'])) {
	$field = $_POST['field'];
	$value = $_POST['value'];
	$editid = $_POST['id'];
	$query = "update table_buku set $field='$value' WHERE id_buku='".$editid."'";
	if (mysqli_query($conn,$query)) {
		echo("berhasil");
	}else{
		echo mysqli_error($conn);
	}
}
if (isset($_POST['submit'])) {
	$dch = "INSERT INTO `table_buku` (`Kls`, `Kode_Buku`, `Judul_Buku`, `stok`, `harga`, `harga2`, `harga3`, `harga4`, `harga5`, `jml_hal`, `Semester`, `Katern`, `oplah`, `kg`, `Ukuran`, `Kode_Produk`) VALUES ('".$_POST['kelas']."', '".$_POST['kodebuku']."', '".$_POST['judulbuku']."', '".$_POST['stok']."', '".$_POST['zona1']."', '".$_POST['zona2']."', '".$_POST['zona3']."', '".$_POST['zona4']."', '".$_POST['zona5']."', '".$_POST['jumlahhalaman']."', '".$_POST['semester']."', '".$_POST['katern']."', '".$_POST['oplah']."', '".$_POST['berat']."', '".$_POST['ukuran']."', '".$_POST['kodeproduk']."')";
	$query = mysqli_query($conn, $dch);
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
}

?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Buku</h1>
		<a href="#" data-target="#tambahbuku"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Buku</a>
	</div>

	<div class="modal fade" id="tambahbuku" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="" method="POST">
					<div class="modal-header">
						<h5 class="modal-title">Input Detail Buku</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6 class="font-weight-bold text-primary">Detail Buku</h6>

						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Kelas</label>
									<input type="number" class="form-control" name="kelas" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Kode Buku</label>
									<input type="text" class="form-control" name="kodebuku" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Judul Buku</label>
									<input type="text" class="form-control" name="judulbuku" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Stok</label>
									<input type="number" class="form-control" name="stok" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Jumlah Halaman</label>
									<input type="number" class="form-control" name="jumlahhalaman" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Semester</label>
									<input type="text" class="form-control" name="semester" required>
								</div>
							</div>
							<div class="col-md-6">

								<div class="form-group">
									<label for="inputAddress">Katern</label>
									<input type="text" class="form-control" name="katern" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Oplah</label>
									<input type="number" class="form-control" name="oplah" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Berat (Kg)</label>
									<input type="number" class="form-control" name="berat" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Ukuran</label>
									<input type="text" class="form-control" name="ukuran" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Kode Produk</label>
									<select class="form-control" name="kodeproduk">
										<option value="SISWA">SISWA</option>
										<option value="GURU">GURU</option>
									</select>
								</div>
							</div>
						</div>
						<h6 class="font-weight-bold text-primary">Detail Harga</h6>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Harga Zona 1</label>
									<input type="number" class="form-control" name="zona1" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Harga Zona 2</label>
									<input type="number" class="form-control" name="zona2" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Harga Zona 3</label>
									<input type="number" class="form-control" name="zona3" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Harga Zona 4</label>
									<input type="number" class="form-control" name="zona4" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Harga Zona 5</label>
									<input type="number" class="form-control" name="zona5" required>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button name="submit" type="submit" class="btn btn-primary">Simpan</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Buku</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>Kelas</th>
							<th>Kode Buku</th>
							<th>Judul Buku</th>
							<th>Stok</th>
							<th>Zona 1</th>
							<th>Zona 2</th>
							<th>Zona 3</th>
							<th>Zona 4</th>
							<th>Zona 5</th>
							<th>Jumlah Halaman</th>
							<th>Semester</th>
							<th>Katern</th>
							<th>Oplah</th>
							<th>Berat (Kg)</th>
							<th>Ukuran</th>
							<th>Kode Produk</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Kelas</th>
							<th>Kode Buku</th>
							<th>Judul Buku</th>
							<th>Stok</th>
							<th>Zona 1</th>
							<th>Zona 2</th>
							<th>Zona 3</th>
							<th>Zona 4</th>
							<th>Zona 5</th>
							<th>Jumlah Halaman</th>
							<th>Semester</th>
							<th>Katern</th>
							<th>Oplah</th>
							<th>Berat (Kg)</th>
							<th>Ukuran</th>
							<th>Kode Produk</th>
							<th>Aksi</th>
						</tr>

					</tfoot>
					<tbody>
						<?php
						$sql = 'SELECT * FROM table_buku';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
							echo "<tr>
							<td align='center'>$row[Kls]</td>
							<td align='center'>$row[Kode_Buku]</td>
							<td>$row[Judul_Buku]</td>
							<td align='center' contenteditable class='edit' id='stok-$row[0]'>$row[stok]</td>
							<td align='center' contenteditable class='edit' id='harga-$row[0]'>$row[harga]</td>
							<td align='center' contenteditable class='edit' id='harga2-$row[0]'>$row[harga2]</td>
							<td align='center' contenteditable class='edit' id='harga3-$row[0]'>$row[harga3]</td>
							<td align='center' contenteditable class='edit' id='harga4-$row[0]'>$row[harga4]</td>
							<td align='center' contenteditable class='edit' id='harga5-$row[0]'>$row[harga5]</td>
							<td align='center'>$row[jml_hal]</td>
							<td align='center'>$row[Semester]</td>
							<td align='center'>$row[Katern]</td>
							<td align='center'>$row[oplah]</td>
							<td align='center'>$row[kg]</td>
							<td align='center'>$row[Ukuran]</td>
							<td>$row[Kode_Produk]</td>
							<td  style='text-align: center;'>
							<a href='' id='$row[0]' data-target='#exampleModal'  data-toggle='modal' class='edit_data'>
							<i class='fas fa-edit'></i></a></td>
							</tr>";
						}
						?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
   // Add Class
   $('.edit').click(function(){
   	$(this).addClass('editMode');
   });
 // Save data
 $(".edit").focusout(function(){
 	$(this).removeClass("editMode");
 	var id = this.id;
 	var split_id = id.split("-");
 	var field_name = split_id[0];
 	var edit_id = split_id[1];
 	var value = $(this).text();
 	$.ajax({
 		url: 'index.php?page=buku',
 		type: 'post',
 		data: { field:field_name, value:value, id:edit_id },
 		success:function(response){
 			alertku('success', 'Berhasil Update Data');
 			

 		}
 	});
 });
</script>