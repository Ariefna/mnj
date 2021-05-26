<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Tracking Purchase Order</h1>
	</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Tracking Purchase Order</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Purchase Order</th>
												<th>Tanggal</th>
												<th>Jumlah Pembelian</th>
												<th>Status</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<?php
										$djndn = "SELECT a.id_spp, kode_spp, DATE_FORMAT(tanggal, '%d %M %Y') as tanggal, status, sum(qty) FROM table_spp_detail a join table_spp b on a.id_spp = b.id_spp WHERE status=1 group by a.id_spp order by id_spp desc";
											$dj = mysqli_query($conn, $djndn);
											$i=1;
											while ($jdbvj = mysqli_fetch_array($dj)) {
												if ($jdbvj['status']==0) {
													$sts="Belum Approve";
													$btn="hidden";
												} else {
													$sts="Approved";
													$btn="";
												}
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kode_spp'].'</td>
												<td align="center">'.$jdbvj['tanggal'].'</td>
												<td align="center">'.$jdbvj['sum(qty)'].'</td>
												<td align="center">'.$sts.'</td>
												<td class="text-center"><a href="?page=createtracking&spp='.$jdbvj['id_spp'].'" class=""><i class="fas fa-fw fa-eye"></i></a></td>
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
</div>
