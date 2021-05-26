<?php
include 'model/koneksi.php';
if (isset($_GET['kodepl'])) {
	$qury = "SELECT * FROM pelanggan WHERE kodepl='".$_GET['kodepl']."'";
  // echo $qury;
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$kode=$hasil['kodepl'];
	$nama=$hasil['Nama'];
	$kota=$hasil['Kota'];
	$alamat=$hasil['Alamat'];
	$saldow=$hasil['saldo'];
	// $kodepl = $hasil['kodepl'];
	$kodepl = $_GET['kodepl'];
	// echo $qury;
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Kartu Piutang</title>

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
			<td width="50%" align="right"><h3>KARTU PIUTANG</h3></td>
		</tr>
		<tr>
			<td width="50%"><br>PT PURI PANCA PUJI BANGUN</td>
			<td width="50%"><br>Pelanggan : <?php echo $kode.' - '.ucwords($nama); ?></td>
		</tr>
		<tr>
			<td width="50%">Jl. Mastrip No. 70, Karang Pilang</td>
			<td width="50%">Alamat : <?php echo ucwords($alamat).', '.ucwords($kota); ?></td>
		</tr>
		<tr>
			<td width="50%">Surabaya</td>
			<td width="50%">Saldo : <?php echo number_format($saldow,2,',','.') ?></td>
		</tr>
	</table>
	<table class="col-md-12" border="1">
		<tr>
			<th>No</th>
			<th>Tanggal</th>
			<th>Transaksi</th>
			<th>Debet (Rp)</th>
			<th>Kredit (Rp)</th>
			<th>Saldo (Rp)</th>
		</tr>
		<?php
		$qury = "SELECT *, b.Nama FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.kodepl = '".$_GET['kodepl']."' ORDER by `kodepiutang` DESC";
		$i = 0;
		$qc = mysqli_query($conn, $qury);
		$debet=0;
		$kredit=0;
		$saldo=0;
		$total=0;
		while ($hasil = mysqli_fetch_array($qc)) {
			$debet+=$hasil['debet'];
			$kredit+=$hasil['kredit'];
			// if ($hasil['debet']!=0) {
			// 	$saldo=$hasil['saldo']+$hasil['debet'];
			// } elseif ($hasil['debet']==0) {
			// 	$saldo=$hasil['saldo']-$hasil['kredit'];
			// }
			$saldo+=$hasil['debet'];
			$saldo-=$hasil['kredit'];
			$total+=$saldo;
			$i++;
			echo '<tr>
			<td align="center">'.$i.'</td>
			<td align="center">'.$hasil['tanggal'].'</td>
			<td>'.$hasil['keterangan'].'</td>
			<td align="right">'.number_format($hasil['debet'],2,',','.').'</td>
			<td align="right">'.number_format($hasil['kredit'],2,',','.').'</td>
			<td align="right">'.number_format($saldo,2,',','.').'</td>
			</tr>';
		}
		?>
		<tr>
			<td align="center" colspan="3">Total (Rp)</td>
			<td align="right"><b><?php echo number_format($debet,2,',','.'); ?></b> </td>
			<td align="right"><b><?php echo number_format($kredit,2,',','.'); ?></b> </td>
			<td align="right"><b><?php echo number_format($saldo,2,',','.'); ?></b> </td>
		</tr>
	</table>
	<br>
</body>
</html>
<script type="text/javascript">
	window.print();
</script>
