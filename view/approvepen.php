<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Approve Penerimaan Produk</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">List Approve Penerimaan Produk</h6>
					</div>
					<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="table-resjonsive">
									<table class="table table-bordered" id="dataTable1" width="100%" cellsjacing="0">
										<thead>
											<tr>
												<th>No</th>
												<th>Kode Penerimaan Produk</th>
												<th>Tanggal</th>
												<th>Jumlah Pengiriman</th>
												<th>Status</th>
												<th>Aksi</th>
											</tr>
										</thead>
										<?php
										$djndn = "SELECT a.id_pp, kode_pp, DATE_FORMAT(tanggal, '%d %M %Y') as tanggal, status, sum(qty) FROM table_pp b join table_pp_detail a on a.id_pp = b.id_pp GROUP by kode_pp order by id_pp desc";
										$dj = mysqli_query($conn, $djndn);
										$i=1;
										while ($jdbvj = mysqli_fetch_array($dj)) {
											if ($jdbvj['status']==0) {
												$sts="Belum Approve";
												$btn="hidden";
												$btn1="";
											}
											if ($jdbvj['status']==1) {
												$sts="Approve";
												$btn="";
												$btn1="hidden";
											}
											if ($jdbvj['status']==2) {
												$sts="Void";
												$btn="hidden";
												$btn1="hidden";
											}
											echo '<tr>
											<td align="center">'.$i.'</td>
											<td align="center">'.$jdbvj['kode_pp'].'</td>
											<td align="center">'.$jdbvj['tanggal'].'</td>
											<td align="center">'.$jdbvj['sum(qty)'].'</td>
											<td align="center">'.$sts.'</td>
											<td class="text-center"><a href="pp.php?kode_pp='.$jdbvj['kode_pp'].'" class="" target="_blank" style="margin-right:5px" '.$btn.'><i class="fas fa-fw fa-print"></i></a><a href="?page=createapprovepp&pp='.$jdbvj['id_pp'].'" class=""><i class="fas fa-fw fa-eye"></i></a></td>
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
<?php
// if (isset($_GET['sj'])) {
// 	$id_pp = $_GET['sj'];
// 	$qut = "UPDATE `table_buku` as a inner join (SELECT id_buku, qty FROM table_pp_detail a WHERE a.id_pp = '".$id_pp."') as b on a.id_buku = b.id_buku set a.stok = a.stok+b.qty";
// 	mysqli_query($conn, $qut);
// 	$qus = "UPDATE `table_pp` SET `status`= 2 WHERE `id_pp`='".$id_pp."'";
// 	mysqli_query($conn, $qus);
// }
?>
