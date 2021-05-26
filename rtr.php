<?php
include 'model/koneksi.php';
if (isset($_GET['kode_rt'])) {
	$qury = "SELECT p.kodepl, Nama, r.kode_inv, r.kode_sj, r.kode_sp, Kota, Alamat, diskon, DATE_FORMAT(s.tanggal, '%d %M %Y') as darek FROM table_kodesj k join table_sj s on k.id_sj=s.id_sj join table_sj_detail d on s.id_sj=d.id_sj join produk b on d.id_produk=b.id_produk join pelanggan p on s.kodepl=p.kodepl join table_sp t on s.id_sp=t.id_sp join retur r on r.kode_sj = k.kode_sj WHERE r.kode_rt = '".$_GET['kode_rt']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$nama=$hasil['Nama'];
	$kodepl=$hasil['kodepl'];
	$kota=$hasil['Kota'];
	$diskon=$hasil['diskon'];
	$tanggal=$hasil['darek'];
	$nomor=$hasil['kode_inv'];
	$alamat=$hasil['Alamat'];
	$kode_sj =$hasil['kode_sj'];
	$kode_rt = $_GET['kode_rt'];
	$kode_sp = $hasil['kode_sp'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Retur Penjualan</title>

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
				<td width="50%" align="right"><h3>RETUR PENJUALAN</h3></td>
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
				<td width="50%">Nomor Retur : <?php echo $kode_rt; ?></td>
				<td width="50%">Nomor Surat Pesanan : <?php echo $kode_sp; ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Invoice : <?php echo $nomor; ?></td>
				<td width="50%">Nomor Surat Jalan : <?php echo $kode_sj; ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo $tanggal; ?></td>
				<td width="50%"></td>
			</tr>
		</table>

	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Kode Buku</th>
			<th>Judul Buku</th>
			<th>Qty</th>
			<th>Harga (Rp)</th>
			<th>Total (Rp)</th>
		</tr>
		<?php
		$qury = "SELECT kode_produk, nama_produk, qty, harga_produk, (qty*harga_produk) sum FROM retur r join retur_detail rd on r.id_rt=rd.id_retur join produk b on rd.id_produk=b.id_produk WHERE kode_rt = '".$kode_rt."'";
		$i = 0;
		$qc = mysqli_query($conn, $qury);
		$total=0;
		$sum=0;
		$totalharga=0;
		while ($hasil = mysqli_fetch_array($qc)) {

			if ($hasil['qty']!=0) {
				$i++;
				$total=$total+$hasil['qty'];
				$totalharga=$totalharga+$sum;
				echo '<tr>
				<td align="center">'.$i.'</td>
				<td align="center">'.$hasil['kode_produk'].'</td>
				<td>'.$hasil['nama_produk'].'</td>
				<td align="center">'.$hasil['qty'].'</td>
				<td align="center">'.number_format($hasil['harga_produk'],2,',','.').'</td>
				<td align="right">'.number_format($hasil['sum'],2,',','.').'</td>
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
			<td>Netto (Rp)</td>
			<td align="right"><?php echo number_format($totalharga-($totalharga*($diskon/100)),2,',','.'); ?></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td>Inc. PPN 10%</td>
			<td align="right">0</td>
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
 // window.print();
</script>
