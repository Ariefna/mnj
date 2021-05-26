<div class="container-fluid">
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h5 mb-0 text-gray-800">Preview</h1>
  </div>
  <p id="jwb"></p>
  <div class="row">
  <div class="col-md-12">
    <div class="card mb-4">
      <div class="card-header py-3">
        <h6 class="font-weight-bold text-primary">Preview Data</h6>
      </div>
      <div class="card-body">
        <div class="table-responsive">
          <table class="table" id="dataTable1" width="100%" cellspacing="0">
            <thead>
              <tr>
                <th>No</th>
                <th>Tanggal</th>
                <th>Kode Voucher</th>
                <th>Keterangan</th>
                <th>Debet</th>
                <th>Kredit</th>
                <th>Penanggung Jawab</th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <!-- <th colspan="7" style="text-align:right">Total:</th> -->
              </tr>
            </tfoot>
            <tbody>
              <?php
              $saldo = 0;
              $no = 0;
              // echo ;
              $result = mysqli_query($conn, "SELECT * FROM `tabel_transaksi` WHERE jenis_transaksi = '".$_GET['jenis']."' ORDER BY `id_transaksi` DESC");

              while ($row = mysqli_fetch_array($result)) {
                $saldo+=$row['debet'];
                $saldo-=$row['kredit'];
                $debet=$row['debet'];
                $no++;
                $kredit=$row['kredit'];
                $id_transaksi=$row['id_transaksi'];
                echo "<tr>
                <td>$no</td>
                <td>$row[tanggal_transaksi]</td>
                <td>$row[jenis_transaksi]</td>
                <td>".$row['keterangan_transaksi']."</td>
                <td>".number_format($debet,2,'.',',')."</td>
                <td>".number_format($kredit,2,'.',',')."</td>
                <td>".$row['penanggung']."</td>";
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
<div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form action="?page=jurnal" method="GET" id="saveexl" enctype="multipart/form-data">
        <div class="modal-header">
          <h5 class="modal-title">Upload Excel</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="text-center">
            <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="img/undraw_upload_87y9.svg" alt="">
          </div>
          <div class="input-group">
            <div class="custom-file">
              <input type="file" name="fileToUpload" class="custom-file-input" id="file">
              <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
              <div id='preview'></div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button name="export" id="submit" type="button" class="btn btn-primary">Save changes</button>
          <!-- <input type='button' class='btn btn-primary' value='Save changes' id='upload'> -->
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </form>
    </div>
  </div>
</div>
<script>
  var c = 0;
  var i=0;
  $('#add').click(function(){
    i++;
    $('#dynamic_field').append('<tr id="row'+i+'"><td align="center"><input class="text-center" style="width: 100%;border: none;background: #fff;" id="kode'+i+'" name="koderek[]" type="text" readonly><input class="text-center" style="width: 100%;border: none;background: #fff;" id="nama'+i+'" name="nama[]" type="hidden" readonly></td><td><input onchange="sjsj'+i+'(value);" list="browsers" style="width: 100%;border: none;"><datalist id="browsers"><?php $rdcjn = mysqli_query($conn, "SELECT * FROM `tabel_master`");while ($rdjc = mysqli_fetch_array($rdcjn)) { echo '<option value="'.$rdjc['nama_rekening'].'">'; } ?></datalist></td><td><input class="text-center" style="width: 100%;border: none;background: #fff;" id="harga'+i+'" name="Keterangan[]" type="text"></td><td><input class=" text-center qty" value="0" style="width: 100%;border: none;" type="number" id="qty'+i+'" name="jumlah[]" onchange="sum'+i+'();"></td><td><input class="text-center tot" style="width: 100%;border: none;background: #fff;" id="total'+i+'" name="penanggung[]" type="text" ></td><td align="center"><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn-sm btn_remove">hapus</button></td></tr>');
    c=i;
  });
  $(document).on('click', '.btn_remove', function(){
    var button_id = $(this).attr("id");
    $('#row'+button_id+'').remove();
  });
</script>
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
 <?php
 for ($i=1; $i <= 1000; $i++) {
  ?>
  function sjsj<?php echo $i; ?>(value){
    $.ajax({
      type: "POST",
      url: "autosuggest.php?koderek=1",
      data: {
        rek: value
      },
      success: function (data) {
        var json = JSON.parse(data);
        $('#kode<?php echo $i; ?>').val(json.kode);
        $('#nama<?php echo $i; ?>').val(json.nama);
      }
    });
  }
<?php } ?>
</script>

