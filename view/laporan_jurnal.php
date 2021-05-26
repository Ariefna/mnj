<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Buku Jurnal</h1>
	</div>
	<div class="card mb-4">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Buku Jurnal</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>Tanggal</th><th>Nomor Bukti</th><th>Kode Rekening</th><th>Nama Rekening</th><th>Keterangan</th><th>Debet</th><th>Kredit</th><th>Penanggung jawab</th>
						</tr>
					</thead>
					<tbody>
					<?php
					$transaksi = mysqli_query($conn ,"select *, (select nama_rekening from tabel_master where kode_rekening = a.kode_rekening) as nama from tabel_transaksi a where keterangan_posting = 'Post' order by tanggal_transaksi asc");
					while($row_tran=mysqli_fetch_array($transaksi)){
					?>

						<tr>
							<td><?php echo $row_tran['tanggal_transaksi'];?></td>
							<td><?php echo $row_tran['kode_transaksi'];?></td>
							<td><?php echo $row_tran['kode_rekening'];?></td>
							<td><?php echo $row_tran['nama'];?></td>
							<td><?php echo $row_tran['keterangan_transaksi'];?></td>
							<td><?php echo number_format($row_tran['debet'],2,'.',','); ?></td>
							<td><?php echo number_format($row_tran['kredit'],2,'.',','); ?></td>
							<td><?php echo $row_tran['penanggung'];?></td>
						</tr>

					<?php
				}

				$total=mysqli_fetch_array(mysqli_query($conn ,"select sum(debet) as tot_debet, sum(kredit) as tot_kredit from tabel_transaksi where keterangan_posting = 'Post' order by kode_rekening asc"));
				$tot_debet = $total[0];
				$tot_kredit = $total[1];
				?></tbody>
					<tfoot>
				<tr>
					<th colspan="4"><div align="center"><strong>TOTAL TRANSAKSI</strong></div></th>
					<th></th>
					<th align="right"><strong><?php echo number_format($tot_debet,2,'.',','); ?></strong></th>
					<th align="right"><strong><?php echo number_format($tot_kredit,2,'.',','); ?></strong></th>
					<th></th>
				</tr>
			</tfoot>

		</table>
	</div>
</div>
</div>
</div>
