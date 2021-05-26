<?php
if (isset($_POST['submit'])) {
  date_default_timezone_set("Asia/Jakarta");
  $tanggal = date("Y-m-d");
	$dch = "INSERT INTO `satuan`(`nama_satuan`) VALUES ('".$_POST['satuan']."')";
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
	$dch = "UPDATE `satuan` SET `nama_satuan`='".$_POST['satuan']."' WHERE `id_satuan`='".$_POST['id']."'";
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
if (isset($_POST['edit'])) {
	$dch = "UPDATE `satuan` SET `nama_satuan`='".$_POST['satuan']."' WHERE `id_satuan`='".$_POST['id']."'";
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
	$dch = "DELETE FROM `satuan` WHERE id_satuan='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Satuan</h1>
		<a href="#" data-target="#tambahsatuan"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Satuan</a>
	</div>

	<div class="modal fade" id="tambahsatuan" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="" method="POST">
					<div class="modal-header">
						<h5 class="modal-title">Input Detail Satuan</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6 class="font-weight-bold text-primary">Detail Satuan</h6>
            <div class="form-group">
              <label for="inputAddress">Satuan</label>
              <input type="text" class="form-control" name="satuan" autofocus autocomplete="off" required>
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
			<h6 class="font-weight-bold text-primary">List Data Satuan</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
              <th>No</th>
							<th>Nama Satuan</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
            $i=1;
						$sql = 'SELECT * FROM satuan';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
							echo '<tr>
              <td align="center">'.$i++.'</td>
              <td align="center">'.$row['nama_satuan'].'</td>
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
                        <h5 class="modal-title">Edit Detail Satuan</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
            						<h6 class="font-weight-bold text-primary">Detail Satuan</h6>
                        <div class="form-group">
                          <label for="inputAddress">Nama Produk</label>
                          <input type="hidden" class="form-control" value="'.$row['id_satuan'].'" name="id" required>
                          <input type="text" class="form-control" value="'.$row['nama_satuan'].'" name="satuan" required>
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
