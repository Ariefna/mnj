<?php
// require_once 'dompdf/autoload.inc.php';
require 'vendor/autoload.php';
use Dompdf\Dompdf;
$dompdf = new Dompdf();
if ($_GET['laporan'] == 'laba-rugi') {
	$html = file_get_contents('http://lenteraid.com/demo/puri/?laporan=laba-rugi');
}else {
	$html = file_get_contents('http://lenteraid.com/demo/puri/?laporan=neraca');
}

$dompdf->loadHtml($html);
// (Opsional) Mengatur ukuran kertas dan orientasi kertas
$dompdf->setPaper('A4', 'portrait');
// Menjadikan HTML sebagai PDF
$dompdf->render();
// Output akan menghasilkan PDF (1 = download dan 0 = preview)



if ($_GET['laporan'] == 'laba-rugi') {
	$dompdf->stream('laba-rugi',array("Attachment"=>1));
	header("location: index.php?page=laporan_rugi_laba");
}else {
	$dompdf->stream('neraca',array("Attachment"=>1));
	header("location: index.php?page=laporan_neraca");
}
?>