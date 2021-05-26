<?php
if (isset($_GET['id'])) { 
	$qury = "SELECT *, (select Nama from supplier where kodesup=a.kodesup) as nama_pt, (select Kota from supplier where kodesup=a.kodesup) as kota FROM order_android a join order_android_detail b on a.id_order=b.id_order where a.id_order = ".$_GET['id'];
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$sts = $hasil['status'];
}
?>
<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Create Timbangan</h1>
	</div>
	<!--<form action="" method="POST">-->
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Create Timbangan</h6>
					</div>
					<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
						<div class="card-body">
							<div class="row">
								<div class="col-md-6">
									<label for="inputAddress">Kode Order PO</label>
									<input type="text" class="form-control" name="kode_orderpo" value="<?php echo $hasil['kode_orderpo']; ?>" readonly="">
									<label for="inputAddress">Nama Penghasil</label>
									<input type="text" class="form-control" name="spku" value="<?php echo $hasil['nama_pt']; ?>" readonly="">
									<label for="inputAddress">Qty Android</label>
									<input type="text" class="form-control" name="quantity_order" value="<?php echo $hasil['quantity_order']; ?>" readonly="">
									<label for="inputAddress">Qty Penghasil</label>
									<input type="text" class="form-control" name="quantity_penghasil" value="<?php echo $hasil['quantity_penghasil']; ?>">
									<label for="inputAddress">Qty Tujuan</label>
									<input type="text" class="form-control" name="quantity_tujuan" value="<?php echo $hasil['quantity_tujuan']; ?>">
								</div>
								<div class="col-md-6">
									
									<label for="inputAddress">Nama Pemanfaat</label>
									<select name="kodepl" id="" class="form-control" readonly="" disabled>
										<?php 
										$djndn = "SELECT * FROM `pelanggan`";
											$dj = mysqli_query($conn, $djndn);
											while ($jdbvj = mysqli_fetch_array($dj)) {
												if ($hasil['kodepl'] == $jdbvj['kodepl']) {

													echo '<option value="'.$jdbvj['kodepl'].'" selected>'.$jdbvj['Nama'].'</option>';
												}else {
													echo '<option value="'.$jdbvj['kodepl'].'">'.$jdbvj['Nama'].'</option>';
												}

											}
										 ?>
										
									</select>
									<input type="hidden" name="kodepl" id="kodeplreal">
									<label for="inputAddress">Ongkos Kerja</label>
							    	<input type="number" id="harga" class="form-control" readonly="readonly" name="harga" id="" value="<?php echo $hasil['ongkir']; ?>">
									<label for="inputAddress">No Manifest Pengumpulan</label>
							    	<input type="text" class="form-control" name="manifest_pengumpulan" id="" value="<?php echo $hasil['manifest_pengumpulan']; ?>">
									<label for="inputAddress">No Manifest Pemanfaat</label>
							    	<input type="text" class="form-control" name="manifest_pemanfaat" id="" value="<?php echo $hasil['manifest_pemanfaat']; ?>">
									</div>
								<div class="col-md-12">
								    <label for="inputAddress">Keterangan</label>
								<textarea class="form-control" name="ket_order"><?php echo $hasil['ket_order']; ?></textarea>
							</div>
								
							</div>
							<center>
								<br>
								<?php
								if($sts == 2){
									echo '<button name="submit" type="submit" id="button_check_y" class="col-md-3 btn btn-primary">Simpan</button>';
								}
								?>
							</center>

						</div>
					</form>
				</div>
			</div>
		</div>
		<!--</form>-->
	</div>
	<?php
	if (isset($_POST['submit'])) {
		$tgl = date("Y-m-d");
		$sql = "UPDATE `order_android` SET `manifest_pengumpulan` = '".$_POST['manifest_pengumpulan']."',`manifest_pemanfaat` = '".$_POST['manifest_pemanfaat']."',`ket_order` = '".$_POST['ket_order']."' WHERE `order_android`.`id_order` = ".$_GET['id'];
		mysqli_query($conn, $sql);
		
		$sql = "UPDATE `order_android_detail` SET `quantity_penghasil` = '".$_POST['quantity_penghasil']."',`quantity_tujuan` = '".$_POST['quantity_tujuan']."' WHERE `order_android_detail`.`id_order` = ".$_GET['id'];
		mysqli_query($conn, $sql);
		
		if($query){
			$jenis_alert = "success";
			$alert = "Sukses Insert Data";
		}else{
			$jenis_alert = "danger";
			$alert = mysqli_error($conn);
		}
		echo '<script language="javascript">window.location.assign("?page=listtimbangan")</script>';

	}

	?>
