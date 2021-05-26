<?php
if (isset($_POST['edit'])) {
	$dch = "UPDATE `produk` SET `harga_produk`='".$_POST['harga_produk']."' WHERE `id_produk`='".$_POST['id']."'";
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
		<h1 class="h5 mb-0 text-gray-800">Master Stok</h1>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Stok Produk</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
              <th>No</th>
							<th>Nama Produk</th>
							<th>Stok</th>
							<th>Aksi</th>
						</tr>
					</thead>
					<tbody>
						<?php
            $i=1;
						$sql = 'SELECT *, (SELECT sum(masuk) FROM history_produk WHERE id_produk=p.id_produk) as masuk, (SELECT sum(keluar) FROM history_produk WHERE id_produk=p.id_produk) as keluar FROM produk p';
						$result = mysqli_query($conn, $sql);
						while ($row = mysqli_fetch_array($result)) {
              $total_stok = $row['masuk']-$row['keluar'];
							echo '<tr>
              <td align="center">'.$i++.'</td>
              <td>'.$row['nama_produk'].'</td>
              <td align="center">'.$total_stok.'</td>
              <td  style="text-align: center;">
              <a href="" data-target="#edit'.$row[0].'"  data-toggle="modal" class="edit_data">
              <i class="fas fa-eye"></i></a></td>
							</tr>
              <div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <form action="" method="POST">
                      <div class="modal-header">
                        <h5 class="modal-title">Detail Stok Produk</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
            						<h6 class="font-weight-bold text-primary">Detail Stok Produk</h6>

            					</div>
                      <div class="modal-footer">
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
