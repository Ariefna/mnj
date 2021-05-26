<li class="nav-item">
	<a class="nav-link" href="?">
		<i class="fas fa-fw fa-home" style="color:#01cdfe"></i>
		<span>Home</span></a>
	</li>
	<?php if ($_SESSION['sts']==1) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-server" style="color:#ff71ce"></i>
				<span>Data Master</span>
			</a>
			<div id="collapseUtilities1" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-light py-2 collapse-inner ">
					<table class="table table-responsive table-borderless text-center">
						<tr >
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=persediaan"><img src="img/box.png" width="50px"><br><b>Persediaan</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=ongkir"><img src="img/postman.png" width="50px"><br><b>Ongkir</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=nilai"><img src="img/add.png" width="50px"><br><b>Penambah Nilai</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=kas"><img src="img/money.png" width="50px"><br><b>Kas</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=bank"><img src="img/bank.png" width="50px"><br><b>Bank</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=pelanggan"><img src="img/growth.png" width="50px"><br><b>Pemanfaat</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=supplier"><img src="img/analysis.png" width="50px"><br><b>Penghasil</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=satuan"><img src="img/1.png" width="50px"><br><b>Satuan</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=produk"><img src="img/new-product.png" width="50px"><br><b>Produk</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=harga"><img src="img/money (1).png" width="50px"><br><b>Harga</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-danger" href="?page=stok"><img src="img/packages.png" width="50px"><br><b>Stok</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-danger" href="?page=inventory"><img src="img/inventory.png" width="50px"><br><b>Inventory</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-danger" href="?page=kendaraan"><img src="img/vehicle.png" width="50px"><br><b>Kendaraan</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-danger" href="?page=userset"><img src="img/executive.png" width="50px"><br><b>Karyawan</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-danger" href="?page=userandroid"><img src="img/tutorial.png" width="50px"><br><b>User Android</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-gradient-success" href="?page=manualbook"><img src="img/manual.png" width="50px"><br><b>Manual Book Android</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-gradient-success" href="?page=laporan_rugi_laba"><img src="img/estimate.png" width="50px"><br><b>Kode Akun Perkiraan</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>

		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilitiesHRD" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-user" style="color:#ff71ce"></i>
				<span>Master HRD</span>
			</a>
			<div id="collapseUtilitiesHRD" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=bpjs"><img src="img/healthcare.png" width="50px"><br><b>BPJS</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=gaji"><img src="img/salary.png" width="50px"><br><b>Gaji</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=detail_karyawan"><img src="img/profile.png" width="50px"><br><b>Detail Karyawan</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>
		<hr class="sidebar-divider">
	<?php } ?>
	<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==3||$_SESSION['sts']==6) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities0" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-shopping-cart" style="color:#05ffa1"></i>
				<span>Purchase Order</span>
			</a>
			<div id="collapseUtilities0" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<!-- <a class="collapse-item" href="?page=lap_Penghasil">Order Purchase Order</a> -->
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=createorderandroid"><img src="img/operation.png" width="50px"><br><b>Create Operasional</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=listsuratpembelian"><img src="img/accounting.png" width="50px"><br><b>Purchase Order Finance</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=approvep"><img src="img/approval.png" width="50px"><br><b>Finance Approvel</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=tracking"><img src="img/tracking.png" width="50px"><br><b>Tracking Purchase Order</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=listtimbangan"><img src="img/balance.png" width="50px"><br><b>Timbangan</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=penerimaanpembelian"><img src="img/shipping.png" width="50px"><br><b>Create Penerimaan Produk</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=approvepen"><img src="img/delivery-box.png" width="50px"><br><b>Approve Penerimaan Produk</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>
	<?php } ?>
	<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4||$_SESSION['sts']==5||$_SESSION['sts']==6) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-credit-card" style="color:#b967ff"></i>
				<span>Sales Order</span>
			</a>
			<div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<!-- <a class="collapse-item" href="?page=suratpesanan">Create Sales Order</a> -->
							<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4||$_SESSION['sts']==6) {?>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=approve"><img src="img/checklist.png" width="50px"><br><b>List Sales Order</b></a></td>
							<?php } ?>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=suratjalan"><img src="img/fast-delivery.png" width="50px"><br><b>Delivery Order</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=approvesj"><img src="img/packing-list.png" width="50px"><br><b>List Delivery Order</b></a></td>
							<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4) {?>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=invoice"><img src="img/invoice.png" width="50px"><br><b>Invoice</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=retur"><img src="img/exchange.png" width="50px"><br><b>Retur Sales Order</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-gradient-success" href="?page=approveretur"><img src="img/sales.png" width="50px"><br><b>List Retur Sales Order</b></a></td>
							<!-- <a class="collapse-item" href="?page=piutang">Piutang</a> -->
							<?php } ?>
							<!-- <a class="collapse-item" href="?page=kuitansi">kuitansi</a> -->
						</tr>
					</table>
				</div>
			</div>
		</li>
		<li class="nav-item">
	<a class="nav-link" href="?page=tk">
		<i class="fas fa-fw fa-cogs" style="color:#653417"></i>
		<span>Proyek</span></a>
	</li>
	<?php } ?>
	<!-- <li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities9" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-book"></i>
			<span>Tugas kerja</span>
		</a>
		<div id="collapseUtilities9" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner">
				<h6 class="collapse-header">Tugas kerja:</h6>
					<a class="collapse-item" href="?page=tk">Tugas Kerja</a>
					<a class="collapse-item" href="?page=approvetk">Approve Tugas Kerja</a>
					<a class="collapse-item" href="?page=list_penyesuaian_tk">Penyelesaian Pekerjaan</a>
					<a class="collapse-item" href="?page=approve_penyesuaian_pekerjaan">Approve Penyesuaian</a>
			</div>
		</div>
	</li> -->
	<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-book" style="color:#ff3d3d"></i>
				<span>Laporan</span>
			</a>
			<div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<td><a class="collapse-item  py-3 m-1 bg-primary" href="?page=laporan_jurnal"><img src="img/agendas.png" width="50px"><br><b>Jurnal</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-primary" href="?page=neraca_lajur"><img src="img/time-sheet.png" width="50px"><br><b>Neraca Lajur</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-primary" href="?page=laporan_rugi_laba"><img src="img/loss.png" width="50px"><br><b>Rugi Laba</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-primary" href="?page=laporan_neraca"><img src="img/balance-sheet.png" width="50px"><br><b>Neraca</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-primary" href="?page=laporan_suratjalan"><img src="img/passport.png" width="50px"><br><b>Surat Jalan</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item  py-3 m-1 bg-warning" href="?page=laporan_invoice"><img src="img/invoice.png" width="50px"><br><b>Invoice</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-warning" href="?page=laporan_retur"><img src="img/exchange.png" width="50px"><br><b>Retur</b></a></td>
							<!-- <a class="collapse-item  py-3 m-1 bg-warning" href="?page=laporan_pay">pembayaran</a> -->
							<!-- <a class="collapse-item  py-3 m-1 bg-warning" href="?page=lpenjualan">Penjualan</a> -->
							<td><a class="collapse-item  py-3 m-1 bg-warning" href="?page=lap_sp"><img src="img/order.png" width="50px"><br><b>L Surat Pesanan</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-warning" href="?page=lap_sj"><img src="img/passport.png" width="50px"><br><b>L Surat Jalan</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-warning" href="?page=lap_piu"><img src="img/debt.png" width="50px"><br><b>L Surat Piutang</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_rt"><img src="img/exchange.png" width="50px"><br><b>L Retur</b></a></td>
							<!-- <a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_pem">L Pembayaran</a> -->
							<td><a class="collapse-item  py-3 m-1 bg-danger" href="?page=l_outsp"><img src="img/spotlight.png" width="50px"><br><b>L Outstanding SP</b></a></td>
							<!-- <a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_tugas_kerja">L Tugas Kerja</a> -->
							<!-- <a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_penyelesaian_tk">L Penyelesaian TK</a> -->
							<!-- <a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_penjualan_tk">L Penjualan TK</a> -->
							<td><a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_Pemanfaat"><img src="img/growth.png" width="50px"><br><b>L Pemanfaat</b></a></td>
							<!-- <a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_Penghasil">L Penghasil</a> -->
							<td><a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_limbah"><img src="img/analysis.png" width="50px"><br><b>L Penghasil</b></a></td>
							<td><a class="collapse-item  py-3 m-1 bg-danger" href="?page=lap_penjadwalan"><img src="img/calendar.png" width="50px"><br><b>L Penjadwalan</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>
		<hr class="sidebar-divider">
		<div class="sidebar-heading">
			Transaksi
		</div>
		<!-- <li class="nav-item">
			<a class="nav-link active" href="?page=perkiraan">
				<i class="fas fa-fw fa-book"></i>
				<span>Perkiraan</span>
			</a>
		</li> -->
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-book" style="color:#cf30c5"></i>
				<span>Jurnal</span>
			</a>
			<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=jurnal"><img src="img/agendas.png" width="50px"><br><b>Jurnal Umum</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=jurnal_memorial"><img src="img/journal.png" width="50px"><br><b>Jurnal Memorial</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=posting"><img src="img/notebook.png" width="50px"><br><b>Posting Jurnal</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>

		<hr class="sidebar-divider">
		<div class="sidebar-heading">
			Pajak
		</div>

		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilitiesPajak" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-user" style="color:#ff71ce"></i>
				<span>Pajak</span>
			</a>
			<div id="collapseUtilitiesPajak" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner">
					<table class="table table-responsive table-borderless text-center">
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=ppn"><img src="img/tax.png" width="50px"><br><b>PPN</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=ppnbm"><img src="img/notebook.png" width="50px"><br><b>PPNBM</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=pajak_penghasilan_ps23"><img src="img/financial.png" width="50px"><br><b>Pajak Penghasilan Ps.23</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=pajak_penghasilan_ps4_ayat2"><img src="img/accounting.png" width="50px"><br><b>Pajak Penghasilan Ps.4 Ayat 2</b></a></td>
							<td><a class="collapse-item py-3 m-1 bg-primary" href="?page=pajak_penghasilan_ps21"><img src="img/dividend.png" width="50px"><br><b>Pajak Penghasilan Ps.21</b></a></td>
						</tr>
						<tr>
							<td><a class="collapse-item py-3 m-1 bg-warning" href="?page=pajak_penghasilan_ps22"><img src="img/budget.png" width="50px"><br><b>Pajak Penghasilan Ps.22</b></a></td>
						</tr>
					</table>
				</div>
			</div>
		</li>
		<hr class="sidebar-divider">
	<?php } ?>
</ul>
