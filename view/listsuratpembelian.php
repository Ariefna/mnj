<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">List Purchase Order Finance</h1>
	</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
					<a href="?page=suratpembelian2" class="btn btn-primary btn-sm float-right">Create PO Baru</a>
						<h6 class="font-weight-bold text-primary">List Purchase Order Finance</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Order PO</th>
												<th>Nama PT</th>
												<th>Tipe</th>
											</tr>
										</thead>
										<?php
											$djndn = "SELECT *,(select count(*) from table_spp WHERE id_order=a.id_order) as jml, (select Nama from supplier where kodesup=a.kodesup) as nama_pt FROM `order_android` a WHERE status=2 order by 1 desc";
											$dj = mysqli_query($conn, $djndn);
											$i=1;
											while ($jdbvj = mysqli_fetch_array($dj)) {
												if ($jdbvj['status'] == 2 AND $jdbvj['jml']==0) {
													$button = '<a href="?page=suratpembelian&id='.$jdbvj['id_order'].'" class="btn btn-warning btn-sm">Create PO Android</a>';
												} else {
													$button = '';
												}
												
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kode_orderpo'].'</td>
												<td align="center">'.$jdbvj['nama_pt'].'</td>
												<td class="text-center">'.$button.'</td>
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