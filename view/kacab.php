<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Surat <?php echo strtoupper($_GET['page']); ?></h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Surat <?php echo strtoupper($_GET['page']); ?></h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<?php
										if ($_GET['page'] == "sp") {
											echo "<thead>
											<tr>
											<th>No</th>
											<th>Kode Pemanfaat</th>
											<th>Nama Sales</th>
											<th>Tanggal</th>
											<th>Jumlah Pembelian</th>
											<th>Status</th>
											<th>Aksi</th>
											</tr>
											</thead>
											<tfoot>
											<th>No</th>
											<th>Kode Pemanfaat</th>
											<th>Nama Sales</th>
											<th>Tanggal</th>
											<th>Jumlah Pembelian</th>
											<th>Status</th>
											<th>Aksi</th>
											</tfoot>";
										}
										elseif ($_GET['page'] == "sj") {
											echo "<thead>
											<tr>
											<th>No</th>
											<th>Kode Pemanfaat</th>
											<th>Tanggal</th>
											<th>Jumlah Pembelian</th>
											<th>Status</th>
											<th>Aksi</th>
											</tr>
											</thead>
											<tfoot>
											<th>No</th>
											<th>Kode Pemanfaat</th>
											<th>Tanggal</th>
											<th>Jumlah Pembelian</th>
											<th>Status</th>
											<th>Aksi</th>
											</tfoot>";
										}elseif ($_GET['page'] == "invoice") {

										}elseif ($_GET['page'] == "return") {

										}
										?>
										<?php
										if ($_GET['page'] == "sp") {
											$djndn = "SELECT a.id_sp, kodepl, sales, tanggal, status, sum(qty) FROM table_sp_detail a join table_sp b on a.id_sp = b.id_sp group by kodepl, sales, tanggal, status order by tanggal desc";
										}
										elseif ($_GET['page'] == "sj") {
											$djndn = "SELECT a.id_sj, kodepl, tanggal, status, sum(qty) FROM table_sj_detail a join table_sj b on a.id_sj = b.id_sj group by kodepl, tanggal, status order by tanggal desc";
										}elseif ($_GET['page'] == "invoice") {

										}elseif ($_GET['page'] == "return") {

										}
										?>


										<?php


										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']==0) {
												$sts="Membutuhkan tindakan";
											} else {
												$sts="Approved";
											}


											if ($_GET['page'] == "sp") {
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kodepl'].'</td>
												<td>'.$jdbvj['sales'].'</td>
												<td align="center">'.$jdbvj['tanggal'].'</td>
												<td align="center">'.$jdbvj['sum(qty)'].'</td>
												<td align="center">'.$sts.'</td>
												<td class="text-center"><a href="sp.php?kode_sp='.$jdbvj[0].'" class="" target="_blank" style="margin-right:5px"><i class="fas fa-fw fa-print"></i></a><a href="?page=createapprove&sp='.$jdbvj[0].'" class=""><i class="fas fa-fw fa-eye"></i></a></td>
												</tr>';
											}
											elseif ($_GET['page'] == "sj") {
												echo '<tr>
												<td align="center">'.$i.'</td>
												<td align="center">'.$jdbvj['kodepl'].'</td>
												<td align="center">'.$jdbvj['tanggal'].'</td>
												<td align="center">'.$jdbvj['sum(qty)'].'</td>
												<td align="center">'.$sts.'</td>
												<td class="text-center"><a href="sp.php?kode_sp='.$jdbvj[0].'" class="" target="_blank" style="margin-right:5px"><i class="fas fa-fw fa-print"></i></a><a href="?page=createapprove&sp='.$jdbvj[0].'" class=""><i class="fas fa-fw fa-eye"></i></a></td>
												</tr>';
											}elseif ($_GET['page'] == "invoice") {

											}elseif ($_GET['page'] == "return") {

											}

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
