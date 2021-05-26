
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Invoice</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Invoice</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<div class='container row' >
								<input type="hidden" name="page" value="laporan_invoice">
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
												<th>Kode Surat Jalan</th>
												<th>Kode Invoice</th>
												<th>Kode Pemanfaat</th>
												<th>Jumlah Pengiriman</th>
												<th>Tanggal</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<tfoot>
											<th>No</th>
											<th>Kode Surat Jalan</th>
											<th>Kode Invoice</th>
											<th>Kode Pemanfaat</th>
											<th>Jumlah Pengiriman</th>
											<th>Tanggal</th>
											<th>Aksi</th>
										</tfoot>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "select * from (SELECT kode_sj, kodepl, tanggal, sum(qty), s.status, kode_inv FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj where NOT kode_inv = '' AND NOT kode_sj = '' group by kode_sj UNION select a.Kode_tk 'kode_sj', b.kodepl, b.tanggal, sum(c.qty), b.status, a.kode_inv from table_kodesj a join penyelesaian_tk b on a.Kode_tk = b.kode join detail_penyelesaian_tk c on c.id_woc = b.id_woc GROUP by b.kode) as s where tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' order by kode_inv desc";
										}else {
											$djndn = "select * from (SELECT kode_sj, kodepl, tanggal, sum(qty), s.status, kode_inv FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj where NOT kode_inv = '' AND NOT kode_sj = '' group by kode_sj UNION select a.Kode_tk 'kode_sj', b.kodepl, b.tanggal, sum(c.qty), b.status, a.kode_inv from table_kodesj a join penyelesaian_tk b on a.Kode_tk = b.kode join detail_penyelesaian_tk c on c.id_woc = b.id_woc GROUP by b.kode) as s order by kode_inv desc";
										}
										
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										
										
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status'] == 1) {
												$a = $jdbvj['kode_sj'];

												if (strpos($a, 'WOC-PPP') !== false) {
													$kode_sj = 'invoice_tk.php?kode='.$jdbvj['kode_sj'];
												}else {
													$kode_sj = 'invoice.php?kode_sj='.$jdbvj['kode_sj'];
												}
												
											}else {
												$kode_sj = "";
											}
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_sj'].'</td>
											<td align="center">'.$jdbvj['kode_inv'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['sum(qty)'].'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td class="text-center"><a href="'.$kode_sj.'" class="btn btn-warning btn-sm" target="_blank" style="margin-right:5px">Invoice</a></td>
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
