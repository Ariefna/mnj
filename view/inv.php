<?php include 'model/koneksi.php'; ?>
<?php
if(!$conn) {
	echo 'Could not connect to the database.';
} else {
	if (isset($_GET['selected'])) {
		$response = array();
		$query = "SELECT sum(a.total)/0-(sum(a.total)*(d.diskon/100)) total FROM `table_sj_detail` a join table_kodesj b on a.id_sj = b.id_sj join table_sj c on c.id_sj = a.id_sj join table_sp d on d.id_sp = c.id_sp where b.kode_inv = '".$_GET['selected']."' GROUP by b.kode_inv";
		$result = mysqli_query($conn, $query) or die(mysqli_error());

		$querys = "SELECT sum(total_pem) totala FROM `pembayaran` where kode_inv = '".$_GET['selected']."'";
		$results = mysqli_query($conn, $querys) or die(mysqli_error());

		if ($result) {
			$response = array();
			$row = mysqli_fetch_array($result);
			$rows = mysqli_fetch_array($results);
			$item = array();
			$item["total"] = $row["total"]-$rows['totala'];
				// array_push($response, $item);

			$response["success"] = 1;
		}
		else {
			$response["success"] = 0;
			$response["message"] = "No Items Found";
		}
		echo json_encode($item);
	}
	else {
		echo 'There should be no direct access to this script!';
	}
}
?>
