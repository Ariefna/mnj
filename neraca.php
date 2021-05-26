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
		<h3>NERACA</h3>
		<h3><?php echo $waktu2; ?></h3>
		<h4>(dalam IDR)</h4>
	</div>
	<div class="row">
<table width="100%">
		<tr class="tgl text-white">
			<td align="left">Tahun</td>
			<td align="right"><?php echo $waktu['year']; ?></td>
		</tr>

		<tr class="primary">
			<td align="left">AKTIVA</td>
			<td align="right"></td>
		</tr>
		<?php
		$penjualan=mysqli_query($conn,"select *, (nrc_debet-nrc_kredit) as jml from tabel_neraca WHERE KODE_REKENING BETWEEN '1101.01.09' AND '1706.51.09' having not (nrc_debet-nrc_kredit) = 0");
		while($row_umum=mysqli_fetch_array($penjualan)){
			?>
			<tr class="sub">
				<td class="sub" align="left"><?php echo $row_umum['nama_rekening'];?></td>
				<td align="right"><?php echo number_format($row_umum['jml'],2,'.',','); ?></td>
			</tr>
			<?php
		}
		?>
		
		<?php
		$shu_berjalan=mysqli_fetch_array(mysqli_query($conn,"SELECT sum(nrc_debet-nrc_kredit) FROM `tabel_neraca` WHERE KODE_REKENING BETWEEN '1101.01.09' AND '1706.51.09'"));
		?>
		<tr class="hasil">
			<td align="left">Jumlah Aktiva</td>
			<td align="right"><?php echo number_format($shu_berjalan[0],2,'.',','); ?></td>
		</tr>

	</table>
	<table width="100%">
		<!-- <tr class="tgl text-white">
			<td align="left">Tahun</td>
			<td align="right"><?php  ?></td>
		</tr> -->

		<tr class="primary">
			<td align="left">PASIVA</td>
			<td align="right"></td>
		</tr>
		<?php
		$penjualan=mysqli_query($conn,"select *, (nrc_debet-nrc_kredit) as jml from tabel_neraca WHERE KODE_REKENING BETWEEN '2101.01.09' AND '3402.01.09' having not (nrc_debet-nrc_kredit) = 0");
		while($row_umum=mysqli_fetch_array($penjualan)){
			?>
			<tr class="sub">
				<td class="sub" align="left"><?php echo $row_umum['nama_rekening'];?></td>
				<td align="right"><?php echo number_format($row_umum['jml'],2,'.',','); ?></td>
			</tr>
			<?php
		}
		?>
		
		<?php
		$shu_berjalan=mysqli_fetch_array(mysqli_query($conn,"SELECT sum(nrc_debet-nrc_kredit) FROM `tabel_neraca` WHERE KODE_REKENING BETWEEN '2101.01.09' AND '3402.01.09'"));
		?>
		<tr class="hasil">
			<td align="left">Jumlah Pasiva</td>
			<td align="right"><?php echo number_format($shu_berjalan[0],2,'.',','); ?></td>
		</tr>

	</table>
	</div>
	
</body>
</html>