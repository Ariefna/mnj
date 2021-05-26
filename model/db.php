<?php 
function Insert_tabel_master($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}
function Insert_jurnal_keluar($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_keluar` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function Insert_jurnal_umum($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_umum` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function Insert_tabel_admin($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `tanggal`) VALUES (NULL, '', '', '', '')");
	return $result;
}
function Insert_profil_perusahaan($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_profil_perusahaan` (`nama_perusahaan`, `gedung`, `jalan`, `kelurahan`, `kecamatan`, `propinsi`, `negara`, `telpon`, `fax`, `email`, `website`) VALUES ('', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}
function drop_tabel_master()
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}
function drop_jurnal_keluar()
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_keluar` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function drop_jurnal_umum()
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_umum` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function drop_tabel_admin()
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `tanggal`) VALUES (NULL, '', '', '', '')");
	return $result;
}
function drop_profil_perusahaan()
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_profil_perusahaan` (`nama_perusahaan`, `gedung`, `jalan`, `kelurahan`, `kecamatan`, `propinsi`, `negara`, `telpon`, `fax`, `email`, `website`) VALUES ('', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}

function delete_tabel_master($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}
function delete_jurnal_keluar($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_keluar` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function delete_jurnal_umum($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `jurnal_umum` (`nomor_jurnal`, `kode_transaksi`, `tanggal_selesai`) VALUES ('', '', '')");
	return $result;
}
function delete_tabel_admin($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_admin` (`id_admin`, `nama`, `username`, `password`, `tanggal`) VALUES (NULL, '', '', '', '')");
	return $result;
}
function delete_profil_perusahaan($conn, $value1)
{
	$result = mysqli_query($conn ,"DELETE FROM `tabel_profil_perusahaan` WHERE 0");
	return $result;
}
function update_tabel_master($conn, $value1)
{
	$result = mysqli_query($conn ,"INSERT INTO `tabel_master` (`kode_rekening`, `nama_rekening`, `tanggal_awal`, `awal_debet`, `awal_kredit`, `mut_debet`, `mut_kredit`, `sisa_debet`, `sisa_kredit`, `rl_debet`, `rl_kredit`, `nrc_debet`, `nrc_kredit`, `posisi`, `normal`) VALUES ('', '', '', '', '', '', '', '', '', '', '', '', '', '', '')");
	return $result;
}
function update_jurnal_keluar($conn, $value1)
{
	$result = mysqli_query($conn ,"UPDATE `jurnal_keluar` SET `nomor_jurnal` = '11', `kode_transaksi` = 'KK/11', `tanggal_selesai` = '03/12/20101' WHERE `jurnal_keluar`.`nomor_jurnal` = 1");
	return $result;
}
function update_jurnal_umum($conn, $value1)
{
	$result = mysqli_query($conn ,"UPDATE `jurnal_umum` SET `nomor_jurnal` = '1a', `kode_transaksi` = 'BU/1a', `tanggal_selesai` = '03/12/2010a' WHERE `jurnal_umum`.`nomor_jurnal` = 1");
	return $result;
}
function update_tabel_admin($conn, $value1)
{
	$result = mysqli_query($conn ,"UPDATE `tabel_admin` SET `id_admin` = '1a', `nama` = 'Agus Sumarnaa', `username` = 'agusa', `password` = 'fdf169558242ee051cca1479770ebac3a', `tanggal` = '2010-12-04 14:06:06a' WHERE `tabel_admin`.`id_admin` = 1");
	return $result;
}
function update_profil_perusahaan($conn, $value1)
{
	$result = mysqli_query($conn ,"UPDATE `tabel_profil_perusahaan` SET `nama_perusahaan`='',`gedung`='',`jalan`='',`kelurahan`='',`kecamatan`='',`propinsi`='',`negara`='',`telpon`='',`fax`='',`email`='',`website`='' WHERE 1");
	return $result;
}


function select_tabel_master($conn, $text)
{
	if ($text == 'kas') {
		$result = mysqli_query($conn ,"select * from tabel_master where option = 1 order by kode_rekening asc");
	}else {
		$result = mysqli_query($conn ,"select * from tabel_master where option = 2 order by kode_rekening asc");
	}
	return $result;
}
function select_tabel_master_hitung($conn, $text)
{
	if ($text == 'kas') {
		$result = mysqli_query($conn ,"select sum(awal_debet) as tot_awal_debet,sum(awal_kredit) as tot_awal_kredit from tabel_master where option = 1 order by kode_rekening asc");
	}else {
		$result = mysqli_query($conn ,"select sum(awal_debet) as tot_awal_debet,sum(awal_kredit) as tot_awal_kredit from tabel_master  where option = 2 order by kode_rekening asc");
	}
	
	return $result;
}
function select_jurnal_keluar($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `jurnal_keluar`");
	return $result;
}
function select_jurnal_umum($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `jurnal_umum`");
	return $result;
}
function select_tabel_admin($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `tabel_admin`");
	return $result;
}
function select_profil_perusahaan($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `profil_perusahaan`");
	return $result;
}
function select_tabel_transaksi($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `tabel_transaksi` ORDER by `id_transaksi` DESC");
	return $result;
}
function select_tabel_transaksi_kk($conn)
{
	$result = mysqli_query($conn ,"SELECT * FROM `tabel_transaksi` where kode_transaksi like '%KK%' ORDER by `id_transaksi` DESC");
	return $result;
}
function validate($conn, $result, $hasil)
{
	if ($result) 
	{ 
		$jenis_alert = "success";
		$alert = "";
	}  
	else 
	{ 
		$jenis_alert = "danger";
		$alert = "";
	}
}
function cutText($text, $length, $mode = 2, $bol = "false")
{
	if (strlen($text) > 39) {
		$bol = "true";
	}
	if ($mode != 1)
	{
		$char = $text($length - 1);
		switch($mode)
		{
			case 2: 
			while($char != ' ') {
				$char = $text(--$length);
			}
			case 3:
			while($char != ' ') {
				$char = $text(++$num_char);
			}
		}
	}
	if ($bol == "true") {
		$gogo = substr($text, 0, $length)."...";
	}
	else{
		$gogo = $text;
	}
	return $gogo;
}
function penyesuaian($conn, $id, $hasil = "")
{
	$id2=0;
	if($id % 2 == 0){
		$id2 = $id - 1;
		$temp = $id;
		$id = $id2;
		$id2 = $temp;
	}else {
		$id2 = $id + 1;
	}
	$result = mysqli_query($conn ,"SELECT keterangan_transaksi, debet, kredit,sum(debet-kredit) as 'hasil' FROM `tabel_transaksi` WHERE id_transaksi BETWEEN ".$id." AND ".$id2." GROUP by keterangan_transaksi HAVING sum(debet-kredit) = 0");
	$rowcount = mysqli_num_rows($result);
	if ($rowcount == 1) {
		$hasil = "text-grey";
		// mysqli_query($conn ,"UPDATE `tabel_transaksi` SET `tanggal_posting` = '2019-03-22', `keterangan_posting` = 'Post' WHERE id_transaksi = ".$id." OR ".$id2);
	}else {
		$hasil = "text-danger";
	}
	return $hasil;
}
?>