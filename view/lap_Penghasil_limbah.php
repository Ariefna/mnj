<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Penghasil</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Penghasil</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Nama Penghasil</th>
												<th>Jenis Limbah</th>
												<th>Nopol</th>
												<th>Jenis Armada</th>
												<th>Tujuan</th>
												<th>Keterangan</th>
											</tr>
										</thead>
										<?php
											$djndn = "SELECT * FROM `order_android` a join kendaraan b on a.id_kendaraan = b.id_kendaraan join supplier c on a.kodesup = c.kodesup";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['jenis_limbah'].'</td>
											<td align="center">'.$jdbvj['plat_nomor'].'</td>
											<td align="center">'.$jdbvj['nama_kendaraan'].'</td>
											<td align="center">'.$jdbvj['Alamat'].'</td>
											<td align="center"></td>
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
