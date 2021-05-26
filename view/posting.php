<?php
if (isset($_POST['field'])) {
  $field = $_POST['field'];
  $value = $_POST['value'];
  $editid = $_POST['id'];
  $query = "update tabel_transaksi set $field='$value' WHERE id_transaksi='".$editid."'";
  if (mysqli_query($conn,$query)) {
    echo("berhasil");
  }else{
    echo mysqli_error($conn);
  }
}
if (isset($_POST['post_id'])) {
  $post_ids = $_POST['post_id'];
  foreach($post_ids as $id){
// Posting record
    $query ="UPDATE `tabel_transaksi` SET `tanggal_posting` = '$waktu', `keterangan_posting` = 'Post' WHERE `tabel_transaksi`.`id_transaksi` = ".$id;
    mysqli_query($conn,$query);
  }
}
if (isset($_POST['post_idD'])) {
  $post_ids = $_POST['post_idD'];
  foreach($post_ids as $id){
// Delete record
    $query ="DELETE FROM `tabel_transaksi` WHERE `tabel_transaksi`.`id_transaksi` = ".$id;
    mysqli_query($conn,$query);
  }
}
if (isset($_GET['jd'])) {
  $post_ids = $_GET['jd'];
// Delete record
    $query ="DELETE FROM `tabel_transaksi` WHERE `tabel_transaksi`.`id_transaksi` = ".$post_ids;
    mysqli_query($conn,$query);
}
?>
<div class="container-fluid">
  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h5 mb-0 text-gray-800">Posting Jurnal</h1>
  </div>
  <div class="card ">
    <div class="card-header py-3">
      <h6 class="font-weight-bold text-primary float-left">List Data Posting Jurnal</h6>
      <button class="btn btn-primary float-right btn-sm" onclick="posting_confirm()" style="margin-right:10px">Posting</button>
    </div>
    <div class="card-body">
      <form action="" method="GET">
        <div class='container row' >
          <input type="hidden" name="page" value="posting">
          <input type='date' name="awal" class="form-control col-md-3 col-xs-12" id='datepicker' placeholder='Tanggal Awal' style="margin-right: 10px;">
          <input type='date' name="akhir" class="form-control col-md-3 col-xs-12" id='datepicker2' placeholder='Tanggal Akhir' style="margin-right: 10px;">
          <input type="submit" value="submit" class="col-md-1 col-xs-12 btn btn-success">
        </div>
      </form>
      <div class="table-responsive small-text">
        <table class="table bordered" id="dataTable" width="100%" cellspacing="0">
          <thead>
            <tr>
              <th><input type="checkbox" id="select_all" style="width: 15px;height: 15px;"></th></th><th>Tanggal</th><th>Kode Rek</th><th>Keterangan</th><th>Kode Voucher</th><th>Debet</th><th>Kredit</th><th>Posting</th><th>Kd Pelanggan</th>
            </tr>
          </thead>
          <tbody id="recordsTable">
            <?php
            if (isset($_GET['awal']) AND isset($_GET['akhir'])) {
              $djndn = "SELECT * FROM `tabel_transaksi` where tanggal_transaksi between '".$_GET['awal']."' and '".$_GET['akhir']."' ORDER BY `id_transaksi` DESC";
            } else {
              $djndn = "SELECT * FROM `tabel_transaksi` ORDER BY `id_transaksi` DESC";
            }
            $result = mysqli_query($conn, $djndn);
            while ($row = mysqli_fetch_array($result)) {
              $debet=$row['debet'];
              $kredit=$row['kredit'];

              if ($row['keterangan_posting'] == "Post") {
                $edit = "";
              }else {
                $edit = "contenteditable";
              }

              echo "<tr class='".penyesuaian($conn, $row[0])."'>
              <td align='left' width='2%'><input type='checkbox' id='del_$row[0]' style='width: 15px;height: 15px;' name='checked_id[]' class='checkbox' value='$row[0]'/> </td>
              <td contenteditable width='80px' class='edit' id='tanggal_transaksi-$row[0]'>".date('d-m-Y',strtotime($row['tanggal_transaksi']))."</td>
              <td contenteditable class='edit' id='kode_rekening-$row[0]'>$row[kode_rekening]</td>
              <td contenteditable class='edit' id='keterangan_transaksi-$row[0]'>$row[keterangan_transaksi]</td>
              <td class='edit' id='jenis_transaksi-$row[0]'>$row[jenis_transaksi]</td>
              <td ".$edit." class='edit num debet' id='debet-$row[0]'>".number_format($debet,2,'.',',')."</td>
              <td ".$edit." class='edit num kredit' id='kredit-$row[0]'>".number_format($kredit,2,'.',',')."</td>
              <td class='edit' id='keterangan_posting-$row[0]'>$row[keterangan_posting]</td>
              <td>$row[Kode_Pelanggan]</td>
              </tr>";
            }
            ?>

          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
  var sum = 0;
  $(".kredit").each(function() {
    var value = $(this).text();
    value2 = value.replace(/,/g, '');
    value3 = value2.replace('.00', '');
    if(!isNaN(value3) && value3.length != 0) {
      sum += parseInt(value3);
    }
    $("#sumkredit").html(sum);
  });
  var sum2;
  $("#sumkredit").html(sum);
  $(".debet").each(function() {
    var valuef = $(this).text();
  });
