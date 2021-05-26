<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">List Tugas Kerja</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Tugas Kerja</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Tugas Kerja</th>
												<th>Kode Pemanfaat</th>
												<th>Nama Sales</th>
												<th>Tanggal</th>
												<th>Jumlah Pembelian</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Tugas Kerja</th>
											<th>Kode Pemanfaat</th>
											<th>Nama Sales</th>
											<th>Tanggal</th>
											<th>Jumlah Pembelian</th>
											<th>Aksi</th>
										</tfoot>
										<?php
										$djndn = "select *, sum(b.qty) as qtyku from tugas_kerja a join tk_penjualan b on a.id_tk = b.id_tk group by a.id_tk";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_proyek'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td>'.$jdbvj['sales'].'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['qtyku'].'</td>
											<td class="text-center"><a href="?page=penyesuaian_pekerjaan&id_tk='.$jdbvj[0].'" class="btn btn-success btn-sm">Create</a></td>
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
