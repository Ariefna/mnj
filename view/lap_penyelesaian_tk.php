<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Penyelesaian TK</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Penyelesaian TK</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="lap_pem">
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
												<th>Tanggal</th>
												<th>Kode Penyelesaian</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Nama Barang</th>
												<th>Qty</th>
												<th>Kode TK</th>
												<th>Status</th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "SELECT tanggal, kode_pem, pem.kodepl, nama, alamat, total_pem, kode_inv, status from pembayaran pem join pelanggan pel on pem.kodepl=pel.kodepl where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' order by kode_pem desc";
										} else {
											$djndn = "SELECT a.tanggal, kode, a.kodepl, b.Nama, c.nama, c.qty, d.kode_proyek, a.status FROM `penyelesaian_tk` a join pelanggan b on a.kodepl = b.kodepl join detail_penyelesaian_tk c on a.id_woc = c.id_woc join tugas_kerja d on a.id_tk = d.id_tk order by a.id_woc";
										}



										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']==0) {
												$sts="Belum approve";
											} elseif ($jdbvj['status']==1) {
												$sts="Approved";
											}
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['kode'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['nama'].'</td>
											<td align="center">'.$jdbvj['qty'].'</td>
											<td align="center">'.$jdbvj['kode_proyek'].'</td>
											<td align="center">'.$sts.'</td>
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
