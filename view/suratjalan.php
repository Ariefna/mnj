<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Delivery Order</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Delivery Order</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Sales Order</th>
												<th>Kode Pemanfaat</th>
												<th>Tanggal</th>
												<th>Jumlah Pembelian</th>
												<th>Sisa Pengiriman</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<?php
										$djndn = "SELECT a.id_sp, kode_sp, kodepl, DATE_FORMAT(tanggal, '%d %M %Y') as tanggal, status, sum(qty) as qty1, (SELECT sum(qty) FROM table_sj a join table_sj_detail b on a.id_sj=b.id_sj WHERE id_sp = b.id_sp) as qty2 FROM table_sp_detail a join table_sp b on a.id_sp = b.id_sp group by a.id_sp order by 1 desc";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']!=0 AND $jdbvj['qty1']!=0) {
												$stok = $jdbvj['qty1']-$jdbvj['qty2'];
												if ($stok==0) {
													$btn = "hidden";
												} else {
													$btn = "";
												}
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kode_sp'].'</td>
												<td align="center">'.$jdbvj['kodepl'].'</td>
												<td align="center">'.$jdbvj['tanggal'].'</td>
												<td align="center">'.$jdbvj['qty1'].'</td>
												<td align="center">'.$stok.'</td>
												<td class="text-center"><a href="?page=createsuratjalan&sj='.$jdbvj['id_sp'].'" class="btn btn-success btn-sm" '.$btn.'>Create</a></td>
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
