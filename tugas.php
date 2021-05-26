<?php
include 'model/koneksi.php';
if (isset($_GET['kode_proyek'])) {
	$qury = "SELECT id_tk, tk.kodepl, sales, tempo, margin, DATE_FORMAT(tanggal, '%d %M %Y') as darek, nama, alamat,kota, kode_proyek FROM tugas_kerja tk join pelanggan p on tk.kodepl=p.kodepl WHERE kode_proyek = '".$_GET['kode_proyek']."'";
	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	$id_tk=$hasil['id_tk'];
	$kodepl=$hasil['kodepl'];
	$nama=$hasil['nama'];
	$kota=$hasil['kota'];
	$tanggal=$hasil['darek'];
	$alamat=$hasil['alamat'];
	$kodepl = $hasil['kodepl'];
	$kode_proyek = $hasil['kode_proyek'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Surat Tugas Kerja</title>

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
				<td width="50%" align="right"><h3>SURAT TUGAS KERJA</h3></td>
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
				<td width="50%"><?php echo ucwords($alamat); ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Surat Tugas Kerja : <?php echo $kode_proyek; ?></td>
				<td><?php echo ucwords($kota); ?></td>
			</tr>
			<tr>
				<td width="50%">Tanggal : <?php echo date("d F Y"); ?></td>
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
 // window.print();
</script>
