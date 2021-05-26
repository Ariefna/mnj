<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Penyesuaian</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Approve Penyesuaian</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Pelanggan</th>
												<th>Tanggal</th>
												<th>Kode VOC</th>
												<th>Total</th>
												<th>status</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Pelanggan</th>
											<th>Tanggal</th>
											<th>Kode VOC</th>
											<th>Total</th>
											<th>status</th>
											<th>Aksi</th>
										</tfoot>
										<?php
										$djndn = "SELECT *, sum(c.qty) jml FROM `penyelesaian_tk` a join pelanggan b on a.kodepl = b.kodepl join detail_penyelesaian_tk c on a.id_woc = c.id_woc group by kode order by 1 DESC";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']==0) {
												$sts="Belum Approve";
												$btn="hidden";
												$btn1="";
											}
											if ($jdbvj['status']==1) {
												$sts="Approve";
												$btn="";
												$btn1="hidden";
											}
											if ($jdbvj['status']==2) {
												$sts="Void";
												$btn="hidden";
												$btn1="hidden";
											}
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['kode'].'</td>
											<td align="center">'.$jdbvj['jml'].'</td>
											<td align="center">'.$sts.'</td>
											<td class="text-center"><a href="Penyelesaian.php?kode='.$jdbvj['kode'].'" class="" target="_blank" style="margin-right:5px" '.$btn.'><i class="fas fa-fw fa-print"></i></a><a href="?page=createapprovepenyelesaian&id_woc='.$jdbvj[0].'" class=""><i class="fas fa-fw fa-eye"></i></a></td>
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
