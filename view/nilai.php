<?php
if (isset($_POST['edit'])) {
	$dch = "UPDATE `table_tambahan` SET `persen_tbh`='".$_POST['persen_tbh']."' WHERE `id_tambahan`='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Penambahan Nilai</h1>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Penambahan Nilai</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
              <th>No</th>
							<th>Nama</th>
							<th>Persen (%)</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
            $i=1;
						$sql = 'SELECT * FROM table_tambahan tbh';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
							echo '<tr>
              <td align="center">'.$i++.'</td>
              <td>'.$row['nama_tbh'].'</td>
              <td align="center">'.number_format($row['persen_tbh'],0,',','.').'</td>
              <td  style="text-align: center;">
              <a href="" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data">
              <i class="fas fa-edit"></i></a></td>
							</tr>
              <div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <form action="" method="POST">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Detail Penambahan Nilai</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
            						<h6 class="font-weight-bold text-primary">Detail Penambahan Nilai</h6>
                        <div class="form-group">
                          <label for="inputAddress">Nama</label>
                          <input type="text" class="form-control" value="'.$row['nama_tbh'].'" name="nama_produk" required readonly>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">Penambahan Nilai</label>
                          <input type="hidden" class="form-control" value="'.$row['id_tambahan'].'" name="id" required>
                          <input type="number" class="form-control" value="'.$row['persen_tbh'].'" name="persen_tbh" required>
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
