<?php
if(isset($_POST['simpan'])){
  $kode_transaksi=$_POST['kode_bukti'];
  $tanggal_transaksi=$_POST['tanggal_transaksi'];
  $keterangan_transaksi=ucwords($_POST['keterangan_transaksi']);
  $kode_rekening=$_POST['kode_rekening'];
  $keterangan_jurnal=ucwords($_POST['keterangan_jurnal']);
  $jumlah_dk=ucwords($_POST['jumlah_dk']);
  $query=mysqli_query($conn, "insert into tabel_transaksi(kode_transaksi,kode_rekening,tanggal_transaksi, jenis_transaksi, keterangan_transaksi,debet,id_admin)
    values('$kode_transaksi','$kode_rekening','$tanggal_transaksi','Kas Keluar','$keterangan_transaksi','$jumlah_dk','$id_admin')");
  if($query){
    $jenis_alert = "success";
    $alert = "Sukses Insert Data";
  }else{
    $jenis_alert = "danger";
    $alert = mysqli_error($conn);
  }
}else{
  unset($_POST['simpan']);
}
if (isset($_GET['delete'])) {
  $query=mysqli_query($conn,"DELETE FROM `tabel_transaksi` WHERE `tabel_transaksi`.`id_transaksi` = ".$_GET['delete']);
  if($query){
    $jenis_alert = "success";
    $alert = "Sukses Delete Data";
  }else{
    $jenis_alert = "danger";
    $alert = mysqli_error($conn);
  }
}
?>
<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h5 mb-0 text-gray-800">Kas Keluar</h1>
	</div>
  <div class="row">
    <div class="col-md-4">
      <div class="card  ">
        <div class="card-header py-3">
          <h6 class="font-weight-bold text-primary">Input Detail Kas Keluar</h6>
        </div>
        <div class="card-body">
          <form>
            <div class="form-group">
              <label for="inputAddress">Nomor Bukti</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Nomor Bukti">
            </div>
            <div class="form-group">
              <label for="inputAddress">Tanggal</label>
              <div class="input-group">
                <input type="date" id="dp3" class="form-control"  value="<?php echo date('Y-m-d'); ?>" >
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2"><i class="fa fa-calendar"></i></span>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="inputAddress">Keterangan Jurnal</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Keterangan Jurnal">
            </div>
            <label class="font-weight-bold text-primary" for="inputAddress">Kode Perkiraan Sisi Debet :</label><br>
            <label for="inputAddress">Nomor Rekening</label>
            <div class="form-row">
              <div class="form-group col-md-12">
                <input autocomplete="off" type="text" class="form-control" placeholder="kode rekening" onKeyUp="suggest(this.value);" name="kode_rekening"  onBlur="fill2();" id="kode">
                <div class="suggestionsBox col-md-12" id="suggestions" style="display: none;">
                 <div class="suggestionList" id="suggestionsList" style="cursor: pointer;">&nbsp;</div>
               </div>
             </div>
             <div class="form-group col-md-12">
              <input type="text" class="form-control" disabled="disabled" name="nama_rekening" onBlur="fill();" id="country">
            </div>
          </div>
          <div class="form-group">
            <label for="inputAddress">Keterangan Transaksi</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="Keterangan Transaksi">
          </div>
          <div class="form-group">
            <label for="inputAddress">Jumlah (Rp)</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="Jumlah">
          </div>
          <button type="submit" class="btn btn-primary">Simpan</button>
        </form>
      </div>
    </div>
  </div>
  <div class="col-md-8">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h6 class="font-weight-bold text-primary">List Data Kas Keluar</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table" id="dataTable" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>No</th>
                <th>Kode Rek</th>
                <th>Keterangan</th>
                <th>Debet</th>
                <th>Kredit</th>
                <th>saldo</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th colspan="6" style="text-align:right">Total:</th>
              </tr>
            </tfoot>
            <tbody>
              <?php
              $saldo = 0;
              $no = 0;
              $result = select_tabel_transaksi_kk($conn);
              while ($row = mysqli_fetch_array($result)) {
                $saldo+=$row['debet'];
                $saldo-=$row['kredit'];
                $debet=$row['debet'];
                $no++;
                $kredit=$row['kredit'];
                $id_transaksi=$row['id_transaksi'];
                echo "<tr>
                <td>$no</td>
                <td>$row[kode_rekening]</td>
                <td>".cutText($row['keterangan_transaksi'], 39, 1)."</td>
                <td>".number_format($debet,2,'.',',')."</td>
                <td>".number_format($kredit,2,'.',',')."</td>
                <td>".number_format($saldo,2,'.',',')."</td>";
                ?>
                <?php
                echo"</tr>";
              }
              ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>
