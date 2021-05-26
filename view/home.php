<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary bg-primary  h-100 py-2">
				<div class="card-body text-light">
					<div class="row no-gutters align-items-center">
						<div class="col">
							<div class="text-xs font-weight-bold  text-uppercase mb-1">Total Purchase Order</div>
							<div class="h5 mb-0 font-weight-bold"><?php
							$sql = 'SELECT * FROM table_spp WHERE status=1';
							$query = mysqli_query($conn, $sql);
							echo mysqli_num_rows($query);
							 ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-shopping-cart text-light fa-2x"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-secondary bg-secondary h-100 py-2">
				<div class="card-body text-light">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-uppercase mb-1">Total Sales Order</div>
							<div class="h5 mb-0 font-weight-bold"><?php
							$sql = 'SELECT * FROM table_sp WHERE status=1';
							$query = mysqli_query($conn, $sql);
							echo mysqli_num_rows($query);
							 ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-credit-card text-light fa-2x"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-danger bg-danger  h-100 py-2">
				<div class="card-body text-light">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-uppercase mb-1">Total Omset</div>
							<div class="h5 mb-0 font-weight-bold"><?php
							$sqla = 'SELECT sum(total) as beli FROM table_spp_detail tpp join table_spp spp on tpp.id_spp=spp.id_spp WHERE status=1';
							$querya = mysqli_query($conn, $sqla);
							$rowa = mysqli_fetch_assoc($querya);

							$sqlb = 'SELECT sum(total) as jual FROM table_sp_detail tp join table_sp sp on tp.id_sp=sp.id_sp WHERE status=1';
							$queryb = mysqli_query($conn, $sqlb);
							$rowb = mysqli_fetch_assoc($queryb);

							echo "Rp. ".number_format(($rowb['jual']-$rowa['beli']),0,',','.');
							 ?></div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-12">
		<div class="card sale-card">
			<div class="card-header">
				<h3>GPS MNJ</h3>
			</div>
			<div class="card-block">
				<div class="row">
					<div class="col-sm-8">
						<div id="allocation-map" class="chart-shadow" style="height:400px"></div>
					</div>
					<div class="col-sm-4">
						<div id="allocation-chart" class="chart-shadow" style="height:400px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- analytic card start -->
	<div class="col-xl-3 col-md-6 mt-2">
		<div class="card social-card">
			<div class="card-body text-center">
				<h2 class="text-facebook mb-20"><i class="fab fa-facebook-f text-primary"></i></h2>
				<h3 class="text-facebook fw-700">6,750</h3>
				<p>Likes</p>
				<p class="mb-0 mt-15"><i class="fas fa-caret-up mr-10 f-18 text-green"></i>223 from last 7 days</p>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6 mt-2">
		<div class="card social-card">
			<div class="card-body text-center">
				<h2 class="text-twitter mb-20"><i class="fab fa-twitter text-info"></i></h2>
				<h3 class="text-twitter fw-700">9,752</h3>
				<p>Tweets</p>
				<p class="mb-0 mt-15"><i class="fas fa-caret-up mr-10 f-18 text-green"></i>623 from last 7 days</p>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6 mt-2">
		<div class="card social-card">
			<div class="card-body text-center">
				<h2 class="text-dribbble mb-20"><i class="fab fa-dribbble text-danger"></i></h2>
				<h3 class="text-dribbble fw-700">8,752</h3>
				<p>Followers</p>
				<p class="mb-0 mt-15"><i class="fas fa-caret-up mr-10 f-18 text-green"></i>623 from last 7 days</p>
			</div>
		</div>
	</div>
	<div class="col-xl-3 col-md-6 mt-2">
		<div class="card social-card">
			<div class="card-body text-center">
				<h2 class="text-linkedin mb-20"><i class="fab fa-linkedin-in text-warning"></i></h2>
				<h3 class="text-linkedin fw-700">952</h3>
				<p>Followers</p>
				<p class="mb-0 mt-15"><i class="fas fa-caret-down mr-10 f-18 text-red"></i>98 from last 7 days</p>
			</div>
		</div>
	</div>
	<!-- project-ticket end -->

	</div>

</div>
