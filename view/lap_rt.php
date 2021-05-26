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
								<input type="hidden" name="page" value="lap_rt">
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
												<th>Tanggal RT</th>
												<th>Kode RT</th>
												<th>Kode INV</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Alamat</th>
												<th>Sales</th>
												<th>Kode Buku</th>
												<th>Judul Buku</th>
												<th>Qty</th>
												<th>Harga</th>
												<th>Retur Bruto</th>
												<th>Disc %</th>
												<th>Retur Netto</th>
												<th>Status</th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "SELECT rd.id_produk, r.tanggal, kode_rt, kode_inv, r.kodepl, nama, alamat, tb.kode_produk, tb.nama_produk, qty, total, diskon, r.status from retur r join retur_detail rd on r.id_rt=rd.id_retur join pelanggan p on r.kodepl=p.kodepl join table_sp ts on r.kode_sp=ts.kode_sp join produk tb on rd.id_produk=tb.id_produk where r.tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' order by kode_rt desc";
										} else {
											$djndn = "SELECT rd.id_produk, r.tanggal, kode_rt, kode_inv, r.kodepl, nama, alamat, tb.kode_produk, tb.nama_produk, qty, total, diskon, r.status from retur r join retur_detail rd on r.id_rt=rd.id_retur join pelanggan p on r.kodepl=p.kodepl join table_sp ts on r.kode_sp=ts.kode_sp join produk tb on rd.id_produk=tb.id_produk order by kode_rt desc
											";
										}
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']==0) {
												$sts="Belum approve";
											} elseif ($jdbvj['status']==1) {
												$sts="Approved";
											}
											if ($jdbvj['zona']==0) {
												$que="SELECT harga from table_buku where id_buku=".$jdbvj['id_buku'];
												$ab = mysqli_query($conn, $que);
												$acb = mysqli_fetch_array($ab);
												$harga=$acb['harga'];
											}
											elseif ($jdbvj['zona']==1) {
												$que="SELECT harga2 as harga from table_buku where id_buku=".$jdbvj['id_buku'];
												$ab = mysqli_query($conn, $que);
												$acb = mysqli_fetch_array($ab);
												$harga=$acb['harga'];
											}
											elseif ($jdbvj['zona']==2) {
												$que="SELECT harga3 as harga from table_buku where id_buku=".$jdbvj['id_buku'];
												$ab = mysqli_query($conn, $que);
												$acb = mysqli_fetch_array($ab);
												$harga=$acb['harga'];
											}
											elseif ($jdbvj['zona']==3) {
												$que="SELECT harga4 as harga from table_buku where id_buku=".$jdbvj['id_buku'];
												$ab = mysqli_query($conn, $que);
												$acb = mysqli_fetch_array($ab);
												$harga=$acb['harga'];
											}
											elseif ($jdbvj['zona']==4) {
												$que="SELECT harga5 as harga from table_buku where id_buku=".$jdbvj['id_buku'];
												$ab = mysqli_query($conn, $que);
												$acb = mysqli_fetch_array($ab);
												$harga=$acb['harga'];
											}
											$netto=$jdbvj['total']-($jdbvj['total']*($jdbvj['diskon']/100));
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['kode_rt'].'</td>
											<td align="center">'.$jdbvj['kode_inv'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['nama'].'</td>
											<td align="center">'.$jdbvj['alamat'].'</td>
											<td align="center">'.$jdbvj['sales'].'</td>
											<td align="center">'.$jdbvj['kode_buku'].'</td>
											<td align="center">'.$jdbvj['judul_buku'].'</td>
											<td align="center">'.$jdbvj['qty'].'</td>
											<td align="center">'.$harga.'</td>
											<td align="center">'.$jdbvj['total'].'</td>
											<td align="center">'.$jdbvj['diskon'].'</td>
											<td align="center">'.$netto.'</td>
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
