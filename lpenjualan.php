<?php
include 'model/koneksi.php';
if (isset($_GET['awal'])) {
	$awal=date_create($_GET['awal']);
	$akhir=date_create($_GET['akhir']);
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Laporan Penjualan</title>

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
			<td width="50%" align="right"><h3>LAPORAN PENJUALAN</h3></td>
		</tr>
		<tr>
			<td width="50%"><br>PT PURI PANCA PUJI BANGUN</td>
			<td width="50%"><br>Tanggal Awal : <?php echo date_format($awal,'d F Y'); ?></td>
		</tr>
		<tr>
			<td width="50%">Jl. Mastrip No. 70, Karang Pilang</td>
			<td width="50%">Tanggal Akhir : <?php echo date_format($akhir,'d F Y'); ?></td>
		</tr>
		<tr>
			<td width="50%">Surabaya</td>
			<!-- <td width="50%"></td> -->
		</tr>
		<tr>
			<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
			<!-- <td width="50%"></td> -->
		</tr>

	</table>

	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Tanggal</th>
			<th>Kode Invoice</th>
			<th>KTP</th>
			<th>Nama Pelanggan</th>
			<th>Penjualan (Rp)</th>
			<th>Diskon</th>
			<th>Retur</th>
			<th>Bruto</th>
		</tr>
		<?php

		$djndn = "SELECT nama, ktp, a.id_sj, kode_inv, f.diskon, kode_sj, sum(total) as ff, f.kodepl, DATE_FORMAT(b.tanggal, '%d %M %Y') as tanggal, sum(a.qty) as jml FROM table_kodesj k join table_sj_detail a on k.id_sj=a.id_sj join table_sj b on a.id_sj = b.id_sj join table_sp f on b.id_sp = f.id_sp join pelanggan p on p.kodepl=b.kodepl where b.tanggal BETWEEN '".$_GET['awal']."' AND '".$_GET['akhir']."' group by a.id_sj order by kode_sj desc";
										// echo $djndn;
		$dj = mysqli_query($conn, $djndn);
		$i=1;
		$grand=0;
		while ($jdbvj = mysqli_fetch_array($dj)) {
		$grand+=$jdbvj['ff'];
			// if ($jdbvj['jml']!=0) {
				echo '<tr>
				<td align="center">'.$i.'</td>
				<td align="center">'.$jdbvj['tanggal'].'</td>
				<td align="center">'.$jdbvj['kode_inv'].'</td>
				<td align="center">'.$jdbvj['ktp'].'</td>
				<td>'.$jdbvj['nama'].'</td>
				<td align="center">'.number_format($jdbvj['ff'],2,',','.').'</td>
				<td align="center">'.$jdbvj['diskon'].'</td>
				<td align="center">0</td>
				<td align="center">0</td>
				</tr>';
				$i++;
			// }

		}

		?>
	</table>

	<br>
	<table width="100%">
		<tr>
			<td width="50%"></td>
			<td width="50%" align="right">Total Penjualan (Rp) : <?php echo number_format($grand,2,',','.'); ?></td>
		</tr>
		<tr>
			<td width="50%"></td>
			<td width="50%" align="right">Total Retur (Rp) : <?php echo 0; ?></td>
		</tr>
		<tr>
			<td width="50%"></td>
			<td width="50%" align="right">Total Bruto (Rp) : <?php echo 0; ?></td>
		</tr>
	</table>
	<!--
	<table class="ttd col-md-12" border="1">
		<tr>
			<td width="40%" valign="top"><p>Keterangan :</p></br></br></td>
			<td width="15%" valign="top"><p>Dibuat :</p></td>
			<td width="15%" valign="top"><p>Mengetahui :</p></td>
			<td width="15%" valign="top"><p>Pengirim :</p></td>
			<td width="15%" valign="top"><p>Diterima :</p></td>
		</tr>
	</table> -->
</body>
</html>
