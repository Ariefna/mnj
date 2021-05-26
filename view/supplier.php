<?php
if (isset($_POST['submit'])) {
	$dch = "INSERT INTO `supplier` (`kodesup`, `Nama`, `Kota`, `Alamat`, `Telepon`, `NPWP`) VALUES ('".$_POST['kodepl']."', '".$_POST['Nama']."', '".$_POST['Kota']."', '".$_POST['Alamat']."', '".$_POST['Telepon']."', '".$_POST['NPWP']."')";
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
if (isset($_POST['edit'])) {
	$dch = "UPDATE `supplier` SET `Nama`='".$_POST['Nama']."',`Kota`='".$_POST['Kota']."',`Alamat`='".$_POST['Alamat']."',`Telepon`='".$_POST['Telepon']."',`NPWP`='".$_POST['NPWP']."' WHERE `kodesup`='".$_POST['kodesup']."'";
	$query = mysqli_query($conn, $dch);
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Edit Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
 ?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Penghasil</h1>
		<a href="#" data-target="#tambahsupplier"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Penghasil</a>
	</div>
	<div class="modal fade" id="tambahsupplier" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="" method="POST">
					<div class="modal-header">
						<h5 class="modal-title">Input Detail Penghasil</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6 class="font-weight-bold text-primary">Penghasil</h6>
						<div class="form-group">
							<label for="inputAddress">Kode Penghasil</label>
							<input type="text" required class="form-control" value="<?php
							$sql = 'SELECT count(*) FROM supplier';
							$query = mysqli_query($conn, $sql);
							$row = mysqli_fetch_assoc($query);
							$hitung = $row['count(*)'];
							$hitung = $hitung+1;
							if ($hitung>=1&&$hitung<=9) {
								echo "SUP000".$hitung;
							} else if ($hitung>=10&&$hitung<=99) {
								echo "SUP00".$hitung;
							} else if ($hitung>=100&&$hitung<=999) {
								echo "SUP0".$hitung;
							} else if ($hitung>=1000&&$hitung<=9999) {
								echo "SUP".$hitung;
							}
							?>" name="kodepl" readonly required>
						</div>
						<div class="form-group">
							<label for="inputAddress">Nama Penghasil</label>
							<input type="text" autocomplete="off" required class="form-control" onblur="generataName()" name="Nama" required>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Alamat</label>
									<input type="text" required class="form-control" name="Alamat" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">Kota/Kabupaten</label>
									<input type="text" required class="form-control" name="Kota" required>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Telepon</label>
									<input type="text" required class="form-control" name="Telepon" required>
								</div>
								<div class="form-group">
									<label for="inputAddress">NPWP</label>
									<input type="text" required class="form-control" name="NPWP" required>
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
				<h6 class="font-weight-bold text-primary">List Data Penghasil</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>Kode Penghasil</th>
								<th>Nama Penghasil</th>
								<th>Alamat</th>
								<th>Kota</th>
								<th>Telp</th>
								<th>NPWP Penghasil</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tbody>
							<?php
							$result = mysqli_query($conn, "select * from supplier");
							while ($row = mysqli_fetch_array($result)) {
								echo '<tr>
								<td align="center">'.$row['kodesup'].'</td>
								<td>'.$row['Nama'].'</td>
								<td>'.$row['Alamat'].'</td>
								<td>'.$row['Kota'].'</td>
								<td align="center">'.$row['Telepon'].'</td>
								<td align="center">'.$row['NPWP'].'</td>
								<td  style="text-align: center;">
								<a href="" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data">
								<i class="fas fa-edit"></i></a></td>
								</tr>
								<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<form action="" method="POST">
												<div class="modal-header">
													<h5 class="modal-title">Edit Detail Penghasil</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<h6 class="font-weight-bold text-primary">Penghasil</h6>
													<div class="form-group">
														<label for="inputAddress">Kode Penghasil</label>
														<input type="text" required class="form-control" value="'.$row['kodesup'].'" name="kodesup" readonly required>
													</div>
													<div class="form-group">
														<label for="inputAddress">Nama Penghasil</label>
														<input type="text" required class="form-control" value="'.$row['Nama'].'" name="Nama" required>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group">
																<label for="inputAddress">Alamat</label>
																<input type="text" required class="form-control" value="'.$row['Alamat'].'" name="Alamat" required>
															</div>
															<div class="form-group">
																<label for="inputAddress">Kota/Kabupaten</label>
																<input type="text" required class="form-control" value="'.$row['Kota'].'" name="Kota" required>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group">
																<label for="inputAddress">Telepon</label>
																<input type="text" required class="form-control" value="'.$row['Telepon'].'" name="Telepon" required>
															</div>
															<div class="form-group">
																<label for="inputAddress">KTP / NPWP</label>
																<input type="text" required class="form-control" value="'.$row['NPWP'].'" name="NPWP" required>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<button name="edit" type="submit" class="btn btn-primary">Simpan</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
												</div>
											</form>
										</div>
									</div>
								</div>
								';
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</div>
