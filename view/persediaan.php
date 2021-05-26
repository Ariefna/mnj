<?php
if (isset($_POST['persediaannew'])) {
	$dch = "INSERT INTO `persediaan` (`id_persediaan`, `no_pol`, `tgl_berangkat`, `tgl_pulang`) VALUES (NULL, '".$_POST['no_pol']."', '".$_POST['tgl_berangkat']."','".$_POST['tgl_pulang']."')";
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
if (isset($_POST['persediaanedit'])) {
		$dch = "UPDATE `persediaan` SET `no_pol`='".$_POST['no_pol']."',`tgl_berangkat`='".$_POST['tgl_berangkat']."',`tgl_pulang`='".$_POST['tgl_berangkat']."' WHERE `id_persediaan`='".$_POST['id']."'";
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
if (isset($_POST['persediaandelete'])) {
	$dch = "DELETE FROM `persediaan` WHERE `id_persediaan`='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Persediaan</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Persediaan</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Persediaan</h6>
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama Kendaraan</th>
						<th>Tanggal Berangkat</th>
						<th>Tanggel Pulang</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama Kendaraan</th>
						<th>Tanggal Berangkat</th>
						<th>Tanggel Pulang</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php
					$query = mysqli_query($conn, "select * from persediaan a join kendaraan b on a.id_kendaraan = b.id_kendaraan");
					$no = 1;
					while ($row = mysqli_fetch_array($query)) {
						echo '<tr>
						<td style="text-align: center;">'.$no.'</td>
						<td>'.$row['nama_kendaraan'].'</td>
						<td>'.$row['tgl_berangkat'].'</td>
						<td>'.$row['tgl_pulang'].'</td>
						<td  style="text-align: center;">
						<form action="" method="POST"><a href="" id="'.$row[0].'" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data"><i class="fas fa-edit"></i></a>
						</a>
						<input id="" hidden type="text" class="" value="'.$row[0].'" name="id" placeholder="" required="required">
						 <button type="button" name="persediaandelete"data-target="#delete'.$row[0].'"  data-toggle="modal" style="padding: 0;border: none;background: none;"><i class="Danger fa fa-trash"></i></button></form></td>
						</tr>
						<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form action="" method="POST">
										<div class="modal-header">
											<h5 class="modal-title">Detail Persediaan</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<h6 class="font-weight-bold text-primary">Detail Persediaan</h6>
											<div class="form-group">
												<label>Nama</label>
												<input id="" type="text" hidden class="form-control" value="'.$row[0].'" name="id" placeholder="" required="required">
												<input id="" type="text" class="form-control" placeholder="" value="'.$row['no_pol'].'" name="no_pol" required="required">
											</div>
											<div class="form-group">
												<label>Tanggal Berangkat</label>
												<input id="" type="date" class="form-control" name="tgl_berangkat" value="'.$row['tgl_berangkat'].'" required="required">
											</div>
											<div class="form-group">
												<label>Tanggal Pulang</label>
												<input id="" type="date" class="form-control" name="tgl_pulang" value="'.$row['tgl_pulang'].'" required="required">
											</div>
										</div>
										<div class="modal-footer">
											<button id="" name="persediaanedit" type="submit" class="btn btn-primary">Simpan</button>
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
											<button id="" name="persediaandelete" type="submit" class="btn btn-primary">Delete</button>
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
					<h5 class="modal-title">Create Persediaan</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>No Pol</label>
						<input id="" type="text" class="form-control" placeholder="" name="no_pol" required="required">
					</div>
					<div class="form-group">
						<label>Tanggal Berangkat</label>
						<input id="" type="date" class="form-control" name="tgl_berangkat" required="required">
					</div>
					<div class="form-group">
						<label>Tanggal Pulang</label>
						<input id="" type="date" class="form-control" name="tgl_pulang" placeholder="" required="required">
					</div>
				</div>
				<div class="modal-footer">
					<button id="" name="persediaannew" type="submit" class="btn btn-primary">Simpan</button>
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
