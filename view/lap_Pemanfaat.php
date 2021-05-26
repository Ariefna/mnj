<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Pemanfaat</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Pemanfaat</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Pemanfaat</th>
												<th>Nama</th>
												<th>NPWP</th>
												<th>Email</th>
												<th>Alamat</th>
												<th>Alamat Koresponden</th>
												<th>No Telp</th>
												<th>Nama Staff</th>
												<th>Jenis Limbah</th>
												<th>Jumlah Limbah</th>
												<th>Kemasan Limbah</th>
												<th>Kapasitas Limbah</th>
												<th>Kode Festronik</th>
											</tr>
										</thead>
										<?php
											$djndn = "SELECT * FROM `order_so`";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_orderso'].'</td>
											<td align="center">'.$jdbvj['nama'].'</td>
											<td align="center">'.$jdbvj['npwp'].'</td>
											<td align="center">'.$jdbvj['email'].'</td>
											<td align="center">'.$jdbvj['alamat'].'</td>
											<td align="center">'.$jdbvj['alamat_koresponden'].'</td>
											<td align="center">'.$jdbvj['no_telp'].'</td>
											<td align="center">'.$jdbvj['nama_staff'].'</td>
											<td align="center">'.$jdbvj['jenis_limbah'].'</td>
											<td align="center">'.$jdbvj['jumlah_limbah'].'</td>
											<td align="center">'.$jdbvj['kemasan_limbah'].'</td>
											<td align="center">'.$jdbvj['kapasitas_limbah'].'</td>
											<td align="center">'.$jdbvj['kode_festronik'].'</td>
											</tr>';
											$i++;
										}
										?>

									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
