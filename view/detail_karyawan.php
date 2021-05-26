<?php

function rupiah($angka){
	$hasil_rupiah = "Rp " . number_format($angka,2,',','.');
	return $hasil_rupiah;

}

function ubahDetailKaryawan($data) {
	global $conn;

	$id = $data['id_detail_karyawan'];
	$id_admin = $data['id_admin'];
	$id_divisi_karyawan = $data['id_divisi_karyawan'];
	$id_detail_bpjs = $data['id_detail_bpjs'];
	$id_gaji = $data['id_gaji'];
	$gaji_utama = $data['gaji_utama'];

	$dch = "UPDATE detail_karyawan SET 
				id_admin= '$id_admin',
				id_divisi_karyawan= '$id_divisi_karyawan',
				id_detail_bpjs= '$id_detail_bpjs',
				id_gaji= '$id_gaji',
				gaji_utama= '$gaji_utama'
			WHERE id_detail_karyawan= '$id'";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}

function tambahDetailKaryawan($data) {
	global $conn;

	$id_admin = $data['id_admin'];
	$id_divisi_karyawan = $data['id_divisi_karyawan'];
	$id_detail_bpjs = $data['id_detail_bpjs'];
	$id_gaji = $data['id_gaji'];
	$gaji_utama = $data['gaji_utama'];

	$dch = "INSERT INTO detail_karyawan VALUES(NULL, '$id_admin', '$id_divisi_karyawan', '$id_detail_bpjs', '$id_gaji', '$gaji_utama')";
	
	mysqli_query($conn, $dch);
	return mysqli_affected_rows($conn);
}

$divisi = mysqli_query($conn, "SELECT * FROM divisi_karyawan");
$bpjs = mysqli_query($conn, "SELECT * FROM detail_bpjs INNER JOIN tabel_admin
						ON detail_bpjs.id_admin = tabel_admin.id_admin");
$admin = mysqli_query($conn, "SELECT * FROM tabel_admin");
$gaji = mysqli_query($conn, "SELECT * FROM data_gaji INNER JOIN tabel_admin
						ON data_gaji.id_admin = tabel_admin.id_admin");

$jenis_alert = "";
$alert = "";

if (isset($_POST['usernew'])) {
	if(tambahDetailKaryawan($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Tambah";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Tambah";
	}
}
if (isset($_POST['useredit'])) {
	if(ubahDetailKaryawan($_POST) > 0){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Ubah";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Ubah";
	}
}
if (isset($_POST['userdelete'])) {
	$dch = "DELETE FROM `detail_karyawan` WHERE `id_detail_karyawan`='".$_POST['id']."'";
	$hapus = mysqli_query($conn, $dch);
	// echo $dch;
	if($hapus){
		$_SESSION['sukses'] = true;
		$jenis_alert = "success";
		$alert = "Data Berhasil Di Hapus";
	}else{
		$gagal = true;
		$jenis_alert = "danger";
		$alert = "Data Gagal Di Hapus";
	}
}
 ?>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Master Detail Karyawan</h1>
		<a href="#" data-target="#exampleModal2"  data-toggle="modal" class="d-none d-sm-inline-block btn btn-sm btn-primary "><i class="fas fa-plus fa-sm text-white-50"></i>  Tambah Detail Karyawan</a>
	</div>

	<!-- Content Row -->
	<div class="card  ">
		<div class="card-header py-3">
			<h6 class="font-weight-bold text-primary">List Detail Karyawan</h6>

			<?php if (isset($_SESSION["sukses"])) : ?>
					<div class="alert alert-success" role="alert">Data Berhasil Ditambahkan</div>
					<?php unset($_SESSION["sukses"]);?>
			<?php endif;?>

			<!-- <?php if (isset($sukses) or isset($gagal)) : ?>
				<div class="alert alert-<?= $jenis_alert ?>" role="alert">
					<?= $alert ?>
				</div>
			<?php endif; ?> -->
		</div>
		<div class="card-body">
			<table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Divisi Karyawan</th>
						<th>BPJS</th>
						<th>Jumlah Gaji</th>
						<th>Gaji Utama</th>
						<th>Aksi</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>No</th>
						<th>Nama</th>
						<th>Divisi Karyawan</th>
						<th>BPJS</th>
						<th>Jumlah Gaji</th>
						<th>Gaji Utama</th>
						<th>Aksi</th>
					</tr>
				</tfoot>
				<tbody>
					<?php 
						$query = mysqli_query($conn, "SELECT * FROM detail_karyawan LEFT JOIN tabel_admin
												ON detail_karyawan.id_admin = tabel_admin.id_admin LEFT JOIN divisi_karyawan
												ON detail_karyawan.id_divisi_karyawan = divisi_karyawan.id_divisi_karyawan LEFT JOIN detail_bpjs
												ON detail_karyawan.id_detail_bpjs = detail_bpjs.id_detail_bpjs LEFT JOIN data_gaji
												ON detail_karyawan.id_gaji = data_gaji.id_gaji");

						$no = 1;
													
						foreach($query as $row) : ?>
						<tr>
							<td class="text-center"><?= $no++ ?></td>
							<td><?= $row['nama'] ?></td>
							<td><?= $row['divisi'] ?></td>
							<td><?= $row['no_peserta_bpjs'] ?></td>
							<td><?= rupiah($row['jumlah_gaji']) ?></td>
							<td><?= rupiah($row['gaji_utama']) ?></td>
							<td  class="d-flex justify-content-center">
								<div id="<?= $row['id_detail_karyawan'] ?>" data-target="#edit<?= $row['id_detail_karyawan'] ?>" data-toggle="modal" class="edit_data btn">
									<i class="fas fa-edit"></i>
								</div>
								<form action="" method="POST">
									<input id="" hidden type="text" class="" value="<?= $row['id_detail_karyawan'] ?>" name="id_detail_karyawan" placeholder="" required="required">
									<button type="button" class="btn" name="userdelete" data-target="#delete<?= $row['id_detail_karyawan'] ?>"  data-toggle="modal">
										<i class="fa fa-trash"></i>
									</button>
								</form>
							</td>
						</tr>

						<div class="modal fade" id="delete<?= $row['id_detail_karyawan']; ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
											<input id="" hidden type="text" class="" value="<?= $row['id_detail_karyawan']; ?>" name="id" placeholder="" required="required">
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

<!-- Modal Tambah -->
<div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
				<div class="modal-header">
					<h5 class="modal-title">Tambah Detail Karyawan</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="form-group">
						<label>Nama Karyawan</label>
						<div>
							<select class="form-control form-control-line" name="id_admin" id="id_admin" required>
								<option value="">- Pilih -</option>
								<?php foreach ($admin as $adm ) : ?>
									<option value="<?= $adm['id_admin'] ?>">
										<?= $adm['id_admin']?>: <?= $adm['nama']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>Divisi Karyawan</label>
						<div>
							<select class="form-control form-control-line" name="id_divisi_karyawan" id="id_divisi_karyawan" required>
								<option value="">- Pilih -</option>
								<?php foreach ($divisi as $div ) : ?>
									<option value="<?= $div['id_divisi_karyawan'] ?>">
										<?= $div['divisi']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>BPJS</label>
						<div>
							<select class="form-control form-control-line" name="id_detail_bpjs" id="id_detail_bpjs" required>
								<option value="">- Pilih -</option>
								<?php foreach ($bpjs as $bp ) : ?>
									<option value="<?= $bp['id_detail_bpjs'] ?>">
										<?= $bp['no_peserta_bpjs']?>: <?= $bp['nama']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>Gaji</label>
						<div>
							<select class="form-control form-control-line" name="id_gaji" id="id_gaji" required>
								<option value="">- Pilih -</option>
								<?php foreach ($gaji as $data ) : ?>
									<option value="<?= $data['id_gaji'] ?>">
										<?= rupiah($data['jumlah_gaji']) ?>: <?= $data['nama']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>Gaji Utama</label>
						<input type="number" name="gaji_utama" id="gaji_utama" class="form-control" placeholder="Rp. xxx.xxx">
					</div>
				</div>
				<div class="modal-footer">
					<button id="" name="usernew" type="submit" class="btn btn-primary">Tambah</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Akhir Modal Tambah -->

<?php foreach ($query as $id) : ?>
<!-- Modal Ubah -->
<div class="modal fade" id="edit<?= $id['id_detail_karyawan'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form action="" method="POST">
				<div class="modal-header">
					<h5 class="modal-title">Detail Karyawan</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h6 class="font-weight-bold text-primary">Ubah Detail Karyawan</h6>
					<div class="form-group">
						<label>Nama Karyawan</label>
						<div class="">
							<select class="form-control form-control-line" name="id_admin" id="id_admin" required>
								<option value="<?= $id['id_admin'] ?>">
										<?= $id['id_admin']?>: <?= $id['nama']?>
								</option>
								<?php foreach ($admin as $adm ) : ?>
									<option value="<?= $adm['id_admin'] ?>">
										<?= $adm['id_admin'] ?>: <?= $adm['nama']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<input id="" hidden type="text" class="" value="<?= $id['id_detail_karyawan'] ?>" name="id_detail_karyawan">
						<label>Divisi Karyawan</label>
						<div class="">
							<select class="form-control form-control-line" name="id_divisi_karyawan" id="id_divisi_karyawan" required>
								<option value="<?= $id['id_divisi_karyawan'] ?>">
										Divisi Saat Ini: <?= $id['divisi']?>
								</option>
								<?php foreach ($divisi as $div ) : ?>
									<option value="<?= $div['id_divisi_karyawan'] ?>">
										<?= $div['divisi']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>BPJS</label>
						<div class="">
							<select class="form-control form-control-line" name="id_detail_bpjs" id="id_detail_bpjs" required>
								<option value="<?= $id['id_detail_bpjs'] ?>">
										Data Saat Ini: <?= $id['nama'] ?>-<?= $id['no_peserta_bpjs']?>
								</option>
								<?php foreach ($bpjs as $data ) : ?>
									<option value="<?= $data['id_detail_bpjs'] ?>">
										<?= $data['no_peserta_bpjs']?>: <?= $data['nama']?>
									</option>
								<?php endforeach; ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="id_gaji">Gaji</label>
						<input value="<?= $id["id_gaji"]?>" type="hidden" class="form-control" name="id_gaji">
					</div>
					<div class="form-group">
						<label>Gaji Utama</label>
						<input type="number" name="gaji_utama" id="gaji_utama" class="form-control" value="<?= $id['gaji_utama']?>">
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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	if ( window.history.replaceState ) {
		window.history.replaceState( null, null, window.location.href );
	}
</script>