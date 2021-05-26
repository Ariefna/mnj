<?php
include 'model/koneksi.php';
if (isset($_GET['kode_sp'])) {
	// $qury = "SELECT s.kodepl, zona, tempo, Nama, Kota, sales, diskon, DATE_FORMAT(tanggal, '%d %M %Y') as darek, alamat, kode_sp, keterangan FROM table_sp s join table_sp_detail d on s.id_sp=d.id_sp join table_buku b on d.id_buku=b.id_buku join pelanggan p on s.kodepl=p.kodepl WHERE s.id_sp=".$_GET['kode_sp'];
	$qury = "SELECT nopo,s.kodepl, tempo, Nama, Kota, diskon, DATE_FORMAT(tanggal, '%d %M %Y') as darek, alamat, kode_sp, keterangan FROM table_sp s join table_sp_detail d on s.id_sp=d.id_sp join produk b on d.id_produk=b.id_produk join pelanggan p on s.kodepl=p.kodepl WHERE s.id_sp=".$_GET['kode_sp'];
	// echo $qury;
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kode=$hasil['kodepl'];
	$nama=$hasil['Nama'];
	$kota=$hasil['Kota'];
	$termin=$hasil['tempo'];
	// $sales=$hasil['sales'];
	$diskon=$hasil['diskon'];
	$tanggal=$hasil['darek'];
	$nomor=$hasil['kode_sp'];
	$keterangan=$hasil['keterangan'];
	$alamat=$hasil['alamat'];
	$nopo=$hasil['nopo'];
	// $zona=$hasil['zona'];
	// $kodepl = $hasil['kodepl'];
	$kode_sp = $_GET['kode_sp'];
	// echo $qury;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Surat Pesanan</title>

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
			<td width="50%" align="right"><h3>SALES ORDER</h3></td>
		</tr>
		
		<tr>
			<td width="50%"><br>PT METATU NUSANTARA JAYA</td>
			<td width="50%"><br>Kode Pelanggan : <?php echo $kode; ?></td>
		</tr>
		<tr>
			<td width="50%">Jl. Tambak Dalam Baru IB</td>
			<td width="50%">Pelanggan : <?php echo ucwords($nama); ?></td>
		</tr>
		<tr>
			<td width="50%">Surabaya</td>
			<td width="50%">Alamat : <?php echo ucwords($alamat).', '.ucwords($kota); ?></td>
		</tr>
		<tr>
			<td width="50%">Nomor SO : <?php echo $nomor; ?></td>
			<td width="50%">Diskon : <?php echo $diskon; ?>%, Termin : <?php echo $termin; ?> Hari</td>
		</tr>
		<tr>
			<td width="50%">Tanggal : <?php echo $tanggal; ?></td>
			<td>Nomor PO : <?php echo $nopo; ?></td>
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
		$qury = "SELECT s.id_sp, ppn, b.kode_produk, b.nama_produk, harga, (a.total) as hargatot, qty, s.status, diskon, b.* FROM table_sp s join table_sp_detail a on s.id_sp=a.id_sp join produk b on a.id_produk = b.id_produk WHERE a.id_sp = ".$kode_sp;

		$i = 0;
		$qc = mysqli_query($conn, $qury);
		$total=0;
		$sum=0;
		$totalharga=0;
		$jum=0;
		$jumq=0;
		while ($hasil = mysqli_fetch_array($qc)) {

			if ($hasil['qty']!=0) {
				$i++;
				$total=$total+$hasil['qty'];
				// $totalharga += $hasil['hargatot'];

					$harga = $hasil['harga'];

				// $jum += $hasil['hargatot'];
				$jum += ($hasil['qty']*$harga);
				$jumq += $hasil['qty'];
				// $jumt = $hasil['hargatot'];
				$diskon = $hasil['diskon'];
				$ppn = $hasil['ppn'];
				echo '<tr>
				<td align="center">'.$i.'</td>
				<td align="center">'.$hasil['kode_produk'].'</td>
				<td>'.$hasil['nama_produk'].'</td>
				<td align="center">'.$hasil['qty'].'</td>
				<td align="right">'.number_format($harga,2,',','.').'</td>
				<td align="right">'.number_format($hasil['hargatot'],2,',','.').'</td>
				</tr>';
			}

		}
		?>
		<tr>
			<td></td>
			<td></td>
			<td align="center">Total Qty</td>
			<td align="center"><b><?php echo $jumq; ?></b> </td>
			<td></td>
			<td align="right"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td align="center"></td>
			<td align="center" </td>
				<td>Brutto (Rp)</td>
				<td align="right"><?php echo number_format($jum,2,',','.'); ?></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Diskon (Rp)</td>
				<td align="right">-<?php echo number_format($jum*$diskon/100,2,',','.'); ?></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>PPN (Rp)</td>
				<td align="right"><?php echo number_format($ppn,2,',','.'); ?></td>
			</tr>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td>Netto (Rp)</td>
				<td align="right"><?php echo number_format($jum-($jum*$diskon/100)+$ppn,2,',','.'); ?></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<table class="ttd col-md-12" border="1">
			<tr>
				<td width="40%" valign="top"><p>Keterangan :</p>
					<p><?php echo $keterangan; ?></p> </br></br></td>
					<td width="15%" valign="top"><p>Dibuat :</p></td>
					<td width="15%" valign="top"><p>Disetujui :</p></td>
				</tr>
			</table>
		</body>
		</html>
		<script type="text/javascript">
			window.print();
		</script>
