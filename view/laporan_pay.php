<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Pembayaran</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Pembayaran</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="laporan_pay">
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
												<th>Pelanggan</th>
												<th>Tanggal</th>
												<th>No Pembayaran</th>
												<th>No Invoice</th>
												<th>Total</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Pelanggan</th>
											<th>Tanggal</th>
											<th>No Pembayaran</th>
											<th>No Invoice</th>
											<th>Total</th>
											<th>Aksi</th>
										</tfoot>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "SELECT * FROM `pembayaran` a join Pelanggan b on a.kodepl = b.kodepl where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' order by 1 DESC";
										} else {
											$djndn = "SELECT * FROM `pembayaran` a join Pelanggan b on a.kodepl = b.kodepl order by 1 DESC";
										}

										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['kode_pem'].'</td>
											<td align="center">'.$jdbvj['kode_inv'].'</td>
											<td align="center">'.$jdbvj['total_pem'].'</td>
											<td align="center"><a href="bayar.php?kode_pem='.$jdbvj['kode_pem'].'" class=""><i class="fas fa-fw fa-print"></i></a></td>
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
