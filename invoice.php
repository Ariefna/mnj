<?php
include 'model/koneksi.php';
if (isset($_GET['kode_sj'])) {
	$qury = "SELECT p.kodepl, ppn, Nama, kode_inv, kode_sp, Kota, Alamat, diskon, DATE_FORMAT(s.tanggal, '%d %M %Y') as darek FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj join pelanggan p on s.kodepl=p.kodepl join table_sp t on s.id_sp=t.id_sp WHERE kode_sj = '".$_GET['kode_sj']."'";
	// echo $qury;
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$nama=$hasil['Nama'];
	$kodepl=$hasil['kodepl'];
	$kota=$hasil['Kota'];
	$diskon=$hasil['diskon'];
	$tanggal=$hasil['darek'];
	$nomor=$hasil['kode_inv'];
	$alamat=$hasil['Alamat'];
	$ppn=$hasil['ppn'];
	// $kodepl = $hasil['kodepl'];
	$kode_sj = $_GET['kode_sj'];
	$kode_sp = $hasil['kode_sp'];
	// echo $qury;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Surat invoice</title>

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
				<td width="50%" align="right"><h3>INVOICE</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT SUMBERSOLUSIINDO HITECH</td>
				<td width="50%"><br>Pelanggan : <?php echo ucwords($kodepl).' - '.ucwords($nama); ?></td>
			</tr>
			<tr>
				<td width="50%">Jl.K.H.Moch. Mansyur</td>
				<td width="50%"><?php echo ucwords($alamat).', '.ucwords($kota); ?></td>
			</tr>
			<tr>
				<td width="50%">Jakarta</td>
				<td width="50%">Rabat : <?php echo $diskon; ?> %</td>
			</tr>
			<tr>
				<td width="50%">Nomor Invoice : <?php echo $nomor; ?></td>
				<td width="50%">Nomor Sales Order : <?php echo $kode_sp; ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
				<td width="50%">Nomor Delivery Order : <?php echo $kode_sj; ?></td>
			</tr>
		</table>

	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Kode Produk</th>
			<th>Nama Produk</th>
			<th>Qty</th>
			<th>Harga (Rp)</th>
			<th>Total (Rp)</th>
		</tr>
		<?php
		$qury = "SELECT kode_produk, nama_produk, qty, d.harga as hargas FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj join produk b on d.id_produk=b.id_produk WHERE kode_sj = '".$_GET['kode_sj']."'";
		$i = 0;
		$qc = mysqli_query($conn, $qury);
		$total=0;
		$sum=0;
		$totalharga=0;
		while ($hasil = mysqli_fetch_array($qc)) {

			if ($hasil['qty']!=0) {
				$i++;
				$total=$total+$hasil['qty'];
				$sum=$hasil['hargas']*$hasil['qty'];
				$totalharga=$totalharga+$sum;
				echo '<tr>
				<td align="center">'.$i.'</td>
				<td align="center">'.$hasil['kode_produk'].'</td>
				<td>'.$hasil['nama_produk'].'</td>
				<td align="center">'.$hasil['qty'].'</td>
				<td align="center">'.number_format($hasil['hargas'],2,',','.').'</td>
				<td align="right">'.number_format($sum,2,',','.').'</td>
				</tr>';
			}

		}
		?>
		<tr>
			<td></td>
			<td></td>
			<td align="center">Total Qty</td>
			<td align="center"><b><?php echo $total; ?></b> </td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Brutto (Rp)</td>
			<td align="right"><?php echo number_format($totalharga,2,',','.'); ?></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Rabat (Rp)</td>
			<td align="right">-<?php echo number_format($totalharga*($diskon/100),2,',','.'); ?></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>PPN (Rp)</td>
			<td align="right"><?php echo number_format(($ppn),2,',','.'); ?></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Netto (Rp)</td>
			<td align="right"><?php echo number_format(($totalharga+$ppn),2,',','.'); ?></td>
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