</script>
<script>
  $(document).ready(function(){
    $('#select_all').on('click',function(){
      if(this.checked){
        $('.checkbox').each(function(){
          this.checked = true;
        });
      }else{
       $('.checkbox').each(function(){
        this.checked = false;
      });
     }
   });
    $('.checkbox').on('click',function(){
      if($('.checkbox:checked').length == $('.checkbox').length){
        $('#select_all').prop('checked',true);
      }else{
        $('#select_all').prop('checked',false);
      }
    });
  });
</script>
<script type="text/javascript">
   // Add Class
   $('.edit').click(function(){
    $(this).addClass('editMode');
  });
 // Save data
 $(".edit").focusout(function(){
  $(this).removeClass("editMode");
  var id = this.id;
  var split_id = id.split("-");
  var field_name = split_id[0];
  var edit_id = split_id[1];
  var value = $(this).text();
  $.ajax({
    url: 'index.php?page=posting',
    type: 'post',
    data: { field:field_name, value:value, id:edit_id },
    success:function(response){
      alertku('success', 'Berhasil Ubah Data');

    }
  });
});
</script>
<script>
  function posting_confirm(){
    if($('.checkbox:checked').length > 0){
      var result = confirm("Kamu yakin ingin Posting Transaksi?");
      if(result){
        var post_arr = [];
    // Get checked checkboxes
    $('#recordsTable input[type=checkbox]').each(function() {
      if (jQuery(this).is(":checked")) {
        var id = this.id;
        var splitid = id.split('_');
        var postid = splitid[1];
        post_arr.push(postid);
      }
    });
    if(post_arr.length > 0){
        // AJAX Request
        $.ajax({
          url: 'index.php?page=posting',
          type: 'post',
          data: { post_id: post_arr },
          success:function(response){
           alertku('success', 'Berhasil Posting Data');
         }
       });
      }
    }else{
      return false;
    }
  }else{
    alert('Minimal 1 barang yang di posting.');
    return false;
  }
}
function Delete_confirm(){
  if($('.checkbox:checked').length > 0){
    var result = confirm("Kamu yakin ingin Posting Transaksi?");
    if(result){
        // return true;
        var post_arr = [];
    // Get checked checkboxes
    $('#recordsTable input[type=checkbox]').each(function() {
      if (jQuery(this).is(":checked")) {
        var id = this.id;
        var splitid = id.split('_');
        var postid = splitid[1];
        post_arr.push(postid);
      }
    });
    if(post_arr.length > 0){
        // AJAX Request
        $.ajax({
          url: 'index.php?page=posting',
          type: 'post',
          data: { post_idD: post_arr },
          success:function(response){
            alertku('danger', 'Berhasil Delete Data');
          }
        });
      }
      location.reload();
    }else{
      return false;
    }
  }else{
    alert('Minimal 1 barang yang di Delete.');
    return false;
  }
}
</script>
<script>
  function red() {
    $(".text-grey").remove();
    $(".text-red").show();
  }
</script>
