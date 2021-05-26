<?php
include 'model/koneksi.php';
if (isset($_GET['kode'])) {
	$qury = "SELECT kode_inv, tk.id_tk, kode_proyek, alamat, kota, nama, tk.sales, tk.kodepl, DATE_FORMAT(tk.tanggal, '%d %M %Y') as darek from penyelesaian_tk tk join pelanggan p on tk.kodepl=p.kodepl join tugas_kerja ke on tk.id_tk=ke.id_tk join table_kodesj ts on tk.kode=ts.kode_tk WHERE kode = '".$_GET['kode']."'";
	// echo $qury;
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$nama=$hasil['nama'];
	$kodepl=$hasil['kodepl'];
	$kota=$hasil['kota'];
	$sales=$hasil['sales'];
	$diskon=0;
	$tanggal=$hasil['darek'];
	$nomor=$hasil['kode_inv'];
	$alamat=$hasil['alamat'];
	$id_tk = $hasil['id_tk'];
	$kode = $_GET['kode'];
	$kode_proyek = $hasil['kode_proyek'];
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
				<td width="50%"><img height="100px" src="img/lentera.png" alt=""></td>
				<td width="50%" align="right"><h3>INVOICE TUGAS KERJA</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT PURI PANCA PUJI BANGUN</td>
				<td width="50%"><br>Pelanggan : <?php echo ucwords($kodepl).' - '.ucwords($nama); ?></td>
			</tr>
			<tr>
				<td width="50%">Jl. Mastrip No. 70, Karang Pilang</td>
				<td width="50%"><?php echo ucwords($alamat).', '.ucwords($kota); ?></td>
			</tr>
			<tr>
				<td width="50%">Surabaya</td>
				<td width="50%">Rabat : <?php echo $diskon; ?> %, Sales : <?php echo ucwords($sales); ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Invoice : <?php echo $nomor; ?></td>
				<td width="50%">Nomor Tugas Kerja : <?php echo $kode_proyek; ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
				<td width="50%">Nomor Penyelesaian : <?php echo $kode; ?></td>
			</tr>
		</table>

	<table class="col-md-12" border="1">
    <tr>
      <th width="55%">Nama Barang</th>
      <th width="15%">Qty</th>
      <th width="15%">Harga (Rp)</th>
      <th width="15%">Total (Rp)</th>
    </tr>
    <?php
    $totalan=0;
    $totqty=0;
    $sql = "SELECT * FROM tk_penjualan where id_tk='".$id_tk."'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($result)) {
      $total=$row['qty']*$row['harga'];
      $totalan=$total+$totalan;
      $totqty=$totqty+$row['qty'];
      echo '<tr>
      <td>'.$row['nama_barang'].'</td>
      <td align="center">'.$row['qty'].'</td>
      <td align="right">'.number_format($row['harga'],2,',','.').'</td>
      <td align="right">'.number_format($total,2,',','.').'</td>
      </tr>';
    }
     ?>
     <tr>
 			<td align="center">Total Qty</td>
 			<td align="center"><b><?php echo $totqty; ?></b> </td>
 			<td></td>
 			<td></td>
 		</tr>
     <tr>
       <td></td>
       <td></td>
       <td align="center">Total (Rp)</td>
       <td align="right"><?php echo number_format($totalan,2,',','.'); ?></td>
     </tr>
	</table>
  <br>
  <br>
  <table class="col-md-12" border="1">
    <tr>
      <th width="55%">keterangan</th>
      <th width="15%">Qty</th>
      <th width="15%">Harga</th>
      <th width="15%">Total</th>
    </tr>
    <?php
    $totalin=0;
    $qtybb=0;
    $qtytk=0;
    $qtyo=0;
    $hargabb=0;
    $hargatk=0;
    $hargao=0;
    $totalq=0;
    $sql = "SELECT * FROM anggaran_tk where id_tk='".$id_tk."'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($result)) {
      $totalin=$totalin+$row['total'];
      $totalq=$totalq+$row['qty'];
      if ($row['keterangan']=='Bahan Baku') {
        $qtybb=$row['qty'];
        $hargabb=$row['harga'];
      } elseif ($row['keterangan']=='Tenaga Kerja') {
        $qtytk=$row['qty'];
        $hargatk=$row['harga'];
      } elseif ($row['keterangan']=='Overhead') {
        $qtyo=$row['qty'];
        $hargao=$row['harga'];
      }
      echo '<tr>
       <td>'.$row['keterangan'].'</td>
       <td align="center">'.$row['qty'].'</td>
       <td align="right">'.number_format($row['harga'],2,',','.').'</td>
       <td align="right">'.number_format($row['qty']*$row['harga'],2,',','.').'</td>
     </tr>';
    }
     ?>
     
    <!--  <tr>
       <td>Tenaga Kerja</td>
       <td align="center">'.$qtytk; ?></td>
       <td align="right">'.number_format($hargatk,2,',','.'); ?></td>
       <td align="right">'.number_format($qtytk*$hargatk,2,',','.'); ?></td>
     </tr>
     <tr>
       <td>Overhead</td>
       <td align="center">'.$qtyo; ?></td>
       <td align="right">'.number_format($hargao,2,',','.'); ?></td>
       <td align="right">'.number_format($qtyo*$hargao,2,',','.'); ?></td>
     </tr> -->
     <tr>
 			<td align="center">Total Qty</td>
 			<td align="center"><b><?php echo $totalq; ?></b> </td>
 			<td></td>
 			<td></td>
 		</tr>
     <tr>
       <td></td>
       <td></td>
       <td align="center">Total (Rp)</td>
       <td align="right"><?php echo number_format($totalin,2,',','.'); ?></td>
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
