<?php
if (isset($_POST['submit'])) {
	date_default_timezone_set("Asia/Jakarta");
	$tanggal = date("Y-m-d");
	$dch = "INSERT INTO `kendaraan`(`kode_kendaraan`, `indeks`, `nama_kendaraan`, `plat_nomor`) VALUES ('".$_POST['kodeken']."','".$_POST['indeks']."','".$_POST['nama_kendaraan']."','".$_POST['plat_nomor']."')";
	// $dch = "INSERT INTO `produk`(`kode_produk`, `indeks`, `id_satuan`, `nama_produk`, `status`) VALUES ('".$_POST['kodeken']."','".$_POST['indeks']."','0','".$_POST['nama_kendaraan']."', '2')";
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
	$dch = "UPDATE `kendaraan` SET `nama_kendaraan`='".$_POST['nama_kendaraan']."', `plat_nomor`='".$_POST['plat_nomor']."' WHERE `id_kendaraan`='".$_POST['id']."'";
	// $dch = "UPDATE `produk` SET `nama_produk`='".$_POST['nama_kendaraan']."' WHERE `id_produk`='".$_POST['id']."'";
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
if (isset($_POST['delete'])) {
	$dch = "DELETE FROM `kendaraan` WHERE id_kendaraan='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Kendaraan</h1>
		<a href="#" data-target="#tambahkendaraan"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Kendaraan</a>
	</div>

	<div class="modal fade" id="tambahkendaraan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="" method="POST">
					<div class="modal-header">
						<h5 class="modal-title">Input Detail Kendaraan</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6 class="font-weight-bold text-primary">Detail Kendaraan</h6>
						<div class="form-group">
							<label for="inputAddress">Kode Kendaraan</label>
							<input type="text" required class="form-control" value="<?php
							$sql = 'SELECT max(indeks) as jml FROM kendaraan';
							$query = mysqli_query($conn, $sql);
							$row = mysqli_fetch_assoc($query);
							$hitung = $row['jml'];
							$hitung = $hitung+1;
							if ($hitung>=1&&$hitung<=9) {
								echo "KDR000".$hitung;
								} else if ($hitung>=10&&$hitung<=99) {
									echo "KDR00".$hitung;
									} else if ($hitung>=100&&$hitung<=999) {
										echo "KDR0".$hitung;
										} else if ($hitung>=1000&&$hitung<=9999) {
											echo "KDR".$hitung;
										}
										?>" name="kodeken" readonly required>
									</div>
									<div class="form-group">
										<label for="inputAddress">Nama Kendaraan</label>
										<input type="text" class="form-control" name="nama_kendaraan" autocomplete="off" required>
										<input type="number" hidden class="form-control" name="indeks" value="<?php echo $hitung; ?>" required>
									</div>
									<div class="form-group">
										<label for="inputAddress">Plat Nomor Kendaraan</label>
										<input type="text" class="form-control" name="plat_nomor" autocomplete="off" required>
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
						<h6 class="font-weight-bold text-primary">List Data Kendaraan</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
								<thead>
									<tr>
										<th>No</th>
										<th>Kode Kendaraan</th>
										<th>Nama Kendaraan</th>
										<th>Plat Nomor Kendaraan</th>
										<th>Aksi</th>
									</tr>
								</thead>
								<tbody>
									<?php
									$i=1;
									$sql = 'SELECT * FROM kendaraan';
									$result = mysqli_query($conn, $sql);
									while ($row = mysqli_fetch_array($result)) {
										echo '<tr>
										<td align="center">'.$i++.'</td>
										<td align="center">'.$row['kode_kendaraan'].'</td>
										<td>'.$row['nama_kendaraan'].'</td>
										<td align="center">'.$row['plat_nomor'].'</td>
										<td  style="text-align: center;">
										<a href="" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data">
										<i class="fas fa-edit"></i></a>
										<button type="button" name="userdelete"data-target="#delete'.$row[0].'"  data-toggle="modal" style="padding: 0;border: none;background: none;"><i class="Danger fa fa-trash"></i></button></td>
										</tr>
										<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
										<div class="modal-dialog" role="document">
										<div class="modal-content">
										<form action="" method="POST">
										<div class="modal-header">
										<h5 class="modal-title">Edit Detail Kendaraan</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
										</button>
										</div>
										<div class="modal-body">
										<h6 class="font-weight-bold text-primary">Detail Kendaraan</h6>
										<div class="form-group">
										<label for="inputAddress">Kode Kendaraan</label>
										<input type="hidden" class="form-control" value="'.$row['id_kendaraan'].'" name="id" required>
										<input type="text" class="form-control" value="'.$row['kode_kendaraan'].'" name="nama_kendaraan" required readonly>
										</div>
										<div class="form-group">
										<label for="inputAddress">Nama Kendaraan</label>
										<input type="text" class="form-control" value="'.$row['nama_kendaraan'].'" name="nama_kendaraan" required>
										</div>
										<div class="form-group">
										<label for="inputAddress">Plat Nomor Kendaraan</label>
										<input type="text" class="form-control" value="'.$row['plat_nomor'].'" name="plat_nomor" required>
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
										?>
										<div class="modal fade" id="delete<?php echo $row[0]; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<form action="" method="POST">
														<div class="modal-header">
															<h5 class="modal-title">Perhatian!</h5>
															<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
															<input id="" hidden type="text" class="" value="<?php echo $row[0]; ?>" name="id" placeholder="" required="required">
															<p>Apakah Anda yakin untuk menghapus data?</p>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
															<button id="" name="delete" type="submit" class="btn btn-primary">Delete</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<?php
									}
									?>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
