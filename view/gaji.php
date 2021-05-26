<?php

function rupiah($angka){
	$hasil_rupiah = "Rp " . number_format($angka,0,'','.');
	return $hasil_rupiah;

}

// Function Tambah Admin
function tambahDataGaji($data) {
	global $conn;

	$id_admin = $data['id_admin'];
	$no_rekening = $data['no_rekening'];
	$jumlah_gaji = $data['jumlah_gaji'];
	$jam_lembur = $data['jam_lembur'];
	$uang_lembur = $data['uang_lembur'];
	$bulan = $data['bulan'];
	$status_pembayaran = $data['status_pembayaran'];
	$waktu_pembayaran = $data['waktu_pembayaran'];  

	$dch = "INSERT INTO data_gaji VALUES(NULL, '$id_admin', '$no_rekening', '$jumlah_gaji', '$jam_lembur', '$uang_lembur', '$bulan', '$status_pembayaran', '$waktu_pembayaran')";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}
// Akhir Function Tambah Admin

function ubahDataGaji($data) {
	global $conn;

	$id_gaji = $data['id_gaji'];
	$id_admin = $data['id_admin'];
	$no_rekening = $data['no_rekening'];
	$jumlah_gaji = $data['jumlah_gaji'];
	$jam_lembur = $data['jam_lembur'];
	$uang_lembur = $data['uang_lembur'];
	$bulan = $data['bulan'];
	$status_pembayaran = $data['status_pembayaran'];
	$waktu_pembayaran = $data['waktu_pembayaran'];  

	$dch = "UPDATE data_gaji SET
				id_admin= '$id_admin', 
				no_rekening= '$no_rekening', 
				jumlah_gaji='$jumlah_gaji', 
				jam_lembur= '$jam_lembur', 
				uang_lembur= '$uang_lembur', 
				bulan= '$bulan', 
				status_pembayaran= '$status_pembayaran', 
				waktu_pembayaran= '$waktu_pembayaran'
			WHERE id_gaji = '$id_gaji'";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}

// Variabel Admin
$admin = mysqli_query($conn, "SELECT * FROM tabel_admin");
$now = new DateTime(null, new DateTimeZone('Asia/Jakarta'));
// Variabel Admin

// Tambah Admin
if (isset($_POST['usernew'])) {
	if(tambahDataGaji($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Tambah";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		echo mysqli_error($conn);
	}
}
// Tambah Admin

// Ubah Admin
if (isset($_POST['useredit'])) {
	if(ubahDataGaji($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Ubah";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Ubah";
	}
}
// Akhir Ubah

// Hapus Admin
if (isset($_POST['userdelete'])) {
	$dch = "DELETE FROM data_gaji WHERE id_gaji='".$_POST['id']."'";
	$hapus = mysqli_query($conn, $dch);
	// echo $dch;
	if($hapus > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Hapus";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Hapus";
	}
}

if (isset($_POST['payroll'])) {
	$_SESSION['payroll'] = true;
	$jenis_alert = "primary";
	$alert = "Payroll sedang Proses otomatis dengan Bank Perusahaan";
}
// Akhir Hapus

?>
<script type="text/javascript">
    function hitung_gaji() {
        var jam_lembur = document.transfer.jam_lembur.value;
        var uang_lembur = document.transfer.uang_lembur.value;
        var gaji_utama = document.transfer.gaji_utama.value;
        var total_gaji = document.transfer.total_gaji.value;
        uang_lembur = ( gaji_utama / 173 ) * jam_lembur;
        document.transfer.uang_lembur.value = Math.floor( uang_lembur );

        total_gaji = (gaji_utama - uang_lembur) + (2 * uang_lembur);
        document.transfer.total_gaji.value = Math.floor( total_gaji );
    }
</script>

<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Gaji</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50 mr-2"></i>Tambah Data Gaji</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data Gaji Karyawan</h6>
			<?php if (isset($_SESSION["sukses"]) or isset($gagal) == true or isset($_SESSION["payroll"])) : ?>
					<div class="alert alert-<?= $jenis_alert ?>" role="alert"><?= $alert ?></div>
					<?php unset($_SESSION["sukses"]);?>
					<?php unset($_SESSION["payroll"]);?>
			<?php endif;?>
		</div>
		<div class="card-body">
			<table class="table table-bordered text-center" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>No Rekening</th>
                        <th>Jam Lembur</th>
						<th>Uang Lembur</th>
						<th>Bulan</th>
						<th>Jumlah Gaji</th>
						<th>Status Pembayaran</th>
						<th>Tanggal Pembayaran</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>No Rekening</th>
                        <th>Jam Lembur</th>
						<th>Uang Lembur</th>
						<th>Bulan</th>
						<th>Jumlah Gaji</th>
						<th>Status Pembayaran</th>
						<th>Tanggal Pembayaran</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php
                        $query = mysqli_query($conn, "SELECT * FROM data_gaji LEFT JOIN tabel_admin 
						                        ON data_gaji.id_admin = tabel_admin.id_admin");
                        $no = 1;
					    foreach($query as $row) : ?>

						<tr>
							<td><?= $no++ ?></td>
							<td><?= $row['nama'] ?></td>
							<td><?= $row['no_rekening'] ?></td>
							<td><?= $row['jam_lembur'] ?> Jam</td>
							<td><?= rupiah($row['uang_lembur']) ?></td>
							<td><?= $row['bulan'] ?></td>
							<td><?= rupiah($row['jumlah_gaji'] + $row['uang_lembur']) ?></td>
							<td><?= $row['status_pembayaran'] ?></td>
							<td><?= $row['waktu_pembayaran'] ?></td>
							<td class="d-flex justify-content-center">
								<div id="<?= $row['id_admin'] ?>" data-target="#edit<?= $row['id_admin'] ?>" data-toggle="modal" class="btn edit_data">
									<i class="fas fa-edit"></i>
								</div>
								<form action="" method="POST">
									<input id="" hidden type="text" class="" value="<?= $row['id_gaji'] ?>" name="id" placeholder="" required>
										<button type="button" name="userdelete" data-target="#delete<?= $row['id_gaji'] ?>"  data-toggle="modal" class="btn">
											<i class="Danger fa fa-trash"></i>
										</button>
										<button type="submit" name="payroll" class="btn btn-success rounded text-light">Payroll</button>
								</form>
							</td>
						</tr>

						<div class="modal fade" id="delete<?= $row['id_gaji']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<form action="" method="POST">
										<div class="modal-header">
											<h5 class="modal-title">Perhatian!</h5>
											<button type="button" class="close" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body">
											<input id="" hidden type="text" class="" value="<?= $row['id_gaji']; ?>" name="id" placeholder="" required>
											<p>Hapus Data <b class="bg-danger p-2 rounded text-light"><?= $row['nama'] ?></b> ?</p>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
											<button id="" name="userdelete" type="submit" class="btn btn-primary">Hapus</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					<?php endforeach; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>


<?php foreach ($query as $id) : ?>
<!-- Modal Ubah -->
<div class="modal fade" id="edit<?= $id['id_admin'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="POST">
				<input type="hidden" name="id_gaji" value="<?= $id['id_gaji']?>">
				<div class="modal-header">
					<h5 class="modal-title">Data Gaji Karyawan</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 class="font-weight-bold text-primary">Data Gaji Karyawan</h6>
					<div class="form-group">
						<label>Nama</label>
                        <select name="id_admin" id="id_admin" class="form-control form-control-line" required>
                            <option value="<?= $id['id_admin'] ?>">
								Data Saat Ini: <?= $id['nama'] ?>
							</option>
                            <?php foreach ($admin as $data) : ?>
                                <option value="<?= $data['id_admin'] ?>"><?= $data['nama'] ?></option>
                            <?php endforeach; ?>
                        </select>
					</div>
					<div class="form-group">
						<label>No Rekening</label>
						<input id="" type="number" class="form-control" name="no_rekening" value="<?= $id['no_rekening'] ?>" required>
					</div>
					<div class="form-group">
						<label>Jam Lembur</label>
						<input id="" type="number" class="form-control" name="jam_lembur" value="<?= $id['jam_lembur'] ?>" required>
					</div>
					<div class="form-group">
						<label>Uang Lembur</label>
						<input id="" type="number" class="form-control" name="uang_lembur" value="<?= $id['uang_lembur'] ?>">
					</div>
					<div class="form-group">
						<label>Jumlah Gaji</label>
						<input id="" type="number" class="form-control" name="jumlah_gaji" value="<?= $id['jumlah_gaji'] ?>">
					</div>
					<div class="form-group">
						<label>Bulan</label>
						<select name="bulan" id="bulan" class="form-control" required>
							<option value="">- Pilih -</option>
							<option value="Januari">Januari</option>
                            <option value="Februari">Februari</option>
                            <option value="Maret">Maret</option>
                            <option value="April">April</option>
                            <option value="Mei">Mei</option>
                            <option value="Juni">Juni</option>
                            <option value="Juli">Juli</option>
                            <option value="Agustus">Agustus</option>
                            <option value="September">September</option>
                            <option value="Oktober">Oktober</option>
                            <option value="November">November</option>
                            <option value="Desember">Desember</option>
						</select>
					</div>
					<div class="form-group">
						<label>Status Pembayaran</label>
						<select name="status_pembayaran" id="status_pembayaran" class="form-control" required>
							<option value="">- Pilih -</option>
							<option value="Belum Dibayarkan">Belum Dibayarkan</option>
                            <option value="Sudah Dibayarkan">Sudah Dibayarkan</option>
						</select>
					</div>
                    <div class="form-group">
						<label>Waktu Pembayaran</label>
						<input type="text" readonly name="waktu_pembayaran" class="form-control" value="<?= $now->format('Y-m-d H:i:s') ?>">
					</div>
				</div>
				<div class="modal-footer">
					<button id="" name="useredit" type="submit" class="btn btn-primary">Simpan</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Akhir Modal Ubah -->
<?php endforeach; ?>

<!-- Modal Tambah -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
				<div class="modal-header">
					<h5 class="modal-title">Tambah Data Gaji</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label>Nama</label>
                        <select name="id_admin" id="id_admin" class="form-control form-control-line" required>
                            <option value="">- Pilih -</option>
                            <?php foreach ($admin as $data) : ?>
                                <option value="<?= $data['id_admin'] ?>"><?= $data['nama'] ?></option>
                            <?php endforeach; ?>
                        </select>
					</div>
					<div class="form-group">
						<label>No Rekening</label>
						<input id="" type="number" class="form-control" name="no_rekening" placeholder="xxxxx" required>
					</div>
					<div class="form-group">
						<label>Jam Lembur</label>
						<input type="number" name="jam_lembur" class="form-control" placeholder="xx">
					</div>
					<div class="form-group">
						<label>Uang Lembur</label>
						<input type="number" name="uang_lembur" class="form-control" placeholder="Rp. xxx.xxx">
					</div>
                    <div class="form-group">
						<label>Jumlah Gaji</label>
						<input type="number" name="jumlah_gaji" class="form-control" placeholder="Rp. xxx.xxx">
					</div>
                    <div class="form-group">
						<label>Bulan</label>
						<select name="bulan" id="bulan" class="form-control" required>
							<option value="">- Pilih -</option>
							<option value="Januari">Januari</option>
                            <option value="Februari">Februari</option>
                            <option value="Maret">Maret</option>
                            <option value="April">April</option>
                            <option value="Mei">Mei</option>
                            <option value="Juni">Juni</option>
                            <option value="Juli">Juli</option>
                            <option value="Agustus">Agustus</option>
                            <option value="September">September</option>
                            <option value="Oktober">Oktober</option>
                            <option value="November">November</option>
                            <option value="Desember">Desember</option>
						</select>
					</div>
					<div class="form-group">
						<label>Status Pembayaran</label>
						<select name="status_pembayaran" id="status_pembayaran" class="form-control" required>
							<option value="">- Pilih -</option>
							<option value="Belum Dibayarkan">Belum Dibayarkan</option>
                            <option value="Sudah Dibayarkan">Sudah Dibayarkan</option>
						</select>
					</div>
                    <div class="form-group">
						<label>Waktu Pembayaran</label>
						<input type="text" readonly name="waktu_pembayaran" class="form-control" value="<?= $now->format('Y-m-d H:i:s') ?>">
					</div>
				</div>
				<div class="modal-footer">
					<button id="" name="usernew" type="submit" class="btn btn-primary">Simpan</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Akhir Modal Tambah -->

<!-- Script JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	if ( window.history.replaceState ) {
		window.history.replaceState( null, null, window.location.href );
	}
</script>
<!-- Akhir Script -->