<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h'nrc_debet' mb-0 text-gray-800">Laporan Neraca</h1>
		<a href="?laporan=neraca" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-print fa-sm text-white-50"></i>  Generate PDF</a>
	</div>
	<div class="card mb-4">
		<div class="card-header py-'nrc_debet'">
			<h6 class="font-weight-bold text-primary">Laporan Neraca</h6>
		</div>
		<div class="card-body">
			
			<?php 
			$queryrow_year = mysqli_query($conn, "select year(tanggal_transaksi) from tabel_transaksi group by year(tanggal_transaksi)");
			while($row_year=mysqli_fetch_array($queryrow_year)){
				if ($mode == $row_year[0]) {
					echo "<a href='?page=laporan_rugi_laba&mode=$row_year[0]' class='btn-year active-year'>".$row_year[0]."</a>";
				}
				else {
					echo "<a href='?page=laporan_rugi_laba&mode=$row_year[0]' class='btn-year'>".$row_year[0]."</a>";
				}
			}
			?>
			<div class="row">
				<div class="col-md-12 table-responsive">
					<h6 class="font-weight-bold text-primary text-center">AKTIVA</h6>
					<table class="table table-bordered" width="100%" cellspacing="0" id="datatable">
						<tr><th>Kode Perkiraan</th><th>Uraian</th><th>Pendapatan</th><th>Pengeluaran</th></tr>
						<tr>
							<td align="center" colspan="0">I</td>
							<td colspan="0"><b>Asset Lancar</b></td>
							<td></td><td></td>
						</tr>
						<?php 
						$total_debet = 0;
						$total_kredit = 0;
						$qwr = "select * from tabel_neraca WHERE KODE_REKENING BETWEEN '1101.00' AND '1706.52'";
						$query = mysqli_query($conn, $qwr);
						while ($row = mysqli_fetch_array($query)) {
							echo "<tr><td>$row[0]</td><td>$row[1]</td><td>".number_format($row['nrc_debet'],2,'.',',')."</td><td>".number_format($row['nrc_kredit'],2,'.',',')."</td></tr>";
							$total_debet += $row['nrc_debet'];
							$total_kredit += $row['nrc_kredit'];
						}
						echo "<tr><td></td><td><B>TOTAL</B></td><td>".number_format($total_debet,2,'.',',')."</td><td>".number_format($total_kredit,2,'.',',')."</td></tr>";
						$total_smua =0;
						$total_smua = $total_debet-$total_kredit;
						if ($total_debet <= $total_kredit) {
							echo "<tr><td></td><td><B>TOTAL AKTIVA</B></td><td>".number_format(0,2,'.',',')."</td><td>".number_format(abs($total_smua),2,'.',',')."</td></tr>";
						}else {
							echo "<tr><td></td><td><B>TOTAL AKTIVA</B></td><td>".number_format($total_smua,2,'.',',')."</td><td>".number_format(0,2,'.',',')."</td></tr>";
						}
						?>
					</table>
				</div>
				<div class="col-md-12 table-responsive">
					<h6 class="font-weight-bold text-primary text-center">PASIVA</h6>
					<table class="table table-bordered" id="datatable" width="100%" cellspacing="0">
						<tr><th>Kode Perkiraan</th><th>Uraian</th><th>Pendapatan</th><th>Pengeluaran</th></tr>
						<tr>
							<td align="center" colspan="0">I</td>
							<td colspan="0"><b>Asset Lancar</b></td>
							<td></td><td></td>
						</tr>
						<?php 
						$total_debet = 0;
						$total_kredit = 0;

						$qwr = "select * from tabel_neraca WHERE KODE_REKENING BETWEEN '2100.00' AND '3901.01'";
						$query = mysqli_query($conn, $qwr);
						while ($row = mysqli_fetch_array($query)) {
							echo "<tr><td>$row[0]</td><td>$row[1]</td><td>".number_format($row['nrc_debet'],2,'.',',')."</td><td>".number_format($row['nrc_kredit'],2,'.',',')."</td></tr>";
							$total_debet += $row['nrc_debet'];
							$total_kredit += $row['nrc_kredit'];
						}
						echo "<tr><td></td><td><B>TOTAL</B></td><td>".number_format($total_debet,2,'.',',')."</td><td>".number_format($total_kredit,2,'.',',')."</td></tr>";
						$total_smua =0;
						$total_smua = $total_debet-$total_kredit;
						if ($total_debet <= $total_kredit) {
							echo "<tr><td></td><td><B>TOTAL PASIVA</B></td><td>".number_format(0,2,'.',',')."</td><td>".number_format(abs($total_smua),2,'.',',')."</td></tr>";
						}else {
							echo "<tr><td></td><td><B>TOTAL PASIVA</B></td><td>".number_format($total_smua,2,'.',',')."</td><td>".number_format(0,2,'.',',')."</td></tr>";
						}
						?>
					</table>
					
				</div>
			</div>
		</div>
	</div>
</div>