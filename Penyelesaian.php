<?php
include 'model/koneksi.php';
if (isset($_GET['kode'])) {
	$qury = "SELECT id_woc, tk.kodepl, DATE_FORMAT(tanggal, '%d %M %Y') as darek, nama, alamat,kota, kode FROM penyelesaian_tk tk join pelanggan p on tk.kodepl=p.kodepl WHERE kode = '".$_GET['kode']."'";

	$qc = mysqli_query($conn, $qury);
	$hasil = mysqli_fetch_array($qc);
	// $id_tk=$hasil['id_tk']; 
	$id_woc=$hasil['id_woc'];
  $kodepl=$hasil['kodepl'];
	$nama=$hasil['nama'];
	$kota=$hasil['kota'];
	$tanggal=$hasil['darek'];
	$alamat=$hasil['alamat'];
	$kodepl = $hasil['kodepl'];
	$kode_proyek = $hasil['kode'];
}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Surat Penyelesaian</title>

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
				<td width="50%" align="right"><h3>SURAT PENYELESAIAN</h3></td>
			</tr>
			<tr>
				<td width="50%"><br>PT PURI PANCA PUJI BANGUN</td>
				<td width="50%"><br>Kepada Yth.</td>
			</tr>
			<tr>
				<td width="50%">Jl. Mastrip No. 70, Karang Pilang</td>
				<td width="50%"><?php echo $kodepl; ?> - <?php echo ucwords($nama); ?></td>
			</tr>
			<tr>
				<td width="50%">Surabaya</td>
				<td width="50%"><?php echo ucwords($alamat); ?></td>
			</tr>
			<tr>
				<td width="50%">Nomor Surat Penyelesaian : <?php echo $kode_proyek; ?></td>
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
    $sql = "SELECT * FROM detail_penyelesaian_tk where id_woc='".$id_woc."'";
    $result = mysqli_query($conn, $sql);
    while ($row = mysqli_fetch_array($result)) {
      $total=$row['qty']*$row['harga'];
      $totalan=$total+$totalan;
      $totqty=$totqty+$row['qty'];
      echo '<tr>
      <td>'.$row['nama'].'</td>
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
