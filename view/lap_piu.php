<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Piutang</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Piutang</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="lap_piu">
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
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Alamat</th>
												<th>Total Piutang</th>
												<th>Total Pembayaran</th>
												<th>Saldo Piutang</th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "SELECT piu.kodepl, nama, alamat, sum(debet) as piutang, sum(kredit) as pembayaran from table_piutang piu join pelanggan pel on piu.kodepl=pel.kodepl where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' group by piu.kodepl order by kodepl desc";
										} else {
											$djndn = "SELECT piu.kodepl, nama, alamat, sum(debet) as piutang, sum(kredit) as pembayaran from table_piutang piu join pelanggan pel on piu.kodepl=pel.kodepl group by piu.kodepl order by kodepl desc";
										}



										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
                      $saldo=$jdbvj['piutang']-$jdbvj['pembayaran'];
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['nama'].'</td>
											<td align="center">'.$jdbvj['alamat'].'</td>
											<td align="center">'.$jdbvj['piutang'].'</td>
											<td align="center">'.$jdbvj['pembayaran'].'</td>
											<td align="center">'.$saldo.'</td>
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
