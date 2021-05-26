<?php include 'model/koneksi.php'; ?>
<?php
if(!$conn) {
	echo 'Could not connect to the database.';
} else {
	if(isset($_POST['queryString'])) {
		$queryString = $conn->real_escape_string($_POST['queryString']);
		if(strlen($queryString) >0) {
			$query = $conn->query("SELECT nama_rekening,kode_rekening FROM tabel_master WHERE kode_rekening LIKE '$queryString%'");
			if($query) {
				echo '<ul>';
				while ($result = $query ->fetch_object()) {
					echo '<li onClick="fill(\''.addslashes($result->nama_rekening).'\'); fill2(\''.addslashes($result->kode_rekening).'\');">'.$result->kode_rekening.'&nbsp;&nbsp;'.$result->nama_rekening.'</li>';
				}
				echo '</ul>';
			} else {
				echo 'OOPS we had a problem :(';
			}
		} else {
				// do nothing
		}
	}
	elseif (isset($_POST['supplier'])) {
		$queryString = $conn->real_escape_string($_POST['supplier']);
		if(strlen($queryString) >0) {
			$djncv = "SELECT Nama,kodesup,CONCAT(Alamat,', ',kota) as alamat, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_hutang` a join supplier b on b.kodesup = a.kodesup where b.Nama = b.Nama ORDER by `kodehutang` DESC),0) saldo FROM supplier WHERE Nama LIKE '$queryString%'";
			$query = $conn->query($djncv);
			if($query) {
				echo '<ul>';
				while ($result = $query ->fetch_object()) {
					echo '<li onClick="supplier(\''.addslashes($result->Nama).'\',\''.addslashes($result->saldo).'\',\''.addslashes($result->alamat).'\',\''.addslashes($result->kodesup).'\');">'.$result->Nama.'</li>';
				}
				echo '</ul>';
			} else {
				echo 'OOPS we had a problem :(';
			}
		} else {
				// do nothing
		}

	}
	elseif (isset($_POST['pelanggan'])) {
		$queryString = $conn->real_escape_string($_POST['pelanggan']);
		if(strlen($queryString) >0) {
			$djncv = "SELECT Nama,kodepl,CONCAT(Alamat,', ',kota) as alamat, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where b.Nama = pelanggan.Nama ORDER by `kodepiutang` DESC),0) saldo FROM pelanggan WHERE Nama LIKE '$queryString%'";
			$query = $conn->query($djncv);
			if($query) {
				echo '<ul>';
				while ($result = $query ->fetch_object()) {
					echo '<li onClick="pelanggan(\''.addslashes($result->Nama).'\',\''.addslashes($result->saldo).'\',\''.addslashes($result->alamat).'\',\''.addslashes($result->kodepl).'\');">'.$result->Nama.'</li>';
				}
				echo '</ul>';
			} else {
				echo 'OOPS we had a problem :(';
			}
		} else {
				// do nothing
		}

	}
	elseif (isset($_POST['produk'])) {
		$response = array();
		$query = "SELECT * FROM `produk` where nama_produk = '".$_POST['produk']."'";
		$result = mysqli_query($conn, $query) or die(mysqli_error());
		if ($result) {
			$response = array();
			$row = mysqli_fetch_array($result);
			$item = array();
			$item["id_produk"] = $row["id_produk"];
			$item["nama_produk"] = $row["nama_produk"];
			$item["kode_produk"] = $row["kode_produk"];
			$item["harga_produk"] = $row["harga_produk"];
			$item["harga_beli"] = $row["harga_beli"];
				// array_push($response, $item);

			$response["success"] = 1;
		}
		else {
			$response["success"] = 0;
			$response["message"] = "No Items Found";
		}
		echo json_encode($item);
	}
	elseif (isset($_GET['koderek'])) {
		$response = array();
		$query = "SELECT * FROM `tabel_master` WHERE kode_rekening+' '+nama_rekening = '".$_POST['rek']."'";
		$result = mysqli_query($conn, $query) or die(mysqli_error());
		if ($result) {
			$response = array();
			$row = mysqli_fetch_array($result);
			$item = array();
			$item["kode"] = $row["kode_rekening"];
			$item["nama"] = $row["nama_rekening"];


			// $item["kode_rekening"] = $row["kode_rekening"];
				// array_push($response, $item);

			$response["success"] = 1;
		}
		else {
			$response["success"] = 0;
			$response["message"] = "No Items Found";
		}
		echo json_encode($item);
	}
	elseif (isset($_GET['kodesupp'])) {
		$response = array();
		$query = "SELECT Nama,kodesup,CONCAT(Alamat,', ',kota) as alamat, COALESCE((SELECT sum(debet)-sum(kredit) FROM `table_hutang` a join supplier b on b.kodesup = a.kodesup where b.Nama = b.Nama ORDER by `kodehutang` DESC),0) saldo FROM supplier WHERE Nama LIKE '".$_POST['rek']."%'";
		$result = mysqli_query($conn, $query) or die(mysqli_error());
		if ($result) {
			$response = array();
			$row = mysqli_fetch_array($result);
			$item = array();
			$item["Nama"] = $row["Nama"];
			$item["saldo"] = $row["saldo"];
			$item["kodesup"] = $row["kodesup"];


			// $item["kode_rekening"] = $row["kode_rekening"];
				// array_push($response, $item);

			$response["success"] = 1;
		}
		else {
			$response["success"] = 0;
			$response["message"] = "No Items Found";
		}
		echo json_encode($item);
	}
	elseif (isset($_POST['supp'])) {
		$response = array();
		$query = "SELECT Nama,kodesup,CONCAT(Alamat,', ',kota) as alamat FROM supplier WHERE Nama LIKE '".$_POST['supp']."%'";
		$result = mysqli_query($conn, $query) or die(mysqli_error());
		if ($result) {
			$response = array();
			$row = mysqli_fetch_array($result);
			$item = array();
			$item["Nama"] = $row["Nama"];
			$item["kodesup"] = $row["kodesup"];


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
