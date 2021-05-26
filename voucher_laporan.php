<?php
include 'model/koneksi.php';
// if (isset($_GET['kode_sj'])) {
$qury = "SELECT jenis_transaksi, DATE_FORMAT(tanggal_transaksi, '%d %M %Y') as tanggal_transaksi FROM `tabel_transaksi` WHERE jenis_transaksi = '".$_GET['jenis']."' group by jenis_transaksi";
$qc = mysqli_query($conn, $qury);
$hasil = mysqli_fetch_array($qc);
$jenis_transaksi=$hasil['jenis_transaksi'];
$tanggal_transaksi=$hasil['tanggal_transaksi'];
if (strstr($jenis_transaksi, 'BKK')) {
	$jk = "Keluar";
	$jenis = "Kas";
} elseif (strstr($jenis_transaksi, 'BKM')) {
	$jk = "Masuk";
	$jenis = "Kas";
} elseif (strstr($jenis_transaksi, 'BBK')) {
	$jk = "Keluar";
	$jenis = "Bank";
} elseif (strstr($jenis_transaksi, 'BBM')) {
	$jk = "Masuk";
	$jenis = "Bank";
} elseif (strstr($jenis_transaksi, 'BMM')) {
	$jk = "-";
	$jenis = "-";
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Surat Voucher</title>

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
			<td width="50%" align="right"><h3>VOUCHER</h3></td>
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
			<td width="50%">Jakarta</td>
			<td width="50%"></td>
		</tr>
		<tr>
			<td width="50%">Nomor Voucher : <?php echo $jenis_transaksi; ?></td>
			<td></td>
		</tr>
		<tr>
			<td width="50%">Tanggal : <?php echo $tanggal_transaksi; ?></td>
			<td></td>
		</tr>
	</table>

	<table class="col-md-12" border="1">
		<thead>
			<tr>
				<th>No</th>
				<!-- <th>Tanggal</th> -->
				<th>Kode Rekening</th>
				<th>Nama</th>
				<th width="40%">Keterangan</th>
				<th width="20%">Debet</th>
				<th width="20%">Kredit</th>
				<th>Penanggung Jawab</th>
			</tr>
		</thead>
		
		<tbody>
			<?php
			$saldo = 0;
			$no = 0;
              // echo ;
			$result = mysqli_query($conn, "SELECT a.*, (select nama_rekening from tabel_master WHERE kode_rekening = a.kode_rekening) nama_rekening FROM `tabel_transaksi` a WHERE jenis_transaksi = '".$_GET['jenis']."' ORDER BY `id_transaksi` DESC");
			$kredittot = 0;
			$debettot = 0;
			while ($row = mysqli_fetch_array($result)) {
				$saldo+=$row['debet'];
				$saldo-=$row['kredit'];
				$debet=$row['debet'];
				$debettot+=$row['debet'];
				$kredittot+=$row['kredit'];
				$no++;
				$kredit=$row['kredit'];
				$id_transaksi=$row['id_transaksi'];
				echo "<tr>
				<td>$no</td>
				<td>$row[kode_rekening]</td>
				<td>$row[nama_rekening]</td>
				<td>".$row['keterangan_transaksi']."</td>
				<td align='right'>".number_format($debet,2,'.',',')."</td>
				<td align='right'>".number_format($kredit,2,'.',',')."</td>
				<td>".$row['penanggung']."</td>";
				?>
				<?php
				echo"</tr>";
			}
			?>
		</tbody>
		<tfoot>
			<tr>
				<td align="right" colspan="4">Total :</td>
				<td align="right"><?php echo number_format($debettot,2,'.',','); ?></td>
				<td align="right"><?php echo number_format($kredittot,2,'.',','); ?></td>
				<td></td>
				<td></td>
			</tr>
		</tfoot>
	</table>
	<br>
	<br>
	<br>
	<table class="ttd col-md-12" border="1">
		<tr>
			<td width="40%" valign="top"><p>Keterangan :</p></br></br></td>
			<td width="15%" valign="top"><p>Dibuat :</p></td>
			<td width="15%" valign="top"><p>Mengetahui :</p></td>
			<td width="15%" valign="top"><p>Menyetujui :</p></td>
			<td width="15%" valign="top"><p>Penanggung jawab :</p></td>
		</tr>
	</table>

	<?php echo '<p class="text-right">'.date('d M Y').'</p>'; ?>
</body>
</html>
<script type="text/javascript">
	window.print();
</script>
