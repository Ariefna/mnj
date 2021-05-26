<?php
if (isset($_POST['usernew'])) {
	$dch = "INSERT INTO `users_android` (`id_user_an`, `kodesup`, `nama_user_an`, `username_an`, `password_an`) VALUES (NULL, '".$_POST['kodesup']."', '".$_POST['nama']."', '".$_POST['username']."', '".md5($_POST['password'])."')";
	$query = mysqli_query($conn, $dch);
	// echo $dch;
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		echo mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
if (isset($_POST['useredit'])) {
	if ($_POST['password']=="") {
		$dch = "UPDATE `users_android` SET `kodesup`='".$_POST['kodesup']."',`nama_user_an`='".$_POST['nama']."',`username_an`='".$_POST['username']."' WHERE `id_user_an`='".$_POST['id']."'";
	} else {
		$dch = "UPDATE `users_android` SET `kodesup`='".$_POST['kodesup']."', `nama_user_an`='".$_POST['nama']."',`username_an`='".$_POST['username']."',`password_an`='".md5($_POST['password'])."' WHERE `id_user_an`='".$_POST['id']."'";
	}
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
if (isset($_POST['userdelete'])) {
	$dch = "DELETE FROM `users_android` WHERE `id_user_an`='".$_POST['id']."'";
	$query = mysqli_query($conn, $dch);
	// echo $dch;
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Delete Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
 ?>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master User Android</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah User Android</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data User Android</h6>
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Nama PT</th>
						<th>Username</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Nama PT</th>
						<th>Username</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php
					$query = mysqli_query($conn, "select *,(select Nama from supplier where kodesup=a.kodesup) as nama_supplier from users_android a");
					$no = 1;
					while ($row = mysqli_fetch_array($query)) {
						echo '<tr>
						<td style="text-align: center;">'.$no.'</td>
						<td>'.$row['nama_user_an'].'</td>
						<td>'.$row['nama_supplier'].'</td>
						<td>'.$row['username_an'].'</td>
						<td  style="text-align: center;">
						<form action="" method="POST"><a href="" id="'.$row[0].'" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data"><i class="fas fa-edit"></i></a>
						</a>
						<input id="" hidden type="text" class="" value="'.$row[0].'" name="id" placeholder="" required="required">
						 <button type="button" name="userdelete"data-target="#delete'.$row[0].'"  data-toggle="modal" style="padding: 0;border: none;background: none;"><i class="Danger fa fa-trash"></i></button></form></td>
						</tr>
						<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form action="" method="POST">
										<div class="modal-header">
											<h5 class="modal-title">Detail User Android</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h6 class="font-weight-bold text-primary">Detail User Android</h6>
											<div class="form-group">
												<label>Nama</label>
												<input id="" type="text" hidden class="form-control" value="'.$row[0].'" name="id" placeholder="" required="required">
												<input id="" type="text" class="form-control" placeholder="" value="'.$row['nama_user_an'].'" name="nama" required="required">
											</div>
											<div class="form-group">
												<label>Nama PT</label>
												<select class="form-control" name="kodesup">
													<option value="">Pilih Supplier</option>';?>
													<?php
													$querys = mysqli_query($conn, "select * from supplier");
													while ($rows = mysqli_fetch_array($querys)) {
														if ($rows['kodesup']==$row['kodesup']) {
															echo '<option value="'.$rows['kodesup'].'" selected>'.$rows['Nama'].'</option>';
														} else {
															echo '<option value="'.$rows['kodesup'].'">'.$rows['Nama'].'</option>';
														}
													}
													 ?>
													 <?php echo '
												</select>
											</div>
											<div class="form-group">
												<label>Username</label>
												<input id="" type="text" class="form-control" name="username" value="'.$row['username_an'].'" required="required">
											</div>
											<div class="form-group">
												<label>New Password</label>
												<input id="" type="Password" class="form-control" name="password" value="" placeholder="">
											</div>
										</div>
										<div class="modal-footer">
											<button id="" name="useredit" type="submit" class="btn btn-primary">Simpan</button>
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
											<button id="" name="userdelete" type="submit" class="btn btn-primary">Delete</button>
										</div>
									</form>
								</div>
							</div>
						</div>
						<?php
						$no++;
					}
					?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<!-- start modal new user -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
				<div class="modal-header">
					<h5 class="modal-title">Create User Android</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label>Nama</label>
						<input id="" type="text" class="form-control" placeholder="" name="nama" required="required">
					</div>
					<div class="form-group">
						<label>Nama PT</label>
						<select class="form-control" name="kodesup">
							<option value="">Pilih Supplier</option>
							<?php
							$query = mysqli_query($conn, "select * from supplier");
							while ($row = mysqli_fetch_array($query)) {
								echo '<option value="'.$row['kodesup'].'">'.$row['Nama'].'</option>';
							}
							 ?>
						</select>
					</div>
					<div class="form-group">
						<label>Username</label>
						<input id="" type="text" class="form-control" name="username" required="required">
					</div>
					<div class="form-group">
						<label>Password</label>
						<input id="" type="Password" class="form-control" name="password" placeholder="" required="required">
					</div>
					<div class="form-group">
						<label>Confirm Password</label>
						<input type="Password" class="form-control" placeholder="" required="required">
					</div>
				</div>
				<div class="modal-footer">
					<button id="" name="usernew" type="submit" class="btn btn-primary">Simpan</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
				</div>
			</form>
		</div>
	</div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
