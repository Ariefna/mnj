<?php
include 'model/koneksi.php';
if (isset($_GET['kode_sj'])) {
	$qury = "SELECT Nama, Kota, p.kodepl, DATE_FORMAT(s.tanggal, '%d %M %Y') as darek, kode_sp, Alamat FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj join produk b on d.id_produk=b.id_produk join pelanggan p on s.kodepl=p.kodepl join table_sp sp on s.id_sp=sp.id_sp WHERE kode_sj = '".$_GET['kode_sj']."'";
	// echo $qury;
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kodepl=$hasil['kodepl'];
	$nama=$hasil['Nama'];
	$kota=$hasil['Kota'];
	$tanggal=$hasil['darek'];
	$alamat=$hasil['Alamat'];
	$kode_sj = $_GET['kode_sj'];
	$kode_sp = $hasil['kode_sp'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Delivery Order</title>

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
				<td width="50%"><img height="90px" src="img/LOGO-MNJ2.jpg" alt=""></td>
				<td width="50%" align="right"><h3>Delivery Order</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT METATU NUSANTARA JAYA</td>
				<td width="50%"><br>Kepada Yth.</td>
			</tr>
			<tr>
				<td width="50%">Jl. Tambak Dalam Baru IB</td>
				<td width="50%"><?php echo $kodepl; ?> - <?php echo ucwords($nama); ?></td>
			</tr>
			<tr>
				<td width="50%">Surabaya</td>
				<td width="50%"><?php echo ucwords($alamat); ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Delivery Order : <?php echo $kode_sj; ?></td>
				<td><?php echo ucwords($kota); ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
				<td>Nomor Sales Order : <?php echo $kode_sp; ?></td>
			</tr>
		</table>

	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Kode Produk</th>
			<th>Nama Produk</th>
			<th>Qty</th>
		</tr>
		<?php
		$qury = "SELECT kode_produk, nama_produk, qty FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj join produk b on d.id_produk=b.id_produk WHERE kode_sj = '".$_GET['kode_sj']."'";

		$i = 0;
		$qc = mysqli_query($conn, $qury);
		$total=0;
		while ($hasil = mysqli_fetch_array($qc)) {

			if ($hasil['qty']!=0) {
				$i++;
				$total=$total+$hasil['qty'];
				echo '<tr>
				<td align="center">'.$i.'</td>
				<td align="center">'.$hasil['kode_produk'].'</td>
				<td>'.$hasil['nama_produk'].'</td>
				<td align="center">'.$hasil['qty'].'</td>
				</tr>';
			}

		}
		?>
		<tr>
			<td></td>
			<td></td>
			<td align="center">Total Qty</td>
			<td align="center"><b><?php echo $total; ?></b> </td>
		</tr>
	</table>
	<br>
	<br>
	<br>
	<table class="ttd col-md-12" border="1">
		<tr>
			<td width="40%" valign="top"><p>Keterangan :</p></br></br></td>
			<td width="15%" valign="top"><p>Dibuat :</p></td>
			<td width="15%" valign="top"><p>Mengetahui :</p></td>
			<td width="15%" valign="top"><p>Pengirim :</p></td>
			<td width="15%" valign="top"><p>Diterima :</p></td>
		</tr>
	</table>
</body>
</html>
<script type="text/javascript">
 window.print();
</script>
