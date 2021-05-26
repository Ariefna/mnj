<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h5 mb-0 text-gray-800">Jurnal Umum</h1>
  </div>
  <p id="jwb"></p>
  <div class="row">

    <div class="col-md-12">
      <div class="card mb-4">
        <div class="card-header py-3">
          <h6 class="font-weight-bold text-primary">List Data Jurnal Umum</h6>
        </div>
        <div class="card-body">
          <form action="kp.php" target="_blank">
            <select class="form-control col-md-3 col-xs-12" onchange="this.form.submit()" name="kodepl" id="">
              <?php
              $djndn = "SELECT kodepl,Nama from pelanggan";
              $dj = mysqli_query($conn, $djndn);
              $i=1;
              while ($jdbvj = mysqli_fetch_array($dj)) {
                echo '<option value="'.$jdbvj['kodepl'].'">'.$jdbvj['Nama'].'</option>';

              }
              ?>

            </select>
          </form>
          <div class="table-responsive">
            <table class="table" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>No</th>
                  <th>Tanggal</th>
                  <th>Transaksi</th>
                  <th>Debet</th>
                  <th>Kredit</th>
                  <th>saldo</th>
                  <th>Nama Pemanfaat</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th colspan="7" style="text-align:right">Total:</th>
                </tr>
              </tfoot>
              <tbody>
                <?php
                $saldo = 0;
                $no = 0;
                if (isset($_GET['nama'])) {
                  $result = mysqli_query($conn ,"SELECT *, b.Nama FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl where  b.Nama = '".$_GET['nama']."' ORDER by `kodepiutang` DESC");
                }else {
                  $result = mysqli_query($conn ,"SELECT *, b.Nama FROM `table_piutang` a join pelanggan b on b.kodepl = a.kodepl ORDER by `kodepiutang` DESC");
                }
                
                while ($row = mysqli_fetch_array($result)) {
                  $saldo+=$row['debet'];
                  $saldo-=$row['kredit'];
                  $debet=$row['debet'];
                  $no++;
                  $kredit=$row['kredit'];
                  $kodepiutang=$row['kodepiutang'];
                  echo "<tr>
                  <td>$no</td>
                  <td>$row[tanggal]</td>
                  <td>".cutText($row['keterangan'], 39, 1)."</td>
                  <td>".number_format($debet,2,'.',',')."</td>
                  <td>".number_format($kredit,2,'.',',')."</td>
                  <td>".number_format($saldo,2,'.',',')."</td>
                  <td>$row[Nama]</td>";
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
</div>
<!-- modal upload import excel -->

<script type="text/javascript">
 $(document).ready(function(){
  $('#submit').click(function(){
    $('#exampleModal1').modal('hide');
    var fd = new FormData();
    var files = $('#file')[0].files[0];
    fd.append('fileToUpload',files);
    $.ajax({
      url: 'upload.php',
      type: 'post',
      data: fd,
      contentType: false,
      processData: false,
      success: function(response){
        var obj = jQuery.parseJSON(response);
        alertku(obj.jenis_alert, obj.alert);
      }
    });
  });
});
</script>
