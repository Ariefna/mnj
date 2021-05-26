
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Bahan Baku</h1>
	</div>
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="font-weight-bold text-primary">List Data Bahan Baku</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
						<thead>
							<tr>
                <th>Kode Bahan Baku</th>
								<th>Kode Penghasil</th>
								<th>Nama Penghasil</th>
								<th>Nama Bahan Baku</th>
								<th>Jumlah</th>
								<th>Harga (Rp)</th>
								<th>Total (Rp)</th>
								<th>Aksi</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
                <th>Kode Bahan Baku</th>
								<th>Kode Penghasil</th>
								<th>Nama Penghasil</th>
								<th>Nama Bahan Baku</th>
								<th>Jumlah</th>
								<th>Harga (Rp)</th>
								<th>Total (Rp)</th>
								<th>Aksi</th>
							</tr>

						</tfoot>
						<tbody>
							<?php
              $sql = 'SELECT kodebb, b.kodesup, nama, bahan, jumlah, harga FROM bahan_baku b join supplier s on b.kodesup=s.kodesup';
							$result = mysqli_query($conn, $sql);
							while ($row = mysqli_fetch_array($result)) {
								echo '<tr>
								<td align="center">'.$row['kodebb'].'</td>
								<td align="center">'.$row['kodesup'].'</td>
								<td>'.$row['nama'].'</td>
								<td>'.$row['bahan'].'</td>
								<td align="center">'.$row['jumlah'].'</td>
								<td align="center">'.number_format($row['harga'],2,',','.').'</td>
								<td align="center">'.number_format($row['jumlah']*$row['harga'],2,',','.').'</td>
								<td  style="text-align: center;">
								<a href="" data-target="#edit'.$row[0].'" data-toggle="modal" class="edit_data">
								<i class="fas fa-edit"></i></a></td>
								</tr>
								<div class="modal fade" id="edit'.$row[0].'" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<form action="" method="POST" onsubmit="return confirm("Are you sure you want to submit?")">
												<div class="modal-header">
													<h5 class="modal-title">Edit Detail Supplier</h5>
													<button type="button" class="close" data-dismiss="modal" aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<label for="inputAddress">Kode Bahan Baku</label>
														<input type="text" required class="form-control" value="'.$row['kodebb'].'" name="kodesup" readonly required>
													</div>
												<div class="form-group">
													<label for="inputAddress">Kode Penghasil</label>
													<input type="text" class="form-control" id="subacct" value="'.$row['kodesup'].'" name="nama" readonly required>
												</div>
												<div class="form-group">
													<label for="inputAddress">Nama Penghasil</label>
													<input type="text" class="form-control" id="subacct" value="'.$row['nama'].'" name="alamat" readonly required>
												</div>
												<div class="form-group">
													<label for="inputAddress">Nama Bahan Baku</label>
													<input type="text" class="form-control" id="subacct" value="'.$row['bahan'].'" name="ktp" required>
												</div>
												<div class="form-group">
													<label for="inputAddress">Jumlah</label>
													<input type="number" class="form-control" id="subacct" value="'.$row['jumlah'].'" name="ktp" required>
												</div>
												<div class="form-group">
													<label for="inputAddress">Harga</label>
													<input type="number" class="form-control" id="subacct" value="'.$row['harga'].'" name="ktp" required>
												</div>
												</div>
												<div class="modal-footer">
													<button name="edit" type="submit" class="btn btn-primary">Simpan</button>
													<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
												</div>
											</form>
										</div>
									</div>
								</div>';
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</div>
