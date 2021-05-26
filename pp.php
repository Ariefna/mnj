<?php
include 'model/koneksi.php';
if (isset($_GET['kode_pp'])) {
		$qury = "SELECT * FROM `table_pp` where kode_pp = '".$_GET['kode_pp']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kode_pp = $hasil['kode_pp'];
	$sts = $hasil['status'];
	$id_pp = $hasil['id_pp'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Penerimaan Produk</title>

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
				<td width="50%"><img height="90px" src="img/lentera.png" alt=""></td>
				<td width="50%" align="right"><h3>PENERIMAAN PRODUK</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT SUMBERSOLUSIINDO HITECH</td>
				<!-- <td width="50%"><br>Kepada Yth.</td> -->
			</tr>
			<tr>
				<td width="50%">Jl.K.H.Moch. Mansyur</td>
			</tr>
			<tr>
				<td width="50%">Jakarta</td>
			</tr>
			<tr>
				<td width="50%">Nomor Penerimaan Barang : <?php echo $kode_pp; ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
			</tr>
		</table>

	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Kode Produk</th>
			<th>Nama Produk</th>
			<th>Nama Penghasil</th>
			<th>Qty</th>
		</tr>
		<?php
		$qury = "SELECT *, (SELECT Nama FROM `supplier` where kodesup = a.kodesup) Namasup FROM `table_pp_detail` a join produk b on a.id_produk = b.id_produk join table_pp c on c.id_pp = a.id_pp WHERE a.id_pp = '".$id_pp."' GROUP by a.id_produk";
		// echo $qury;
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
				<td>'.$hasil['Namasup'].'</td>
				<td align="center">'.$hasil['qty'].'</td>
				</tr>';
			}

		}
		?>
		<tr>
			<td colspan="4" align="center">Total Qty</td>
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
