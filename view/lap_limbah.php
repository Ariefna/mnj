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
												<th>Tanggal</th>
												<th>Penghasil</th>
												<th>Jenis Limbah</th>
												<th>Qty Timbang Penghasil</th>
												<th>Qty Pemanfaat</th>
												<th>Pemanfaat</th>
												<th>Driver</th>
												<th>No. Pol</th>
												<th>Pengumpulan</th>
												<th>Pemanfaat</th>
												<th>Tujuan Pemanfaat</th>
												<th>Keterangan</th>
											</tr>
										</thead>
										<?php
											$djndn = "SELECT *,DATE_FORMAT(tanggal_order,'%d-%m-%Y') as tanggal, (select sum(quantity_penghasil) from order_android_detail where id_order = a.id_order) qty_order, (select sum(quantity_tujuan) from order_android_detail where id_order = a.id_order) qty_tujuan, (select nama_produk from order_android_detail d join produk f on d.produk_id = f.id_produk where id_order = a.id_order) nama_produk, (select Nama from pelanggan where kodepl = a.kodepl) tujuanpemanfaat FROM `order_android` a join supplier c on a.kodesup = c.kodesup WHERE NOT (select sum(quantity_tujuan) from order_android_detail where id_order = a.id_order) = 0 order by a.kodesup";
										
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
										    
										    $djs = "SELECT * FROM order_android_kendaraan a join kendaraan b on a.id_kendaraan=b.id_kendaraan WHERE id_order=".$jdbvj['id_order'];
										$djsv = mysqli_query($conn, $djs);
										while ($jdbv = mysqli_fetch_array($djsv)) {
										    echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['nama_produk'].'</td>
											<td align="center">'.$jdbvj['qty_order'].'</td>
											<td align="center">'.$jdbvj['qty_tujuan'].'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbv['driver'].'</td>
											<td align="center">'.$jdbv['plat_nomor'].'</td>
											<td align="center">'.$jdbvj['manifest_pengumpulan'].'</td>
											<td align="center">'.$jdbvj['manifest_pemanfaat'].'</td>
											<td align="center">'.$jdbvj['tujuanpemanfaat'].'</td>
											<td align="center">'.$jdbvj['ket_order'].'</td>
											</tr>';
											$i++;
										}
											
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
