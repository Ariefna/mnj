<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Retur</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Retur</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="laporan_retur">
								<input type='date' name="awal" class="form-control col-md-3 col-xs-12" id='datepicker' placeholder='Tanggal Awal' style="margin-right: 10px;">
								<input type='date' name="akhir" class="form-control col-md-3 col-xs-12" id='datepicker2' placeholder='Tanggal Akhir' style="margin-right: 10px;">
								<input type="submit" value="submit" class="col-md-1 col-xs-12 btn btn-success">
							</div>
						</form>
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Invoice</th>
												<th>Kode Surat Jalan</th>
												<th>Kode Pemanfaat</th>
												<th>Jumlah</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Invoice</th>
											<th>Kode Surat Jalan</th>
											<th>Kode Pemanfaat</th>
											<th>Jumlah</th>
											<th>Aksi</th>
										</tfoot>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
										$djndn = "SELECT s.*, d.*, sum(qty) FROM retur s join retur_detail d on s.id_rt = d.id_retur where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' group by s.id_rt order by 1 desc";
										} else {
											$djndn = "SELECT s.*, d.*, sum(qty) FROM retur s join retur_detail d on s.id_rt = d.id_retur group by s.id_rt order by 1 desc";
										}

										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_inv'].'</td>
											<td align="center">'.$jdbvj['kode_sj'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['sum(qty)'].'</td>
											<td align="center"><a href="rtr.php?kode_sj='.$jdbvj['kode_sj'].'&kode_rt='.$jdbvj['kode_rt'].'" class=""><i class="fas fa-fw fa-print"></i></a></td>
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
