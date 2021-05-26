<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Laporan Rugi Laba</h1>
		<a href="fpdf.php?laporan=laba-rugi" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-print fa-sm text-white-50"></i>  Generate PDF</a>
	</div>
	<div class="card  mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">Review Laporan Rugi Laba</h6>
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
<div class="table-responsive">
	<table class="table table-bordered" width="100%" cellspacing="0">
		<tr><th>Kode Perkiraan</th><th>Uraian</th><th>Pendapatan</th><th>Pengeluaran</th></tr>
		<?php 
		$transaksi = mysqli_query($conn ,"select * from tabel_transaksi order by tanggal_transaksi asc");
		$total=mysqli_fetch_array(mysqli_query($conn ,"select sum(debet) as tot_debet, sum(kredit) as tot_kredit from tabel_transaksi order by kode_rekening asc"));
		$tot_debet = $total[0];
		$tot_kredit = $total[1];
		?>
		<tr>
			<td align="center" colspan="0">I</td>
			<td colspan=""><b>PENJUALAN</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$penjualan=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening = '4101.00'");
		while($row_umum=mysqli_fetch_array($penjualan)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		<tr>
			<td align="center" colspan="0">II</td>
			<td colspan="0"><b>BEBAN POKOK PENJUALAN</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$hpp=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening between '5101' and '5728'");
		while($row_umum=mysqli_fetch_array($hpp)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		<tr>
			<td align="center" colspan="0">III</td>
			<td colspan=""><b>Beban Penjualan</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$biaya_umum=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening between '6100' and '6414'");
		while($row_umum=mysqli_fetch_array($biaya_umum)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		<tr>
			<td align="center" colspan="0">IV</td>
			<td colspan=""><b>Beban Umum dan Administrasi</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$biaya_umum=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening between '7100' and '7420'");
		while($row_umum=mysqli_fetch_array($biaya_umum)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		<tr>
			<td align="center" colspan="0">V</td>
			<td colspan=""><b>Pendapatan Lain - lain</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$biaya_umum=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening between '8100' and '8199'");
		while($row_umum=mysqli_fetch_array($biaya_umum)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		<tr>
			<td align="center" colspan="0">VI</td>
			<td colspan=""><b>Beban Lain -lain</b></td>
			<td></td><td></td>
		</tr>
		<?php
		$biaya_umum=mysqli_query($conn,"select * from tabel_rugi_laba where kode_rekening between '8200' and '8299'");
		while($row_umum=mysqli_fetch_array($biaya_umum)){
		?>
		<tr><td align="center"><?php echo $row_umum['kode_rekening'];?></td><td><?php echo $row_umum['nama_rekening'];?></td>
			<td align="right"><?php echo number_format($row_umum['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($row_umum['rl_kredit'],2,'.',','); ?></td></tr>
			<?php
		}
		?>
		
		<tr><td colspan="4"></tr>
			<?php
			$pendapatan=mysqli_fetch_array(mysqli_query($conn,"select * from tabel_rugi_laba where nama_rekening='JUMLAH PENDAPATAN'"));
			?>
			<tr><td></td><td><font color="#333333">JUMLAH PENDAPATAN</font></td>
				<td align="right"><?php echo number_format($pendapatan['rl_kredit'],2,'.',','); ?></td><td align="right"><?php echo number_format($pendapatan['rl_debet'],2,'.',','); ?></td></tr>
				<?php
				$jumlah_biaya=mysqli_fetch_array(mysqli_query($conn,"select * from tabel_rugi_laba where nama_rekening='JUMLAH BIAYA'"));
				?>
				<tr><td></td>
					<td><font color="#333333">JUMLAH BIAYA </font></td>
					<td align="right"><?php echo number_format($jumlah_biaya['rl_kredit'],2,'.',','); ?></td><td align="right"><?php echo number_format($jumlah_biaya['rl_debet'],2,'.',','); ?></td></tr>
					<tr><td colspan="4"></tr>
						<?php
						$shu_berjalan=mysqli_fetch_array(mysqli_query($conn,"select * from tabel_rugi_laba where nama_rekening='Sisa Hasil Usaha Tahun Berjalan'"));
						?>
						<tr><td></td><td><font color="#333333">Sisa Hasil Usaha Tahun Berjalan</font></td>
							<td align="right"><?php echo number_format($shu_berjalan['rl_debet'],2,'.',','); ?></td><td align="right"><?php echo number_format($shu_berjalan['rl_kredit'],2,'.',','); ?></td></tr>
							<tr><td colspan="4"></tr>
								
								</table>
							</div>
						</div>
					</div>
				</div>