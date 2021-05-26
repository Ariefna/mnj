<div class="container-fluid">
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Penghasil</h1>
	</div>
	<form action="">
		<div class="row">
			<div class="col-md-12">
				<div class="card mb-4">
					<div class="card-header py-3">
						<h6 class="font-weight-bold text-primary">Input Detail Penghasil</h6>
					</div>
					<div class="card-body">
						<h6 class="font-weight-bold text-primary">Penghasil</h6>
						<div class="form-group">
							<label for="inputAddress">Nama Perusahaan</label>
							<input type="text" class="form-control" id="subacct" name="Nama_Pelanggan">
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="inputAddress">Alamat</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div>

								<!-- <div class="form-group">
									<label for="inputAddress">Provinsi</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div> -->
							</div>
							<div class="col-md-6">
								<!-- <div class="form-group">
									<label for="inputAddress">Telepon</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div> -->
								<div class="form-group">
									<label for="inputAddress">KTP / NPWP</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div>
								<!-- <div class="form-group">
									<label for="inputAddress">Kode Pos</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div> -->
								<!-- <div class="form-group">
									<label for="inputAddress">Pulau</label>
									<input type="text" class="form-control" id="subacct" name="subacct">
								</div> -->
							</div>
						</div>

					</div>
					<center><button name="submit" type="submit" class="col-md-3 btn btn-primary">Simpan</button></center>
					<br>
				</div>
			</div>
		</div>
	</form>
	<div class="col-md-12">
		<div class="card mb-4">
			<div class="card-header py-3">
				<h6 class="font-weight-bold text-primary">List Data Penghasil</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th>Kode</th>
								<th>Nama</th>
								<th>Alamat</th>
								<th>NPWP</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>Kode</th>
								<th>Nama</th>
								<th>Alamat</th>
								<th>NPWP</th>
							</tr>

						</tfoot>
						<tbody>
							<?php
							$result = select_tabel_master($conn);
							while ($row = mysqli_fetch_array($result)) {
								echo "<tr>
								<td class='edit' id='kode_rekening-$row[0]'>$row[kode_rekening]</td>
								<td class='edit' id='nama_rekening-$row[0]'>$row[nama_rekening]</td>
								<td contenteditable class='edit' id='awal_debet-$row[0]'>$row[nama_rekening]</td>
								<td contenteditable class='edit' id='awal_kredit-$row[0]'>$row[nama_rekening]</td>
								</tr>";
							}
							?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
