<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Outstanding SP</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Outstanding SP</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="l_outsp">
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
												<th>Kode SP</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Kode Buku</th>
												<th>Nama Buku</th>
												<th>Qty SP</th>
												<th>Qty Terkirim</th>
												<th>Sisa</th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											// $djndn = "SELECT piu.kodepl, nama, alamat, sum(debet) as piutang, sum(kredit) as pembayaran from table_piutang piu join pelanggan pel on piu.kodepl=pel.kodepl where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' group by piu.kodepl order by kodepl desc";
											$djndn = "SELECT a.kode_sp, a.kodepl, b.Nama, f.kode_produk, f.nama_produk, sum(c.qty) sp, sum(e.qty) sj, sum(c.qty)-sum(e.qty) as sisa FROM `table_sp` a join pelanggan b on a.kodepl = b.kodepl join table_sp_detail c on a.id_sp = c.id_sp join table_sj d on a.id_sp = d.id_sp join table_sj_detail e on d.id_sj = e.id_sj join produk f on c.id_produk = f.id_produk GROUP by a.kode_sp where a.tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' GROUP by a.kode_sp";
										} else {
											$djndn = "SELECT a.kode_sp, a.kodepl, b.Nama, f.kode_produk, f.nama_produk, sum(c.qty) sp, sum(e.qty) sj, sum(c.qty)-sum(e.qty) as sisa FROM `table_sp` a join pelanggan b on a.kodepl = b.kodepl join table_sp_detail c on a.id_sp = c.id_sp join table_sj d on a.id_sp = d.id_sp join table_sj_detail e on d.id_sj = e.id_sj join produk f on c.id_produk = f.id_produk GROUP by a.kode_sp";
										}



										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_sp'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['kode_produk'].'</td>
											<td align="center">'.$jdbvj['nama_produk'].'</td>
											<td align="center">'.$jdbvj['sp'].'</td>
											<td align="center">'.$jdbvj['sj'].'</td>
											<td align="center">'.$jdbvj['sisa'].'</td>
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
