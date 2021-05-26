<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="css/sb-admin-2.css" rel="stylesheet">
	<style>
		h3, h4 {
		text-align: center;
		font-size: 18px;
	}
	.tgl {
		background-color: #05C8FE;
		color: #fff;
		font-weight: bold;
	}
	table {
		width: 100%;
	}
	td {
		padding: 10px;
	}
	.primary {
		background-color: #F8F8F8;
		font-weight: bold;
	}
	.hasil {
		border-top: 1px solid #97989B;
		font-weight: bold;
	}
	.sub {
		padding-left: 30px;
	}
	.top {
		font-weight: bold;
		margin-top: 20px;
		margin-bottom: 20px; 
	}
</style>
</head>

<body>

	<div class="top">
		<h3>PT. WIRA PURI PANCA</h3>
		<h3>LABA RUGI</h3>
		<h3><?php echo $waktu2; ?></h3>
		<h4>(dalam IDR)</h4>
	</div>
	
	<table>
		<tr class="tgl text-white">
			<td align="left">Tahun</td>
			<td align="right"><?php echo $waktu['year']; ?></td>
		</tr>
		<?php
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening IN (SELECT kode_rekening FROM `tabel_master` WHERE `subacct` LIKE 'Penjualan')");
		$row_umum=mysqli_fetch_array($qwr);
		$jml1 = $row_umum['jml'];
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening between '5101' and '5728'");
		$row_umum=mysqli_fetch_array($qwr);
		$jml2 = $row_umum['jml'];
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening IN (SELECT kode_rekening FROM `tabel_master` WHERE `subacct` LIKE 'Beban Penjua')");
		$row_umum=mysqli_fetch_array($qwr);
		$jml3 = $row_umum['jml'];
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening IN (SELECT kode_rekening FROM `tabel_master` WHERE `subacct` LIKE 'Beban Umum d')");
		$row_umum=mysqli_fetch_array($qwr);
		$jml4 = $row_umum['jml'];
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening IN (SELECT kode_rekening FROM `tabel_master` WHERE `subacct` LIKE 'Pendapatan L')");
		$row_umum=mysqli_fetch_array($qwr);
		$jml5 = $row_umum['jml'];
		$qwr=mysqli_query($conn,"select sum(rl_debet-rl_kredit) as jml from tabel_rugi_laba where kode_rekening IN (SELECT kode_rekening FROM `tabel_master` WHERE `subacct` LIKE 'Beban Lain-l')");
		$row_umum=mysqli_fetch_array($qwr);
		$jml6 = $row_umum['jml'];
		?>
		<tr class="primary">
			<td align="left">PENJUALAN</td>
			<td align="right"><?php echo "Rp. ".number_format($jml1,2,'.',','); ?></td>
		</tr>
		<tr class="primary">
			<td align="left">BEBAN POKOK PENJUALAN</td>
			<td align="right"><?php echo "Rp. ".number_format($jml2,2,'.',','); ?></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">LABA KOTOR</td>
			<td align="right"><?php echo "Rp. ".number_format($jml1+$jml2,2,'.',','); ?></td>
		</tr>
		
		<tr class="primary">
			<td align="left">BEBAN USAHA</td>
			<td align="right"></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">BEBAN PENJUALAN</td>
			<td align="right"><?php echo "Rp. ".number_format($jml3,2,'.',','); ?></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">BEBAN UMUM DAN ADMINISTRASI</td>
			<td align="right"><?php echo "Rp. ".number_format($jml4,2,'.',','); ?></td>
		</tr>
		<tr class="primary">
			<td align="left">JUMLAH BEBAN USAHA</td>
			<td align="right"><?php echo "Rp. ".number_format($jml3+$jml4,2,'.',','); ?></td>
		</tr>
		<tr class="primary">
			<td align="left">LABA (RUGI) USAHA</td>
			<td align="right"><?php echo "Rp. ".number_format(($jml1+$jml2)+($jml3+$jml4),2,'.',','); ?></td>
		</tr>
		<tr class="primary">
			<td align="left">PENGHASILAN (BEBAN) LAIN-LAIN</td>
			<td align="right"></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">PENDAPATAN LAIN-LAIN</td>
			<td align="right"><?php echo "Rp. ".number_format($jml5,2,'.',','); ?></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">BEBAN LAIN LAIN</td>
			<td align="right"><?php echo "Rp. ".number_format($jml6,2,'.',','); ?></td>
		</tr>
		<tr class="primary">
			<td align="left">JUMLAH PENDAPATAN (BEBAN) LAIN-LAIN</td>
			<td align="right"></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">LABA (RUGI) USAHA SEBELUM PAJAK</td>
			<td align="right"><?php echo "Rp. ".number_format($jml5+$jml6,2,'.',','); ?></td>
		</tr>
		<tr class="sub">
			<td class="sub" align="left">PAJAK PENGHASILAN</td>
			<td align="right">-</td>
		</tr>
		<tr class="hasil">
			<td align="left">LABA (RUGI) BERSIH</td>
			<td align="right"><?php echo number_format(($jml1+$jml2)+($jml3+$jml4)+($jml5+$jml6),2,'.',','); ?></td>
		</tr>
		

	</table>
</body>
</html>