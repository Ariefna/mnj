<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Invoice</h1>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="card mb-4">
				<div class="card-header py-3">
					<h6 class="font-weight-bold text-primary">Approve Invoice</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table" id="dataTable1" width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>No</th>
									<th>Keterangan</th>
									<th>Detail</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>No</th>
									<th>Keterangan</th>
									<th>Detail</th>
								</tr>
							</tfoot>
							<tbody>
								<?php
								$no = 0;
								$result = select_tabel_transaksi($conn);
								while ($row = mysqli_fetch_array($result)) {
										$no++;
										echo "<tr>
										<td>$no</td>
										<td>".cutText($row['keterangan_transaksi'], 39, 1)."</td><td class='text-center'><a href='' class=' '><i class='fas fa-fw fa-eye'></i></a></td>";
									?>
									<?php
										echo"</tr>";
								}
								?>

							</tbody>
						</table>
					</div>

				</div>
			</div>

		</div>
	</div>
</div>
