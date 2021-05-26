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
												<th>No </th>
												<th>Tanggal Inv </th>
												<th>Kode Invoice </th>
												<th>Kode TK </th>
												<th>Kode Penyesuaian </th>
												<th>Kode Pemanfaat </th>
												<th>Nama Pemanfaat </th>
												<th>alamat </th>
												<th>penjualan bruto </th>
												<th>Disc </th>
												<th>Netto </th>
												<th>pembayaran </th>
												<th>saldo Piutang  </th>
												<th>Termin </th>
												<th>Sales </th>
												<th>Keterangan </th>
											</tr>
										</thead>
										<?php
										if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
											$djndn = "select a.tanggal_k, a.kode_inv, c.kode_proyek, b.kode, c.kodepl, d.Nama, d.Alamat, sum(e.total) as broto, '0' as disc, sum(e.total) as netto, COALESCE((SELECT sum(total_pem) FROM `pembayaran` where kodepl = d.kodepl),0) as pembayaran, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.kodepl = d.kodepl ORDER by `kodepiutang` DESC),0) as piutang, c.tempo, c.sales, '' as keterangan from table_kodesj a join penyelesaian_tk b on a.Kode_tk = b.kode join tugas_kerja c on b.id_tk = c.id_tk join pelanggan d on b.kodepl = d.kodepl join detail_penyelesaian_tk e on b.id_woc = e.id_woc where tanggal_k between '".$_GET['awal']."' and '".$_GET['akhir']."' GROUP by b.id_woc order by 1 desc";
										} else {
											$djndn = "select a.tanggal_k, a.kode_inv, c.kode_proyek, b.kode, c.kodepl, d.Nama, d.Alamat, sum(e.total) as broto, '0' as disc, sum(e.total) as netto, COALESCE((SELECT sum(total_pem) FROM `pembayaran` where kodepl = d.kodepl),0) as pembayaran, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.kodepl = d.kodepl ORDER by `kodepiutang` DESC),0) as piutang, c.tempo, c.sales, '' as keterangan from table_kodesj a join penyelesaian_tk b on a.Kode_tk = b.kode join tugas_kerja c on b.id_tk = c.id_tk join pelanggan d on b.kodepl = d.kodepl join detail_penyelesaian_tk e on b.id_woc = e.id_woc GROUP by b.id_woc order by 1 desc";
										}



										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['tanggal_k'].'</td>
											<td align="center">'.$jdbvj['kode_inv'].'</td>
											<td align="center">'.$jdbvj['kode_proyek'].'</td>
											<td align="center">'.$jdbvj['kode'].'</td>
											<td align="center">'.$jdbvj['kodepl'].'</td>
											<td align="center">'.$jdbvj['Nama'].'</td>
											<td align="center">'.$jdbvj['Alamat'].'</td>
											<td align="center">'.$jdbvj['broto'].'</td>
											<td align="center">'.$jdbvj['disc'].'</td>
											<td align="center">'.$jdbvj['netto'].'</td>
											<td align="center">'.$jdbvj['pembayaran'].'</td>
											<td align="center">'.$jdbvj['piutang'].'</td>
											<td align="center">'.$jdbvj['tempo'].'</td>
											<td align="center">'.$jdbvj['sales'].'</td>
											<td align="center">'.$jdbvj['keterangan'].'</td>
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
