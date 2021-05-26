<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Surat Retur Sales Order</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Retur</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Surat Jalan</th>
												<th>Kode Invoice</th>
												<th>Tanggal</th>
												<th>Jumlah Pembelian</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<?php
										$djndn = "SELECT a.id_sj, kode_inv, kode_sj, kodepl,DATE_FORMAT(tanggal, '%d %M %Y') as tanggal, status, sum(a.qty)-(SELECT COALESCE(sum(qty),0) FROM `retur_detail` a join retur b on a.id_retur = b.id_rt where kode_inv = k.kode_inv) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj group by a.id_sj ORDER BY `id_sj` DESC";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['jml']!=0) {
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kode_sj'].'</td>
												<td align="center">'.$jdbvj['kode_inv'].'</td>
												<td align="center">'.$jdbvj['tanggal'].'</td>
												<td align="center">'.$jdbvj['jml'].'</td>
												<td class="text-center"><a href="?page=createretur&retur='.$jdbvj['id_sj'].'" class="btn btn-success btn-sm">Create</a></td>
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
