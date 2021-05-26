
<?php include 'model/koneksi.php'; ?>
<?php 
if (isset($_POST['admin'])) {
  jsonpeserta($conn);
}
function jsonpeserta($conn) {
  $id_admin = $_POST['admin'];
  $query = "SELECT * FROM `tabel_admin` WHERE id_admin = ".$id_admin;
  $result = mysqli_query($conn, $query);
  $row = mysqli_fetch_array($result);
  echo json_encode($row);
}
 ?>