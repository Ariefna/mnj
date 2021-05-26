<li class="nav-item">
	<a class="nav-link" href="?">
		<i class="fas fa-fw fa-home"></i>
		<span>Home</span></a>
	</li>
	<?php if ($_SESSION['sts']==1) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities1" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-book"></i>
				<span>Data Master</span>
			</a>
			<div id="collapseUtilities1" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Master:</h6>
					<a class="collapse-item" href="?page=nilai">Penambah Nilai</a>
					<a class="collapse-item" href="?page=kas">Kas</a>
					<a class="collapse-item" href="?page=bank">Bank</a>
					<a class="collapse-item" href="?page=pelanggan">Pemanfaat</a>
					<a class="collapse-item" href="?page=supplier">Penghasil</a>
					<a class="collapse-item" href="?page=satuan">Satuan</a>
					<a class="collapse-item" href="?page=produk">Produk</a>
					<a class="collapse-item" href="?page=harga">Harga</a>
					<a class="collapse-item" href="?page=stok">Stok</a>
					<a class="collapse-item" href="?page=inventory">Inventory</a>
					<a class="collapse-item" href="?page=userset">Karyawan</a>
				</div>
			</div>
		</li>
	<?php } ?>
	<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==3||$_SESSION['sts']==6) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities0" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-book"></i>
				<span>Purchase Order</span>
			</a>
			<div id="collapseUtilities0" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Purchase Order:</h6>
					<a class="collapse-item" href="?page=lap_Penghasil">Order PO</a>
					<a class="collapse-item" href="?page=suratpembelian">Create Purchase Order</a>
					<a class="collapse-item" href="?page=approvep">Approve Purchase Order</a>
					<a class="collapse-item" href="?page=penerimaanpembelian">Create Penerimaan Produk</a>
					<a class="collapse-item" href="?page=approvepen">Approve Penerimaan Produk</a>
				</div>
			</div>
		</li>
	<?php } ?>
	<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4||$_SESSION['sts']==5||$_SESSION['sts']==6) {?>
		<li class="nav-item">
			<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3" aria-expanded="true" aria-controls="collapseUtilities">
				<i class="fas fa-fw fa-book"></i>
				<span>Sales Order</span>
			</a>
			<div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Sales Order:</h6>
					<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4||$_SESSION['sts']==6) {?>
						<a class="collapse-item" href="?page=lap_Pemanfaat">Order SO</a>
					<a class="collapse-item" href="?page=suratpesanan">Create Sales Order</a>
					<a class="collapse-item" href="?page=approve">Approve Sales Order</a>
					<?php } ?>
					<a class="collapse-item" href="?page=suratjalan">Delivery Order</a>
					<a class="collapse-item" href="?page=approvesj">Approve Delivery Order</a>
					<?php if ($_SESSION['sts']==1||$_SESSION['sts']==2||$_SESSION['sts']==4) {?>
					<a class="collapse-item" href="?page=invoice">Invoice</a>
					<a class="collapse-item" href="?page=retur">Retur Sales Order</a>
					<a class="collapse-item" href="?page=approveretur">Approve Retur Sales Order</a>
					<a class="collapse-item" href="?page=piutang">Piutang</a>
					<?php } ?>
					<!-- <a class="collapse-item" href="?page=kuitansi">kuitansi</a> -->
				</div>
			</div>
		</li>
	<?php } ?>
	<!-- <li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities9" aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-book"></i>
			<span>Tugas kerja</span>
		</a>
		<div id="collapseUtilities9" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
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
				<i class="fas fa-fw fa-book"></i>
				<span>Laporan</span>
			</a>
			<div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Laporan:</h6>
					<a class="collapse-item" href="?page=laporan_jurnal">Jurnal</a>
					<a class="collapse-item" href="?page=neraca_lajur">Neraca Lajur</a>
					<a class="collapse-item" href="?page=laporan_rugi_laba">Rugi Laba</a>
					<a class="collapse-item" href="?page=laporan_neraca">Neraca</a>
					<a class="collapse-item" href="?page=laporan_suratjalan">Surat Jalan</a>
					<a class="collapse-item" href="?page=laporan_invoice">Invoice</a>
					<a class="collapse-item" href="?page=laporan_retur">Retur</a>
					<a class="collapse-item" href="?page=laporan_pay">pembayaran</a>
					<a class="collapse-item" href="?page=lpenjualan">Penjualan</a>
					<a class="collapse-item" href="?page=lap_sp">L Surat Pesanan</a>
					<a class="collapse-item" href="?page=lap_sj">L Surat Jalan</a>
					<a class="collapse-item" href="?page=lap_piu">L Surat Piutang</a>
					<a class="collapse-item" href="?page=lap_rt">L Retur</a>
					<a class="collapse-item" href="?page=lap_pem">L Pembayaran</a>
					<a class="collapse-item" href="?page=l_outsp">L Outstanding SP</a>
					<a class="collapse-item" href="?page=lap_tugas_kerja">L Tugas Kerja</a>
					<a class="collapse-item" href="?page=lap_penyelesaian_tk">L Penyelesaian TK</a>
					<a class="collapse-item" href="?page=lap_penjualan_tk">L Penjualan TK</a>
					<a class="collapse-item" href="?page=lap_Pemanfaat">L Pemanfaat</a>
					<a class="collapse-item" href="?page=lap_Penghasil">L Penghasil</a>
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
				<i class="fas fa-fw fa-book"></i>
				<span>Jurnal</span>
			</a>
			<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					<h6 class="collapse-header">Jurnal:</h6>
					<a class="collapse-item" href="?page=jurnal">Jurnal Umum</a>
					<a class="collapse-item" href="?page=jurnal_memorial">Jurnal Memorial</a>
					<a class="collapse-item" href="?page=posting">Posting Jurnal</a>
				</div>
			</div>
		</li>
	<?php } ?>


	<hr class="sidebar-divider d-none d-md-block">
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
