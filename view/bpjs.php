<?php

function rupiah($angka){
	$hasil_rupiah = "Rp " . number_format($angka,0,'','.');
	return $hasil_rupiah;

}

// Function Tambah BPJS
function tambahBPJS($data) {
	global $conn;

	$no_peserta_bpjs = $data['no_peserta_bpjs'];
	$id_admin = $data['id_admin'];
	$kelas_bpjs = $data['kelas_bpjs'];
	$status_pembayaran = $data['status_pembayaran'];

    if ($kelas_bpjs == 1) {
        $biaya = 100000;
    } elseif ($kelas_bpjs == 2) {
        $biaya = 80000;
    } elseif ($kelas_bpjs == 3) {
        $biaya = 50000;
    } else {
        $biaya = $data['biaya'];
    }

	$dch = "INSERT INTO detail_bpjs VALUES(NULL, '$no_peserta_bpjs', '$id_admin', '$kelas_bpjs', '$biaya', '$status_pembayaran')";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}
// Akhir Function Tambah BPJS

// Function Ubah BPJS
function ubahBPJS($data) {
	global $conn;

    $id = $data['id'];
	$no_peserta_bpjs = $data['no_peserta_bpjs'];
	$id_admin = $data['id_admin'];
	$kelas_bpjs = $data['kelas_bpjs'];
	$biaya = $data['biaya'];
	$status_pembayaran = $data['status_pembayaran'];

    if ($kelas_bpjs == 1) {
        $biaya = 100000;
    } elseif ($kelas_bpjs == 2) {
        $biaya = 80000;
    } elseif ($kelas_bpjs == 3) {
        $biaya = 50000;
    } else {
        $biaya = $data['biaya'];
    }

	$dch = "UPDATE detail_bpjs SET
                no_peserta_bpjs = '$no_peserta_bpjs',
                id_admin = '$id_admin',
                kelas_bpjs = '$kelas_bpjs',
                biaya = '$biaya',
                status_pembayaran = '$status_pembayaran'
            WHERE id_detail_bpjs = '$id'";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}
// Akhir Function Ubah BPJS

// Variabel Admin
$admin = mysqli_query($conn, "SELECT * FROM tabel_admin");
// Variabel Admin


$page = '?page=bpjs';
$sec = "1";

// Tambah Admin
if (isset($_POST['usernew'])) {
	if(tambahBPJS($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Tambah";
        header("Refresh: $sec; url=$page");
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Tambah";
        header("Refresh: $sec; url=$page");
	}
}
// Tambah Admin

// Ubah Admin
if (isset($_POST['useredit'])) {
	if(ubahBPJS($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Ubah";
        header("Refresh: $sec; url=$page");
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = mysqli_error($conn);
        header("Refresh: $sec; url=$page");
	}
}
// Akhir Ubah

// Hapus Admin
if (isset($_POST['userdelete'])) {
	$dch = "DELETE FROM detail_bpjs WHERE id_detail_bpjs='".$_POST['id']."'";
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
// Akhir Hapus

?>

<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master BPJS</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50 mr-2"></i>Tambah Data BPJS</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Data BPJS Karyawan</h6>
			<?php if (isset($_SESSION["sukses"]) or isset($gagal) == true) : ?>
					<div class="alert alert-<?= $jenis_alert ?>" role="alert"><?= $alert ?></div>
					<?php unset($_SESSION["sukses"]);?>
			<?php endif;?>
		</div>
		<div class="card-body">
			<table class="table table-bordered text-center" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>No BPJS</th>
						<th>Kelas BPJS</th>
						<th>Jumlah Biaya</th>
						<th>Status Pembayaran</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>No BPJS</th>
						<th>Kelas BPJS</th>
						<th>Jumlah Biaya</th>
						<th>Status Pembayaran</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php
                        $query = mysqli_query($conn, "SELECT * FROM detail_bpjs LEFT JOIN tabel_admin 
						                        ON detail_bpjs.id_admin = tabel_admin.id_admin");
                        $no = 1;
					    foreach($query as $row) : ?>

						<tr>
							<td><?= $no++ ?></td>
							<td><?= $row['nama'] ?></td>
							<td><?= $row['no_peserta_bpjs'] ?></td>
							<td><?= $row['kelas_bpjs'] ?></td>
							<td class="text-left"><?= rupiah($row['biaya']) ?></td>
							<td><?= $row['status_pembayaran'] ?></td>
							<td class="d-flex justify-content-center">
								<div id="<?= $row['id_admin'] ?>" data-target="#edit<?= $row['id_admin'] ?>" data-toggle="modal" class="btn edit_data">
									<i class="fas fa-edit"></i>
								</div>
								<form action="" method="POST">
									<input id="" hidden type="text" class="" value="<?= $row['id_detail_bpjs'] ?>" name="id" placeholder="" required>
										<button type="button" name="userdelete" data-target="#delete<?= $row['id_detail_bpjs'] ?>"  data-toggle="modal" class="btn">
											<i class="Danger fa fa-trash"></i>
										</button>
								</form>
							</td>
						</tr>

						<div class="modal fade" id="delete<?= $row['id_detail_bpjs']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
											<input id="" hidden type="text" class="" value="<?= $row['id_detail_bpjs']; ?>" name="id" placeholder="" required>
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
				<div class="modal-header">
					<h5 class="modal-title">Detail BPJS</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 class="font-weight-bold text-primary">Detail BPJS</h6>
					<div class="form-group">
						<label>Nama</label>
						<input id="" type="text" hidden class="form-control" value="<?= $id['id_detail_bpjs'] ?>" name="id" placeholder="" required>
						<select name="id_admin" id="id_admin" class="form-control form-control-line" required>
                            <option value="<?= $id['id_admin']?>">
                                <?= $id['nama']?>
                            </option>
                            <?php foreach ($admin as $data) : ?>
                                <option value="<?= $data['id_admin'] ?>"><?= $data['nama'] ?></option>
                            <?php endforeach; ?>
                        </select>
					</div>
					<div class="form-group">
						<label>No BPJS</label>
						<input id="" type="number" class="form-control" name="no_peserta_bpjs" value="<?= $id['no_peserta_bpjs'] ?>" required>
					</div>
					<div class="form-group">
						<label>Kelas BPJS</label>
						<select name="kelas_bpjs" id="kelas_bpjs" class="form-control form-control-line" required>
                            <option value="<?= $id['kelas_bpjs']?>">
                                BPJS Kelas <?= $id['kelas_bpjs']?>
                            </option>
                            <option value="1">BPJS Kelas 1</option>
                            <option value="2">BPJS Kelas 2</option>
                            <option value="3">BPJS Kelas 3</option>
                        </select>
					</div>
					<div class="form-group">
						<label>Jumlah Biaya</label>
						<input class="form-control" name="biaya" id="biaya" type="number" placeholder="<?= $id['biaya']?>">
					</div>
                    <div class="form-group">
						<label>Status Pembayaran</label>
						<select name="status_pembayaran" id="status_pembayaran" class="form-control" required>
							<option value="<?= $id['status_pembayaran']?>">
                                <?= $id['status_pembayaran']?>
                            </option>
							<option value="Belum Dibayarkan">Belum Dibayarkan</option>
                            <option value="Sudah Dibayarkan">Sudah Dibayarkan</option>
						</select>
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
					<h5 class="modal-title">Tambah BPJS</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label>No BPJS</label>
						<input id="" type="number" class="form-control" placeholder="xxx" name="no_peserta_bpjs" required>
					</div>
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
						<label>Kelas BPJS</label>
						<select name="kelas_bpjs" id="kelas_bpjs" class="form-control form-control-line" required>
                            <option value="">- Pilih -</option>
                            <option value="1">BPJS Kelas 1</option>
                            <option value="2">BPJS Kelas 2</option>
                            <option value="3">BPJS Kelas 3</option>
                        </select>
					</div>
					<div class="form-group">
						<label>Biaya</label>
						<input type="number" name="biaya" class="form-control" placeholder="Boleh Kosong">
					</div>
					<div class="form-group">
						<label>Status Pembayaran</label>
						<select name="status_pembayaran" id="status_pembayaran" class="form-control" required>
							<option value="">- Pilih -</option>
							<option value="Belum Dibayarkan">Belum Dibayarkan</option>
                            <option value="Sudah Dibayarkan">Sudah Dibayarkan</option>
						</select>
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