<?php
if(isset($_POST['kode_rekening'])){
  $kode_rekening=$_POST['kode_rekening'];
  $nama_rekening=ucwords($_POST['nama_rekening']);
  $normal=$_POST['normal'];
  $posisi=$_POST['posisi'];
  $awal_debet=$_POST['awal_debet'];
  $awal_kredit=$_POST['awal_kredit'];
  $subacct=$_POST['subacct'];
  $query=mysqli_query($conn, "insert into tabel_master(kode_rekening,nama_rekening,tanggal_awal,awal_debet,awal_kredit,posisi,normal,subacct,option)
    values('$kode_rekening','$nama_rekening','$waktu2','$awal_debet','$awal_kredit','$posisi','$normal','$subacct','1')");
  if($query){
    $jenis_alert = "success";
    $alert = "Sukses Insert Data";
  }else{
    $jenis_alert = "danger";
    $alert = mysqli_error($conn);
  }
  echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
?>

<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h5 mb-0 text-gray-800">Master Bank</h1>
  </div>
  <div class="row">
    <div class="col-md-4">
      <div class="card  ">
        <div class="card-header py-3">
          <h6 class="font-weight-bold text-primary">Input Master Bank</h6>
        </div>
        <div class="card-body">
          <form action="" method="POST" onsubmit="return confirm('Are you sure you want to submit?')">
            <div class="form-group">
              <label for="inputAddress">Kode Rekening</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Kode Rekening" name="kode_rekening">
            </div>
            <div class="form-group">
              <label for="inputAddress">Nama Rekening</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Nama Rekening" name="nama_rekening">
            </div>
            <div class="form-group">
              <label for="inputAddress">Subacct</label>
              <input type="text" class="form-control" id="subacct" placeholder="Subacct" name="subacct">
            </div>
            <div class="form-group">
              <label for="inputAddress">Normal Balance</label>
              <select class="form-control" name="normal">
                <option value="debet">Debet</option>
                <option value="kredit">Kredit</option>
              </select>
            </div>
            <div class="form-group">
              <label for="inputAddress">Posisi</label>
              <select class="form-control" name="posisi">
                <option value="neraca">Neraca</option>
                <option value="rugi-laba">Rugi Laba</option>
              </select>
            </div>
            <div class="form-group">
              <label for="inputAddress">Saldo Awal Debet</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Saldo Awal Debet" name="awal_debet">
            </div>
            <div class="form-group">
              <label for="inputAddress">Saldo Akhir Debet</label>
              <input type="text" class="form-control" id="inputAddress" placeholder="Saldo Akhir Debet" name="awal_kredit">
            </div>
            <button name="submit" type="submit" class="btn btn-primary">Simpan</button>
          </form>
        </div>
      </div>
    </div>
    <div class="col-md-8">
      <div class="card mb-4">
        <div class="card-header py-3">
          <h6 class="font-weight-bold text-primary">List Master Bank</h6>
        </div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Kode Rekening</th>
                  <th>Nama Rekening</th>
                  <th>Awal Debet</th>
                  <th>Awal Kredit</th>
                  <th>Posisi</th>
                  <th>Normal</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <?php $total = mysqli_fetch_array(select_tabel_master_hitung($conn, 'bank')); ?>
                  <th colspan="2" align="center">Jumlah</th>
                  <th align="right"><?php echo number_format($total['tot_awal_debet'],2,'.',','); ?></th>
                  <th align="right"><?php echo number_format($total['tot_awal_kredit'],2,'.',','); ?></th>

                  <?php
                  if($total['tot_awal_debet']==$total['tot_awal_kredit']){
                    echo "<th colspan='2' align='center' class=''>Balance</th>";
                  }else{
                    echo "<th colspan='2' align='center' class='text-danger'>".abs($total['tot_awal_debet']-$total['tot_awal_kredit'])."";
                  }

                  ?>
                </tr>
              </tfoot>
              <tbody>
                <?php
                $result = select_tabel_master($conn, 'bank');
                while ($row = mysqli_fetch_array($result)) {
                  echo "<tr>
                  <td class='edit' id='kode_rekening-$row[0]'>$row[kode_rekening]</td>
                  <td class='edit' id='nama_rekening-$row[0]'>$row[nama_rekening]</td>
                  <td contenteditable class='edit' id='awal_debet-$row[0]'>$row[awal_debet]</td>
                  <td contenteditable class='edit' id='awal_kredit-$row[0]'>$row[awal_kredit]</td>
                  <td contenteditable class='edit' id='posisi-$row[0]'>$row[posisi]</td>
                  <td contenteditable class='edit' id='normal-$row[0]'>$row[normal]</td>
                  </tr>";
                }
                ?>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $('.edit').click(function(){
    $(this).addClass('editMode');
  });
  $(".edit").focusout(function(){
    $(this).removeClass("editMode");
    var id = this.id;
    var split_id = id.split("-");
    var field_name = split_id[0];
    var edit_id = split_id[1];
    var value = $(this).text();
    $.ajax({
      url: 'ajax/ajax.php?perkiraan',
      type: 'post',
      data: { field:field_name, value:value, id:edit_id },
      success:function(response){
        var obj = jQuery.parseJSON(response);
        alertku(obj.jenis_alert, obj.alert);
      }
    });
  });
</script>
<?php
if(isset($_POST['kode_rekening'])){
  $kode_rekening=$_POST['kode_rekening'];
  $nama_rekening=ucwords($_POST['nama_rekening']);
  $normal=$_POST['normal'];
  $posisi=$_POST['posisi'];
  $awal_debet=$_POST['awal_debet'];
  $awal_kredit=$_POST['awal_kredit'];
  $subacct=$_POST['subacct'];
  $query=mysqli_query($conn, "insert into tabel_master(kode_rekening,nama_rekening,tanggal_awal,awal_debet,awal_kredit,posisi,normal,subacct)
    values('$kode_rekening','$nama_rekening','$waktu2','$awal_debet','$awal_kredit','$posisi','$normal','$subacct')");
  if($query){
    $jenis_alert = "success";
    $alert = "Sukses Insert Data";
  }else{
    $jenis_alert = "danger";
    $alert = mysqli_error($conn);
  }
  echo "<script>alertku('$jenis_alert', '$alert')</script>";
}
?>
