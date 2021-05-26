<?php
if (isset($_POST['usernew'])) {
	$dch = "INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `status`) VALUES (NULL, '".$_POST['nama']."', '".$_POST['username']."', '".md5($_POST['password'])."', '".$_POST['takses']."')";
	$query = mysqli_query($conn, $dch);
	// echo $dch;
	if($query){
		$jenis_alert = "success";
		$alert = "Sukses Insert Data";
	}else{
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
	}
	echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
if (isset($_POST['useredit'])) {
	if ($_POST['password']=="") {
		$dch = "UPDATE `tabel_admin` SET `nama`='".$_POST['nama']."',`username`='".$_POST['username']."',`status`='".$_POST['takses']."' WHERE `id_admin`='".$_POST['id']."'";
	} else {
		$dch = "UPDATE `tabel_admin` SET `nama`='".$_POST['nama']."',`username`='".$_POST['username']."',`password`='".md5($_POST['password'])."',`status`='".$_POST['takses']."' WHERE `id_admin`='".$_POST['id']."'";
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
	$dch = "DELETE FROM `tabel_admin` WHERE `id_admin`='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Karyawan</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Karyawan</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Karyawan</h6>
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Username</th>
						<th>Akses</th>
						<th>Last Visit Date</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Username</th>
						<th>Akses</th>
						<th>Last Visit Date</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php
					$query = mysqli_query($conn, "select * from tabel_admin");
					$no = 1;
					while ($row = mysqli_fetch_array($query)) {
						if ($row['status']==1) {
							$status = "akses Full";
							$slct1 = "selected";
							$slct2 = "";
							$slct3 = "";
							$slct4 = "";
							$slct5 = "";
							$slct6 = "";
						} elseif ($row['status']==2) {
							$status = "akses Full - Tanpa Master";
							$slct1 = "";
							$slct2 = "selected";
							$slct3 = "";
							$slct4 = "";
							$slct5 = "";
							$slct6 = "";
						} elseif ($row['status']==3) {
							$status = "akses Purchase Order";
							$slct1 = "";
							$slct2 = "";
							$slct3 = "selected";
							$slct4 = "";
							$slct5 = "";
							$slct6 = "";
						} elseif ($row['status']==4) {
							$status = "akses Sales Order";
							$slct1 = "";
							$slct2 = "";
							$slct3 = "";
							$slct4 = "selected";
							$slct5 = "";
							$slct6 = "";
						} elseif ($row['status']==5) {
							$status = "akses Delivery Order";
							$slct1 = "";
							$slct2 = "";
							$slct3 = "";
							$slct4 = "";
							$slct5 = "selected";
							$slct6 = "";
						} elseif ($row['status']==6) {
							$status = "akses Purchase Order, Sales Order hingga Delivery Order";
							$slct1 = "";
							$slct2 = "";
							$slct3 = "";
							$slct4 = "";
							$slct5 = "";
							$slct6 = "selected";
						}
						echo '<tr>
						<td style="text-align: center;">'.$no.'</td>
						<td>'.$row['nama'].'</td>
						<td>'.$row['username'].'</td>
						<td>'.$status.'</td>
						<td style="text-align: center;">'.$row['tanggal'].'</td>
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
											<h5 class="modal-title">Detail Karyawan</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h6 class="font-weight-bold text-primary">Detail Karyawan</h6>
											<div class="form-group">
												<label>Nama</label>
												<input id="" type="text" hidden class="form-control" value="'.$row[0].'" name="id" placeholder="" required="required">
												<input id="" type="text" class="form-control" placeholder="" value="'.$row['nama'].'" name="nama" required="required">
											</div>
											<div class="form-group">
												<label>Username</label>
												<input id="" type="text" class="form-control" name="username" value="'.$row['username'].'" required="required">
											</div>
											<div class="form-group">
												<label>New Password</label>
												<input id="" type="Password" class="form-control" name="password" value="" placeholder="">
											</div>
											<div class="form-group">
												<label>Akses</label>
												<select name="takses" id="akses" class="form-control" required="required">
													<option value="">- Pilih -</option>
													<option value="1" '.$slct1.'>akses Full</option>
													<option value="2" '.$slct2.'>akses Full - Tanpa Master</option>
													<option value="3" '.$slct3.'>akses Purchase Order</option>
													<option value="4" '.$slct4.'>akses Sales Order</option>
													<option value="5" '.$slct5.'>akses Delivery Order</option>
													<option value="6" '.$slct6.'>akses Purchase Order, Sales Order hingga Delivery Order</option>
												</select>
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
					<h5 class="modal-title">Create Karyawan</h5>
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
					<div class="form-group">
						<label>Akses</label>
						<select name="takses" id="akses" class="form-control" required="required">
							<option value="">- Pilih -</option>
							<option value="1">akses Full</option>
							<option value="2">akses Full - Tanpa Master</option>
							<option value="3">akses Purchase Order</option>
							<option value="4">akses Sales Order</option>
							<option value="5">akses Delivery Order</option>
							<option value="6">akses Purchase Order, Sales Order hingga Delivery Order</option>
						</select>
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
<script>
	$(document).ready(function(){
		$(document).on('click', '.edit_data', function(){
			var id_admin = $(this).attr("id");
			$.ajax({
				url: "ubah.php",
				method:"POST",
				data:{admin:id_admin},
				dataType:"json",
				success:function(data){
					$('#id').val(data.id_admin);
					$('#Name2').val(data.nama);
					$('#Username2').val(data.username);
					$('#Date').val(data.tanggal);
					$('#passhid').val(data.password);
					$('#akses').val(data.status);
				}
			})
		})
	})
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#submit2').click(function(){
			$('#exampleModal2').modal('hide');
			var Name = $('#Name').val();
			var Username = $('#Username').val();
			var Password = $('#Password').val();
			var akses = $('#takses').val();
			$.ajax({
				url: 'ajax/ajax.php?userset',
				type: 'post',
				data: { insert:"", nama:Name, username:Username, password:Password, akses:akses },
				success:function(response){
					var obj = jQuery.parseJSON(response);
					alertku(obj.jenis_alert, obj.alert);
				}
			});
		});
		$('#submit').click(function(){
			$('#exampleModal').modal('hide');
			var Name = $('#Name2').val();
			var id = $('#id').val();
			var Username = $('#Username2').val();
			var Password = $('#newpass').val();
			var hiddPassword = $('#passhid').val();
			var oldPassword = $('#oldpassword').val();
			var akses = $('#akses').val();
			var akses = $('#akses').val();
			$.ajax({
				url: 'ajax/ajax.php?userset',
				type: 'post',
				data: { ubah:"", id:id, nama:Name, username:Username, Password:Password, hiddPassword:hiddPassword, oldPassword:oldPassword, akses:akses },
				success:function(response){
					var obj = jQuery.parseJSON(response);
					alertku(obj.jenis_alert, obj.alert);
				}
			});
		});
	});
</script>
