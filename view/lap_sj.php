<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Surat Jalan</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Surat Jalan</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="lap_sj">
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
												<th>Tanggal SJ</th>
												<th>Kode SJ</th>
												<th>Kode SP</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Alamat</th>
												<th>Kode Buku</th>
												<th>Judul Buku</th>
												<th>Status</th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "SELECT tj.tanggal, kode_sj, kode_sp, tj.kodepl, nama, alamat, tb.kode_produk, tb.nama_produk, tj.status from table_sj tj join table_kodesj tsj on tj.id_sj=tsj.id_sj join table_sj_detail tsd on tj.id_sj=tsd.id_sj join pelanggan p on tj.kodepl=p.kodepl join table_sp ts on tj.id_sp=ts.id_sp join produk tb on tb.id_produk=tsd.id_produk where tj.tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' order by kode_sj desc";
										} else {
											$djndn = "SELECT tj.tanggal, kode_sj, kode_sp, tj.kodepl, nama, alamat, tb.kode_produk, tb.nama_produk, tj.status from table_sj tj join table_kodesj tsj on tj.id_sj=tsj.id_sj join table_sj_detail tsd on tj.id_sj=tsd.id_sj join pelanggan p on tj.kodepl=p.kodepl join table_sp ts on tj.id_sp=ts.id_sp join produk tb on tb.id_produk=tsd.id_produk order by kode_sj desc";
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
											<td align="center">'.$jdbvj['kode_sj'].'</td>
											<td align="center">'.$jdbvj['kode_sp'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['nama'].'</td>
											<td align="center">'.$jdbvj['alamat'].'</td>
											<td align="center">'.$jdbvj['kode_produk'].'</td>
											<td align="center">'.$jdbvj['nama_produk'].'</td>
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
