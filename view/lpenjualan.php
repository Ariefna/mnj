<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Laporan Penjualan</h1>
		<a href="#" data-target="#cetak"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-print fa-sm text-white-50"></i>  Filter Tanggal</a>
		<div class="modal fade" id="cetak" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="" method="GET">
						<div class="modal-header">
							<h5 class="modal-title">Input Detail Tanggal</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<input type="hidden" name="page" value="lpenjualan">
								<label for="inputAddress">Tanggal Awal</label>
								<input type="date" class="form-control" name="awal" required>
							</div>
							<div class="form-group">
								<label for="inputAddress">Tanggal Akhir</label>
								<input type="date" class="form-control" name="akhir" required>
							</div>
							<div class="form-group">
								<label for="inputAddress">Jenis</label>
								<select class="form-control" name="jenis" id="">
									<option value="">>- Pilih Jenis -<</option>
									<option value="1">Summary</option>
									<option value="2">Detail</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button name="" type="submit" class="btn btn-primary">Cetak</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Laporan Penjualan</h6>
					</div>
					<div class="card-body">
						<form action="" method="GET">
							<input type="hidden" name="page" value="lpenjualan">
							<select onchange="this.form.submit()" class="form-control" name="jenis" id="">
								<option value="">>- Pilih Jenis -<</option>
								<option value="1">Summary</option>
								<option value="2">Detail</option>
							</select>
						</form>
						<div class="row">
							<div class="col-md-12">
								<div class="table-responsive">
									<?php if (isset($_GET['jenis']) && $_GET['jenis'] == 2){ ?>
										<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>Tanggal</th>
													<th>Kode Invoice</th>
													<th>kode SJ</th>
													<th>kode SP</th>
													<th>KTP</th>
													<th>Kode Cust</th>
													<th>Nama Cust</th>
													<th>Alamat</th>
													<th>Sales</th>
													<th>Kode Buku</th>
													<th>Judul Buku</th>
													<th>Qty</th>
													<th>Penjualan Bruto</th>
													<th>Rabat (%)</th>
													<th>Netto Setelah Rabat</th>
													<th>Retur Qty</th>
													<th>Retur Rp</th>
													<th>Termin</th>
													<th>Keterangan</th>
												</tr>
											</thead>
											<tfoot>
												<th>Tanggal</th>
												<th>Kode Invoice</th>
												<th>kode SJ</th>
												<th>kode SP</th>
												<th>KTP</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Alamat</th>
												<th>Sales</th>
												<th>Kode Buku</th>
												<th>Judul Buku</th>
												<th>Qty</th>
												<th>Penjualan Bruto</th>
												<th>Rabat (%)</th>
												<th>Netto Setelah Rabat</th>
												<th>Retur Qty</th>
												<th>Retur Rp</th>
												<th>Termin</th>
												<th>Keterangan</th>
											</tfoot>
											<?php
											if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
												$djndn = "SELECT COALESCE((SELECT sum(qty) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as returqty, COALESCE((SELECT sum(total) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as retur, f.keterangan,f.kode_sp,f.tempo,p.*,DATE_FORMAT(DATE_ADD(f.tanggal, INTERVAL f.tempo DAY), '%d %M %Y') AS termin,f.sales, bk.Kode_Buku, bk.Judul_Buku, a.qty ,nama, ktp, a.id_sj, kode_inv, f.diskon, kode_sj, sum(total) as ff, f.kodepl, DATE_FORMAT(b.tanggal, '%d %M %Y') as tanggal, sum(a.qty) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj join table_sp f on b.id_sp = f.id_sp join pelanggan p on p.kodepl=b.kodepl join table_buku bk on a.id_buku = bk.id_buku where b.tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' group by id_sj,bk.id_buku order by kode_sj desc";
											}else {
												$djndn = "SELECT COALESCE((SELECT sum(qty) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as returqty, COALESCE((SELECT sum(total) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as retur, f.keterangan,f.kode_sp,f.tempo,p.*,DATE_FORMAT(DATE_ADD(f.tanggal, INTERVAL f.tempo DAY), '%d %M %Y') AS termin,f.sales, bk.Kode_Buku, bk.Judul_Buku, a.qty ,nama, ktp, a.id_sj, kode_inv, f.diskon, kode_sj, sum(total) as ff, f.kodepl, DATE_FORMAT(b.tanggal, '%d %M %Y') as tanggal, sum(a.qty) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj join table_sp f on b.id_sp = f.id_sp join pelanggan p on p.kodepl=b.kodepl join table_buku bk on a.id_buku = bk.id_buku group by id_sj,bk.id_buku order by kode_sj desc";
											}

											$dj = mysqli_query($conn, $djndn);
											$i=1;
											while ($jdbvj = mysqli_fetch_array($dj)) {
												if ($jdbvj['jml']!=0) {
													$rabat = ($jdbvj['ff']*($jdbvj['diskon']/100));
													$gross = $jdbvj['ff']-$rabat;
													echo '<tr>
													<td align="center">'.$jdbvj['tanggal'].'</td>
													<td align="center">'.$jdbvj['kode_inv'].'</td>
													<td align="center">'.$jdbvj['kode_sj'].'</td>
													<td align="center">'.$jdbvj['kode_sp'].'</td>
													<td align="center">'.$jdbvj['ktp'].'</td>
													<td align="center">'.$jdbvj['kodepl'].'</td>
													<td align="center">'.$jdbvj['nama'].'</td>
													<td align="center">'.$jdbvj['Alamat'].'</td>
													<td align="center">'.$jdbvj['sales'].'</td>
													<td align="center">'.$jdbvj['Kode_Buku'].'</td>
													<td align="center">'.$jdbvj['Judul_Buku'].'</td>
													<td align="center">'.$jdbvj['qty'].'</td>
													<td align="center">'.$jdbvj['ff'].'</td>
													<td align="center">'.$jdbvj['diskon'].'</td>
													<td align="center">'.$gross.'</td>
													<td align="center">'.$jdbvj['returqty'].'</td>
													<td align="center">'.$jdbvj['retur'].'</td>
													<td align="center">'.$jdbvj['tempo'].' hari</td>
													<td align="center">'.$jdbvj['keterangan'].'</td>
													</tr>';
													$i++;
												}

											}

											?>

										</table>
									<?php }else{ ?>
										<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
											<thead>
												<tr>
													<th>No</th>
													<th>Tanggal</th>
													<th>Kode Invoice</th>
													<th>kode SJ</th>
													<th>kode SP</th>
													<th>No. KTP</th>
													<th>Kode Cust</th>
													<th>Nama Cust</th>
													<th>Alamat</th>
													<th>Penjualan Bruto</th>
													<th>Rabat (%)</th>
													<th>Netto Setelah Rabat</th>
													<th>Retur (Rp)</th>
													<th>Pembayaran</th>
													<th>Saldo Piutang</th>
													<th>Termin</th>
													<th>Keterangan</th>
												</tr>
											</thead>
											<tfoot>
												<th>No</th>
												<th>Tanggal</th>
												<th>Kode Invoice</th>
												<th>kode SJ</th>
												<th>kode SP</th>
												<th>No. KTP</th>
												<th>Kode Cust</th>
												<th>Nama Cust</th>
												<th>Alamat</th>
												<th>Penjualan Bruto</th>
												<th>Rabat (%)</th>
												<th>Netto Setelah Rabat</th>
												<th>Retur (Rp)</th>
												<th>Pembayaran</th>
												<th>Saldo Piutang</th>
												<th>Termin</th>
												<th>Keterangan</th>
											</tfoot>
											<?php
											if (isset($_GET['awal'])) {
												$djndn = "SELECT COALESCE((SELECT sum(total) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as retur,COALESCE((SELECT sum(total_pem) totala FROM `pembayaran` where kode_inv = k.kode_inv),0) as pembayaran, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.Nama = p.Nama ORDER by `kodepiutang` DESC),0) as aldo ,p.*,f.keterangan,f.kode_sp,f.tempo,f.sales,DATE_FORMAT(DATE_ADD(f.tanggal, INTERVAL f.tempo DAY), '%d %M %Y') AS termin ,nama, ktp, a.id_sj, kode_inv, f.diskon, kode_sj, sum(total) as ff, f.kodepl, DATE_FORMAT(b.tanggal, '%d %M %Y') as tanggal, sum(a.qty) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj join table_sp f on b.id_sp = f.id_sp join pelanggan p on p.kodepl=b.kodepl where b.tanggal between '".$_GET['awal']."' and '".$_GET['akhir']."' group by id_sj,id_buku order by kode_sj desc";
											}else {
												$djndn = "select COALESCE((SELECT sum(total) totala FROM `retur` r join `retur_detail` rd on r.id_rt=rd.id_retur where kode_inv = k.kode_inv),0) as retur, COALESCE((SELECT sum(total_pem) totala FROM `pembayaran` where kode_inv = k.kode_inv),0) as pembayaran,COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.Nama = p.Nama ORDER by `kodepiutang` DESC),0) as aldo, p.*,f.keterangan,f.kode_sp,f.tempo,f.sales,DATE_FORMAT(DATE_ADD(f.tanggal, INTERVAL f.tempo DAY), '%d %M %Y') AS termin ,nama, ktp, a.id_sj, kode_inv, f.diskon, kode_sj, sum(total) as ff, f.kodepl, DATE_FORMAT(b.tanggal, '%d %M %Y') as tanggal, sum(a.qty) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj join table_sp f on b.id_sp = f.id_sp join pelanggan p on p.kodepl=b.kodepl group by id_sj,id_buku order by kode_sj desc";
											}

											$dj = mysqli_query($conn, $djndn);
											$i=1;
											while ($jdbvj = mysqli_fetch_array($dj)) {
												if ($jdbvj['jml']!=0) {
													$rabat = ($jdbvj['ff']*($jdbvj['diskon']/100));
													$gross = $jdbvj['ff']-$rabat;
													echo '<tr>
													<td align="center">'.$i.'</td>
													<td align="center">'.$jdbvj['tanggal'].'</td>
													<td align="center">'.$jdbvj['kode_inv'].'</td>
													<td align="center">'.$jdbvj['kode_sj'].'</td>
													<td align="center">'.$jdbvj['kode_sp'].'</td>
													<td align="center">'.$jdbvj['ktp'].'</td>
													<td align="center">'.$jdbvj['kodepl'].'</td>
													<td align="center">'.$jdbvj['nama'].'</td>
													<td align="center">'.$jdbvj['Alamat'].'</td>
													<td align="center">'.$jdbvj['ff'].'</td>
													<td align="center">'.$jdbvj['diskon'].'</td>
													<td align="center">'.$gross.'</td>
													<td align="center">'.$jdbvj['retur'].'</td>
													<td align="center">'.$jdbvj['pembayaran'].'</td>
													<td align="center">'.$jdbvj['aldo'].'</td>
													<td align="center">'.$jdbvj['tempo'].' hari</td>
													<td align="center">'.$jdbvj['keterangan'].'</td>
													</tr>';
													$i++;
												}

											}

											?>

										</table>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
