<?php
include 'model/koneksi.php';
if (isset($_GET['kode_pem'])) {
	$qury = "SELECT nama_rekening, nama, alamat, kota, kode_pem, pem.kodepl, tanggal, kode_inv, metode, bank, total_pem, keterangan FROM pembayaran pem join pelanggan pel on pem.kodepl=pel.kodepl join tabel_master tm on pem.bank=tm.kode_rekening WHERE kode_pem = '".$_GET['kode_pem']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$nama=$hasil['kode_pem'];
	$kodepl=$hasil['kodepl'];
	$tanggal=$hasil['tanggal'];
	$kode_inv=$hasil['kode_inv'];
	$metode=$hasil['metode'];
	if ($hasil['metode']==1) {
		$jenis="Kas";
	} elseif ($hasil['metode']==2) {
		$jenis="Bank";
	}
	$bank=$hasil['bank'];
	$nama_rekening=$hasil['nama_rekening'];
	$total_pem=$hasil['total_pem'];
	$keterangan=$hasil['keterangan'];
	$nama=$hasil['nama'];
	$alamat=$hasil['alamat'];
	$kota=$hasil['kota'];
	// $kodepl = $hasil['kodepl'];
	$kode_pem = $_GET['kode_pem'];
	// echo $qury;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Pembayaran</title>

	<link href="css/sb-admin-2.css" rel="stylesheet">
	<style>
		.ttd {
			height: 80px;
		}
		table .tdd td{
			vertical-align:text-top;
		}
		table tr:hover{
			background: #fff !important;
		}
		* {
			color : black;
			font-family: "Times New Roman", Times, serif;
			font-size: 20px;
		}
	</style>
</head>
<body>
	<table width="100%">
			<tr>
				<td width="50%"><img height="100px" src="img/lentera.png" alt=""></td>
				<td width="50%" align="right"><h3>PEMBAYARAN</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT PURI PANCA PUJI BANGUN</td>
				<td width="50%"><br>Pelanggan : <?php echo ucwords($kodepl).' - '.ucwords($nama); ?></td>
			</tr>
			<tr>
				<td width="50%">Jl. Mastrip No. 70, Karang Pilang</td>
				<td width="50%"><?php echo ucwords($alamat).', '.ucwords($kota); ?></td>
			</tr>
			<tr>
				<td width="50%">Surabaya</td>
				<td width="50%">No. Kuitansi : </td>
			</tr>
			<tr>
				<td width="50%">Nomor Pembayaran : <?php echo $kode_pem; ?></td>
				<td width="50%">Jenis Pembayaran : <?php echo $jenis.' ('.$bank.', '.$nama_rekening.')'; ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Invoice : <?php echo $kode_inv; ?></td>
				<td width="50%">Total Pembayaran : Rp.<?php echo number_format($total_pem,2,',','.'); ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo $tanggal; ?></td>
				<td width="50%"></td>
			</tr>
		</table>
		<br>
	<table class="ttd col-md-12" border="1">
		<tr>
			<td width="40%" valign="top"><p>Keterangan : <?php echo $keterangan; ?></p></br></br></td>
			<td width="15%" valign="top"><p>Dibuat :</p></td>
			<td width="15%" valign="top"><p>Mengetahui :</p></td>
			<td width="15%" valign="top"><p>Pengirim :</p></td>
			<td width="15%" valign="top"><p>Diterima :</p></td>
		</tr>
	</table>
</body>
</html>
<script type="text/javascript">
 // window.print();
</script>
