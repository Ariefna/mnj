<?php
if (isset($_POST['submit'])) {
  date_default_timezone_set("Asia/Jakarta");
  $tanggal = date("Y-m-d");
	$dch = "INSERT INTO `produk`(`kode_produk`, `indeks`, `id_satuan`, `nama_produk`, `status`) VALUES ('".$_POST['kodepro']."','".$_POST['indeks']."','".$_POST['satuan']."','".$_POST['nama_produk']."', '1')";
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
	$dch = "UPDATE `produk` SET `id_satuan`='".$_POST['satuan']."', `nama_produk`='".$_POST['nama_produk']."' WHERE `id_produk`='".$_POST['id']."'";
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
	$dch = "DELETE FROM `produk` WHERE id_produk='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Produk</h1>
		<a href="#" data-target="#tambahproduk"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Produk</a>
	</div>

	<div class="modal fade" id="tambahproduk" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
					<div class="modal-header">
						<h5 class="modal-title">Input Detail Produk</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<h6 class="font-weight-bold text-primary">Detail Produk</h6>
            <div class="form-group">
							<label for="inputAddress">Kode Produk</label>
							<input type="text" required class="form-control" value="<?php
							$sql = 'SELECT max(indeks) as jml FROM produk';
							$query = mysqli_query($conn, $sql);
							$row = mysqli_fetch_assoc($query);
							$hitung = $row['jml'];
							$hitung = $hitung+1;
							if ($hitung>=1&&$hitung<=9) {
								echo "PRO000".$hitung;
							} else if ($hitung>=10&&$hitung<=99) {
								echo "PRO00".$hitung;
							} else if ($hitung>=100&&$hitung<=999) {
								echo "PRO0".$hitung;
							} else if ($hitung>=1000&&$hitung<=9999) {
								echo "PRO".$hitung;
							}
							?>" name="kodepro" readonly required>
						</div>
            <div class="form-group">
              <label for="inputAddress">Nama Produk</label>
              <input type="text" class="form-control" name="nama_produk" autocomplete="off" required>
              <input type="number" hidden class="form-control" name="indeks" value="<?php echo $hitung; ?>" required>
            </div>
            <div class="form-group">
              <label for="inputAddress">Satuan</label>
              <select class="form-control" name="satuan" required>
                <option value="">Pilih Satuan</option>
                <?php
                $sql = 'SELECT * FROM satuan';
  							$query = mysqli_query($conn, $sql);
  							while ($row = mysqli_fetch_assoc($query)) {?>
                  <option value="<?php echo $row['id_satuan']; ?>"><?php echo $row['nama_satuan']; ?></option>
                <?php }
                 ?>
              </select>
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
			<h6 class="font-weight-bold text-primary">List Data Produk</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
              <th>No</th>
							<th>Kode Produk</th>
							<th>Nama Produk</th>
							<th>Satuan</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
            $i=1;
						$sql = 'SELECT *, (SELECT nama_satuan FROM satuan WHERE id_satuan=p.id_satuan) as satuan FROM produk p where status = 1';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
							echo '<tr>
              <td align="center">'.$i++.'</td>
              <td align="center">'.$row['kode_produk'].'</td>
              <td>'.$row['nama_produk'].'</td>
              <td align="center">'.$row['satuan'].'</td>
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
                        <h5 class="modal-title">Edit Detail Produk</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
            						<h6 class="font-weight-bold text-primary">Detail Produk</h6>
                        <div class="form-group">
                          <label for="inputAddress">Kode Produk</label>
                          <input type="hidden" class="form-control" value="'.$row['id_produk'].'" name="id" required>
                          <input type="text" class="form-control" value="'.$row['kode_produk'].'" name="nama_produk" required readonly>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">Nama Produk</label>
                          <input type="text" class="form-control" value="'.$row['nama_produk'].'" name="nama_produk" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">Satuan</label>
                          <select class="form-control" name="satuan" required>
                            <option value="">Pilih Satuan</option>'?>
                            <?php
                            $sqls = 'SELECT * FROM satuan';
              							$querys = mysqli_query($conn, $sqls);
              							while ($rows = mysqli_fetch_assoc($querys)) {
                              if ($row['id_satuan']==$rows['id_satuan']) { ?>
                              <option value="<?php echo $rows['id_satuan']; ?>" selected><?php echo $rows['nama_satuan']; ?></option>
                              <?php } else { ?>
                              <option value="<?php echo $rows['id_satuan']; ?>"><?php echo $rows['nama_satuan']; ?></option>
                              <?php }?>
                            <?php }
                             ?>
                        <?php echo '
                        </select>
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
