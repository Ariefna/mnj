<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Neraca Lajur</h1>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Neraca Lajur</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" width="100%" id="dataTable1" cellspacing="0">
					<thead>
					<tr>
						<th rowspan="2" style="vertical-align : middle;text-align:center;">Kode Rekening</th>
						<th rowspan="2" style="vertical-align : middle;text-align:center;">Nama Rekening</th>
						<th colspan="2" style="vertical-align : middle;text-align:center;">Awal</th>
						<th colspan="2" style="vertical-align : middle;text-align:center;">Mutasi</th>
						<th colspan="2" style="vertical-align : middle;text-align:center;">Sisa</th>
					</tr>
					<tr>
						<th style="vertical-align : middle;text-align:center;">Debet</th>
						<th style="vertical-align : middle;text-align:center;">Kredit</th>
						<th style="vertical-align : middle;text-align:center;">Debet</th>
						<th style="vertical-align : middle;text-align:center;"> Kredit</th>
						<th style="vertical-align : middle;text-align:center;">Debet</th>
						<th style="vertical-align : middle;text-align:center;">Kredit</th>
					</tr>
				</thead>
					<tbody>
					<?php
					$query_mutasi = mysqli_query($conn ,"select * from tabel_master");
					$total = mysqli_fetch_array(mysqli_query($conn ,"select sum(awal_debet) as tot_awal_debet, sum(awal_kredit) as tot_awal_kredit, sum(mut_debet) as tot_mut_debet,  sum(mut_kredit) as tot_mut_kredit,
						sum(sisa_debet) as tot_sisa_debet, sum(sisa_kredit) as tot_sisa_kredit from tabel_master order by kode_rekening asc"));
					while($row_mut=mysqli_fetch_array($query_mutasi)){
						$awal_debet=$row_mut['awal_debet'];
						$awal_kredit=$row_mut['awal_kredit'];
						$mutasi_debet=$row_mut['mut_debet'];
						$mutasi_kredit=$row_mut['mut_kredit'];
						$sisa_debet=$row_mut['sisa_debet'];
						$sisa_kredit=$row_mut['sisa_kredit'];
						?>
						<tr>
							<td><div align="center"><?php echo $row_mut['kode_rekening'];?></div></td>
							<td><?php echo $row_mut['nama_rekening'];?></td>
							<td align="right"><?php echo number_format($awal_debet,2,'.',','); ?></td>
							<td align="right"><?php echo number_format($awal_kredit,2,'.',','); ?></td>
							<td align="right"><?php echo number_format($mutasi_debet,2,'.',','); ?></td>
							<td align="right"><?php echo number_format($mutasi_kredit,2,'.',','); ?></td>
							<td align="right"><?php echo number_format($sisa_debet,2,'.',','); ?></td>
							<td align="right"><?php echo number_format($sisa_kredit,2,'.',','); ?></td>
						</tr>
						<?php
					}
					?>
					</tbody>
					<tfoot>
					<tr>
						<td colspan="2"><div align="center"><strong>TOTAL TRANSAKSI</strong></div></td>
						<td><div align="right"><strong><?php echo number_format($total['tot_awal_debet'],2,'.',','); ?></strong></div></td><td><div align="right"><strong><?php echo number_format($total['tot_awal_kredit'],2,'.',','); ?></strong></div></td>
						<td><div align="right"><strong><?php echo number_format($total['tot_mut_debet'],2,'.',','); ?></strong></div></td><td><div align="right"><strong><?php echo number_format($total['tot_mut_kredit'],2,'.',','); ?></strong></div></td>
						<td><div align="right"><strong><?php echo number_format($total['tot_sisa_debet'],2,'.',','); ?></strong></div></td>
						<td><div align="right"><strong><?php echo number_format($total['tot_sisa_kredit'],2,'.',','); ?></strong></div></td>
					</tr>
				</tfoot>
				</table>
			</div>
		</div>
	</div>
</div>
