<?php
if (isset($_POST['edit'])) {
	$dch = "UPDATE `produk` SET `harga_produk`='".$_POST['harga_produk']."',`harga_beli`='".$_POST['harga_beli']."' WHERE `id_produk`='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Harga</h1>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Harga Produk</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
              <th>No</th>
							<th>Nama Produk</th>
							<th>Harga Jual (Rp)</th>
							<th>Harga Beli (Rp)</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
            $i=1;
						$sql = 'SELECT * FROM produk p';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
							echo '<tr>
              <td align="center">'.$i++.'</td>
              <td>'.$row['nama_produk'].'</td>
              <td align="center">'.number_format($row['harga_produk'],0,',','.').'</td>
              <td align="center">'.number_format($row['harga_beli'],0,',','.').'</td>
              <td  style="text-align: center;">
              <a href="" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data">
              <i class="fas fa-edit"></i></a></td>
							</tr>
              <div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <form action="" method="POST" onsubmit="return confirm("Are you sure you want to submit?")">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Detail Harga Produk</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
            						<h6 class="font-weight-bold text-primary">Detail Harga Produk</h6>
                        <div class="form-group">
                          <label for="inputAddress">Nama Produk</label>
                          <input type="text" class="form-control" value="'.$row['nama_produk'].'" name="nama_produk" required readonly>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">Harga Jual Produk</label>
                          <input type="hidden" class="form-control" value="'.$row['id_produk'].'" name="id" required>
                          <input type="number" class="form-control" value="'.$row['harga_produk'].'" name="harga_produk" required>
                        </div>
                        <div class="form-group">
                          <label for="inputAddress">Harga Beli Produk</label>
                          <input type="number" class="form-control" value="'.$row['harga_beli'].'" name="harga_beli" required>
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
