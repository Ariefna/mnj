<html>
<head>
	<title>Print kwitansi {{kwitansiNo}}</title>
	<style type="text/css">
			.lead {
				font-family: "Verdana";
				font-weight: bold;
			}
			.value {
				font-family: "Verdana";
			}
			.value-big {
				font-family: "Verdana";
				font-weight: bold;
				font-size: large;
			}
			.td {
				valign : "top";
			}
			input[type=text] {
				border: none;
			}
			#colspan {
				width: 100%;
			}
			/* @page { size: with x height */
			/*@page { size: 20cm 10cm; margin: 0px; }*/
			@page {
				size: A4;
				margin : 0px;
			}
			@media print {
			  html, body {
			  	width: 210mm;
			  }
			}
			/*body { border: 2px solid #000000;  }*/
	</style>
	<!-- <script type="text/javascript">
		var beforePrint = function() {
		};
		var afterPrint = function() {
			document.location.href = '/{{hospitalName}}';
		};
		if (window.matchMedia) {
			var mediaQueryList = window.matchMedia('print');
			mediaQueryList.addListener(function(mql) {
				if (mql.matches) {
					beforePrint();
				} else {
					afterPrint();
				}
			});
		}
		window.onbeforeprint = beforePrint;
		window.onafterprint = afterPrint;
    </script> -->
</head>
<body>
	<table border="0px">
		<tr>
			<td width="80px"><img src="img/lentera.png" width="80px" /></td>
			<td>
				<table cellpadding="4" border="0">
					<tr>
						<td><table><tr><td>No. Inv</td><td><input type="text" name=""></td></tr></table></td>
						<td><table><tr><td>No. SP</td><td><input type="text" name=""></td></tr></table></td>
						<td><table><tr><td>No. Kuitansi</td><td><input type="text" name=""></td></tr></table></td>
					</tr>
					<tr>
						<td>Sudah terima dari</td>
						<td colspan="2"><input id="colspan" type="text" name=""></td>
					</tr>
					<tr>
						<td>Jumlah Uang</td>
						<td colspan="2"><input id="colspan" type="text" name=""></td>
					</tr>
					<tr>
						<td>Untuk Pembayaran</td>
						<td colspan="2"><input id="colspan" type="text" name=""></td>
					</tr>
					
				</table>
			</td>
		</tr>
	</table>
	<script src="/js/jquery.min.js"></script>
	<script type="text/javascript">
		
			// window.print();
		
	</script>
</body>
</html>