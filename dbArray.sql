DROP TABLE history_backup;

CREATE TABLE `history_backup` (
  `id_backup` int(15) NOT NULL AUTO_INCREMENT,
  `nama_file` varchar(50) NOT NULL,
  `tanggal_backup` varchar(20) NOT NULL,
  PRIMARY KEY (`id_backup`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

INSERT INTO history_backup VALUES("39","Wed15Dec2010_backup_data_1292387890.sql","2010-12-15 11:38:10");



DROP TABLE jurnal_keluar;

CREATE TABLE `jurnal_keluar` (
  `nomor_jurnal` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_selesai` varchar(20) NOT NULL,
  PRIMARY KEY (`nomor_jurnal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE jurnal_umum;

CREATE TABLE `jurnal_umum` (
  `nomor_jurnal` int(15) NOT NULL,
  `kode_transaksi` varchar(15) NOT NULL,
  `tanggal_selesai` varchar(20) NOT NULL,
  PRIMARY KEY (`nomor_jurnal`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;




DROP TABLE tabel_admin;

CREATE TABLE `tabel_admin` (
  `id_admin` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

INSERT INTO tabel_admin VALUES("1","Arief Nur Abdullah","admin","21232f297a57a5a743894a0e4a801fc3","2019-08-06 01:41:40");



DROP TABLE tabel_master;

CREATE TABLE `tabel_master` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` date NOT NULL,
  `awal_debet` varchar(20) NOT NULL,
  `awal_kredit` varchar(20) NOT NULL,
  `mut_debet` varchar(20) NOT NULL,
  `mut_kredit` varchar(20) NOT NULL,
  `sisa_debet` varchar(20) NOT NULL,
  `sisa_kredit` varchar(20) NOT NULL,
  `rl_debet` varchar(20) NOT NULL,
  `rl_kredit` varchar(20) NOT NULL,
  `nrc_debet` varchar(20) NOT NULL,
  `nrc_kredit` varchar(20) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL,
  `subacct` varchar(12) NOT NULL,
  PRIMARY KEY (`kode_rekening`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tabel_master VALUES("1101.01.09","KAS BESAR","2019-02-14","0","0","181794763","200459000","0","18664237","0","0","0","18664237","neraca","debet","KAS");
INSERT INTO tabel_master VALUES("1102.01.09","BG- RUPIAH - BCA PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.02.09","BG- RUPIAH - BANK MANDIRI","2019-02-14","1169000","0","10353331827","12277660600","0","1923159773","0","0","0","1923159773","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.03.09","BG- RUPIAH - BPD JATIM","2019-02-14","3531659","0","0","0","3531659","0","0","0","3531659","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.04.09","BG- RUPIAH - BANK BRI","2019-02-14","453326","0","0","0","453326","0","0","0","453326","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.05.09","BG- RUPIAH - BPD PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.06.09","BG- RUPIAH - UMKR JATIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1102.07.09","TAB. BANK RAKYAT INDONESIA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","BANK");
INSERT INTO tabel_master VALUES("1104.00.09","DEPOSITO-RUPIAH-BANK HARFA","2019-02-14","-1920654","0","0","0","0","1920654","0","0","0","1920654","neraca","debet","DEPOSITO");
INSERT INTO tabel_master VALUES("1105.00.09","PIUTANG USAHA","2019-02-14","3537644400.02751","0","51677365","4103160728","0","513838962.97249","0","0","0","513838962.97249","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1106.00.09","PENYISIHAN PIUTANG TK. TERTAG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1107.04.09","PIUTANG BON SEMENTARA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1107.05.09","PENDAPATAN YMA DITERIMA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1107.50.09","PIUTANG LAIN-LAIN","2019-02-14","25000000","0","0","0","25000000","0","0","0","25000000","0","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1107.99.09","PENYI.PIUT.LAIN2 TAK TERTAGIH","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PIUTANG");
INSERT INTO tabel_master VALUES("1108.02.09","PERSEDIAAN BARANG JADI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.03.09","PERSEDIAAN BARANG DLM PROSES","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.04.09","PERSEDIAAN BAHAN BAKU SIAP PK","2019-02-14","18147743041","0","0","7911978611","10235764430","0","0","0","10235764430","0","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.06.09","PERSEDIAAN BAHAN PEMBANTU","2019-02-14","373989562","0","0","1003615876","0","629626314","0","0","0","629626314","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.07.09","PERSEDIAAN ALAT-ALAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.09.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1113.01.09","UANG MUKA PPN MASUKAN","2019-02-14","5343732903","0","0","2224192435","3119540468","0","0","0","3119540468","0","neraca","debet","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.02.09","UANG MUKA PPH PS. 21","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.03.09","UANG MUKA PPH PS. 22","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.04.09","UANG MUKA PPH. 23","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.05.09","UANG MUKA PPH PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1114.02.09","SEWA DIBAYAR DIMUKA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.04.09","UANG MUKA PESANAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.06.09","UANG MUKA PELKS. ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.99.09","UANG MUKA BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1201.01.09","PIUTANG KERJASAMA OPS","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","PIUTANG LAIN");
INSERT INTO tabel_master VALUES("1302.00.09","AKTIVA PAJAK TANGGUHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA TIDAK");
INSERT INTO tabel_master VALUES("1401.01.09","TANAH","2019-02-14","1990940000","0","0","0","1990940000","0","0","0","1990940000","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.01.09","BANGUNAN PABRIK","2019-02-14","538603375","0","0","0","538603375","0","0","0","538603375","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.51.09","AKM.PENY. BANGUNAN PABRIK","2019-02-14","0","0","1064376","0","1064376","0","0","0","1064376","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.53.09","AKM.PENY. BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1403.01.09","MESIN PRODUKSI","2019-02-14","3947286901","0","0","0","3947286901","0","0","0","3947286901","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1403.51.09","AKM.PENY. MESIN PRODUKSI","2019-02-14","0","0","10645013","0","10645013","0","0","0","10645013","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1404.01.09","KENDARAAN PABRIK","2019-02-14","274651682","0","0","0","274651682","0","0","0","274651682","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1404.51.09","AKM.PENY. KENDARAAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.01.09","PERALATAN PABRIK","2019-02-14","91290584","0","0","0","91290584","0","0","0","91290584","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.02.09","PERALATAN KANTOR","2019-02-14","321245131","0","0","0","321245131","0","0","0","321245131","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.51.09","AKM.PENY. PERALATAN PABRIK","2019-02-14","0","0","52497","0","52497","0","0","0","52497","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.52.09","AKM.PENY. PERALATAN KANTOR","2019-02-14","0","0","852217","0","852217","0","0","0","852217","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1701.02.09","BANGUNAN PABRIK KARANGPILANG","2019-02-14","0","0","0","30100000","0","30100000","0","0","0","30100000","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1701.05.09","PEMASANGAN MESIN KARANGPILANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1704.99.09","BEBAN LAIN YANG DITANGGUHKAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1705.01.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1705.99.09","CAD.PENURUNAN PERSEDIAAN LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1706.01.09","PIUTANG USAHA MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1706.02.09","PIUTANG LAIN-LAIN MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","UANG MUKA LA");
INSERT INTO tabel_master VALUES("1706.51.09","CAD.PENURUNAN PIUT. MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("2101.01.09","HUTANG KREDIT MODAL KERJA BCA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","HUTANG BANK");
INSERT INTO tabel_master VALUES("2101.02.09","HUTANG KREDIT MODAL KERJA BRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","TOTAL HUTANG");
INSERT INTO tabel_master VALUES("2103.00.09","HUTANG USAHA SWASTA","2019-02-14","0","775340151","11139786922","9066550173","1297896598","0","0","0","1297896598","0","neraca","kredit","HUTANG LANCA");
INSERT INTO tabel_master VALUES("2104.01.09","GAJI YMH DIBAYAR","2019-02-14","0","190486989","12000000","124424000","0","302910989","0","0","0","302910989","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.02.09","BEBAN PESANGON/MANFAAT KARY","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.04.09","LISTRIK/TELPON/PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.07.09","PERJALANAN DINAS","2019-02-14","0","-99999999.328125","0","0","99999999.328125","0","0","0","99999999.328125","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.10.09","FABRIKASI","2019-02-14","0","104456757.2","1000000","0","0","103456757.2","0","0","0","103456757.2","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.12.09","ORDER KHUSUS TL. AGUNG","2019-02-14","0","85896817","0","0","0","85896817","0","0","0","85896817","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.13.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","31063305","0","0","0","31063305","0","0","0","31063305","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.14.09","ASTEK","2019-02-14","0","425641962","0","0","0","425641962","0","0","0","425641962","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.15.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","16878627551.9273","46923617","412994191","0","17244698125.927","0","0","0","17244698125.927","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.16.09","THR YMH DIBAYAR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.99.09","LAIN-LAIN","2019-02-14","0","-67218242","20000000","20000000","67218242","0","0","0","67218242","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2105.01.09","PPN KELUARAN","2019-02-14","0","407231936.894894","8329360","0","0","398902576.89489","0","0","0","398902576.89489","neraca","kredit","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.02.09","PPH PS. 21/PPh PS.23","2019-02-14","0","1214735","0","0","0","1214735","0","0","0","1214735","neraca","kredit","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.03.09","PPh. PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.04.09","HUTANG PBB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2106.00.09","UANG MUKA PENJUALAN","2019-02-14","0","0","15000000","0","15000000","0","0","0","15000000","0","neraca","kredit","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.03.09","HUTANG SUB KONTRAKTOR","2019-02-14","0","0","648356898","50000000","598356898","0","0","0","598356898","0","neraca","kredit","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.50.09","HUTANG LAIN-LAIN","2019-02-14","0","15000000","12262418235","435000000","11812418235","0","0","0","11812418235","0","neraca","kredit","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2199.00.09","R/K DIREKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","REKENING ANT");
INSERT INTO tabel_master VALUES("2203.00.09","BANK","2019-02-14","0","2972000000","0","0","0","2972000000","0","0","0","2972000000","neraca","kredit","HUTANG");
INSERT INTO tabel_master VALUES("2203.02.09","BANK MANDIRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","HUTANG");
INSERT INTO tabel_master VALUES("2205.02.09","KEWAJIBAN BEBAN MANFAAT","2019-02-14","0","133137406","0","0","0","133137406","0","0","0","133137406","neraca","kredit","KEWAJIBAN JK");
INSERT INTO tabel_master VALUES("3101.03.09","MODAL LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","MODAL");
INSERT INTO tabel_master VALUES("3102.02.09","MBD - SAHAM BIASA","2019-02-14","0","2200000000","0","0","0","2200000000","0","0","0","2200000000","neraca","kredit","MODAL");
INSERT INTO tabel_master VALUES("3104.02.09","MDD - SAHAM BIASA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit","MODAL");
INSERT INTO tabel_master VALUES("3401.01.09","LABA/RUGI THN SEBELUMNYA","2019-02-14","0","-7922837477.65187","0","0","7922837477.6519","0","0","0","7922837477.6519","0","neraca","kredit","LABA/RUGI");
INSERT INTO tabel_master VALUES("3402.01.09","LABA/RUGI THN BERJALAN","2019-02-14","0","2932756183.40802","0","0","0","2932756183.408","0","0","0","2932756183.408","neraca","kredit","LABA/RUGI");
INSERT INTO tabel_master VALUES("4101.09","PT. PANCA PUJIBANGUN","2019-02-14","0","0","4094831368","0","4094831368","0","4094831368","0","0","0","rugi-laba","debet","PENJUALAN");
INSERT INTO tabel_master VALUES("5101.09","PERSEDIAAN DALAM PROSES AWAL","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN POKOK");
INSERT INTO tabel_master VALUES("5102.09","PERSEDIAAN DALAM PROSES AKHIR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN POKOK");
INSERT INTO tabel_master VALUES("5200.01.09","BEBAN ORDER KHUSUS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN LANGSU");
INSERT INTO tabel_master VALUES("5200.02.09","BEBAN ORDER KHUSUS PAKET A-B","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN KHUSUS");
INSERT INTO tabel_master VALUES("5200.09","LANGSUNG USAHA","2019-02-14","0","0","0","813564478","0","813564478","0","813564478","0","0","rugi-laba","debet","BEBAN LANGSU");
INSERT INTO tabel_master VALUES("5300.09","PEMAKAIAN BAHAN BAKU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BAHAN BAKU");
INSERT INTO tabel_master VALUES("5401.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5403.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5404.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5405.09","BIAYA KONSUMSI","2019-02-14","0","0","0","812000","0","812000","0","812000","0","0","rugi-laba","debet","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5406.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5407.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5408.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5410.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5414.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5416.09","BONUS/TATIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5500.09","BAHAN BANTU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BI. BAHAN BA");
INSERT INTO tabel_master VALUES("5601.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5603.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5604.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5605.09","BIAYA KONSUMSI","2019-02-14","0","0","0","280000","0","280000","0","280000","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5606.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5607.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5608.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5610.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5614.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5616.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5702.09","PERB.& PEMEL.BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5704.09","PERB.& PEMEL.MESIN PRODUKSI","2019-02-14","0","0","0","39379000","0","39379000","0","39379000","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5707.09","PERB.& PEMEL.KEND.PABRIK","2019-02-14","0","0","0","631804","0","631804","0","631804","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5708.09","PEMELIHARAAN PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5711.09","BIAYA PENY.BANGUNAN PABRIK","2019-02-14","0","0","0","1064376","0","1064376","0","1064376","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5713.09","BIAYA PENY.MESIN PRODUKSI","2019-02-14","0","0","0","10645013","0","10645013","0","10645013","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5717.09","BIAYA PENY.PERALATAN PABRIK","2019-02-14","0","0","0","52497","0","52497","0","52497","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5720.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5721.09","CETAKAN,ATK","2019-02-14","0","0","0","23000","0","23000","0","23000","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5722.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5723.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5726.09","BIAYA SEWA MESIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5727.09","BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("6101.09","GAJI/UAPH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6105.09","KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6202.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6206.09","BEBAN LAIN-LAIN PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6302.09","PEMEL. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6305.09","PENY. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6401.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6402.09","CETAKAN,ATK","2019-02-14","0","0","0","288000","0","288000","0","288000","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6403.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6405.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6406.09","BIAYA PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6407.09","PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6408.09","ONGKOS KIRIM/PACKING","2019-02-14","0","0","0","25569000","0","25569000","0","25569000","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6409.09","IKLAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6410.09","PROMOSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6411.09","TENDER PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6412.09","PENGURUSAN/PENCARIAN ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6413.09","BEBAN PENGURUSAN PENAGIHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6414.09","BIAYA CLAIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("7101.09","GAJI/UPAH","2019-02-14","0","0","0","12000000","0","12000000","0","12000000","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","1780659","0","1780659","0","1780659","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7105.09","KONSUMSI","2019-02-14","0","0","0","450329","0","450329","0","450329","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","9572881","0","9572881","0","9572881","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7109.09","TUNJANGAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN.ADM & ");
INSERT INTO tabel_master VALUES("7110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7115.09","BIAYA TRAINING","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7201.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7202.09","REK.AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7205.09","BIAYA SEWA GEDUNG","2019-02-14","0","0","0","25000000","0","25000000","0","25000000","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7206.09","BEBAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7303.09","PERB.& PEMEL.BANG.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7304.09","PERB.& PEMEL.KEND.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7305.09","PERB.& PEMEL.PERALATAN KTR","2019-02-14","0","0","0","5213290","0","5213290","0","5213290","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7306.09","PERB.& PEMEL.PERABOT KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7308.09","PENY.BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7310.09","PENY.PERALATAN KANTOR","2019-02-14","0","0","0","852217","0","852217","0","852217","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7406.09","TELP,TELEX,INTERLOKAL,VHF","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7407.09","CETAKAN,ATK/FOTO COPY","2019-02-14","0","0","0","750300","0","750300","0","750300","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7409.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7410.09","REPRESENTASI,SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7411.09","PBB/STNK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7412.09","BEBAN KANTOR LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7413.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7414.09","BEBAN PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7415.09","BEBAN PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7416.09","IURAN-IURAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7417.09","BEBAN IURAN/SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7418.09","BEBAN KONSULTAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7419.09","BEBAN KONSULTAN (AUDIT,PERPAJA","2019-02-14","0","0","0","19000000","0","19000000","0","19000000","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7420.09","BEBAN KERUGIAN PIUTANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7421.09","BEBAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("8101.09","JASA GIRO","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8103.09","PENDAPATAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8199.09","PENDPT DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8201.09","ADMINISTRASI BANK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8202.09","BEBAN PENDIDIKAN DAN LATIHAN","2019-02-14","0","0","0","1000000","0","1000000","0","1000000","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8204.09","MANAGEMENT FEE","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8206.09","BEBAN BUNGA BANK","2019-02-14","0","0","0","20000000","0","20000000","0","20000000","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8207.09","BEBAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8211.09","BEBAN DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("1101.03.09","Pos Silang Kas Bank","2019-08-05","0","0","0","0","0","0","0","0","0","0","neraca","debet","KAS");
INSERT INTO tabel_master VALUES("2104.05.09","Bunga Pinjaman","2019-08-05","0","0","0","0","0","0","0","0","0","0","neraca","kredit","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.06.09","Bunga Pinjaman","2019-08-05","0","56443014.6","0","0","0","0","0","0","0","0","0","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.08.09","Biaya PBB","2019-08-05","0","803888223","0","0","0","0","0","0","0","0","0","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.09.09","Biaya PBB","2019-08-05","0","0","0","0","0","0","0","0","0","0","0","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2198.54.09","Hutang Ibu ChinChin","2019-08-05","0","600000000","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.55.09","Hutang Dya Grafika","2019-08-05","0","206775200","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.56.09","Hutang Pemasaran","2019-08-05","0","326827218","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.57.09","Hutang PT Intan Pariwara","2019-08-05","0","1870797014","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.58.09","Hutang Titian ilmu","2019-08-05","0","23260909","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.59.09","Hutang Yudistira","2019-08-05","0","-880736762","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.60.09","Hutang Bpk Nanang","2019-08-05","0","1768937148","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.61.09","Hutang Telkom","2019-08-05","0","4037632113.97727","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.62.09","Hutang Bpk Nasir","2019-08-05","0","0","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.63.09","Hutang IEWJ","2019-08-05","0","1173684548","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.64.09","Hutang Balebat","2019-08-05","0","0","0","0","0","0","0","0","0","0","0","0","HUTANG UANG ");



DROP TABLE tabel_neraca;

CREATE TABLE `tabel_neraca` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` varchar(12) NOT NULL,
  `awal_debet` int(15) NOT NULL,
  `awal_kredit` int(15) NOT NULL,
  `mut_debet` int(15) NOT NULL,
  `mut_kredit` int(15) NOT NULL,
  `sisa_debet` int(15) NOT NULL,
  `sisa_kredit` int(15) NOT NULL,
  `rl_debet` int(15) NOT NULL,
  `rl_kredit` int(15) NOT NULL,
  `nrc_debet` int(15) NOT NULL,
  `nrc_kredit` int(15) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_rekening`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tabel_neraca VALUES("1101.01.09","KAS BESAR","2019-02-14","0","0","181794763","200459000","0","18664237","0","0","0","18664237","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.01.09","BG- RUPIAH - BCA PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.02.09","BG- RUPIAH - BANK MANDIRI","2019-02-14","1169000","0","2147483647","2147483647","0","1923159773","0","0","0","1923159773","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.03.09","BG- RUPIAH - BPD JATIM","2019-02-14","3531659","0","0","0","3531659","0","0","0","3531659","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.04.09","BG- RUPIAH - BANK BRI","2019-02-14","453326","0","0","0","453326","0","0","0","453326","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.05.09","BG- RUPIAH - BPD PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.06.09","BG- RUPIAH - UMKR JATIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1102.07.09","TAB. BANK RAKYAT INDONESIA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1104.00.09","DEPOSITO-RUPIAH-BANK HARFA","2019-02-14","-1920654","0","0","0","0","1920654","0","0","0","1920654","neraca","debet");
INSERT INTO tabel_neraca VALUES("1105.00.09","PIUTANG USAHA","2019-02-14","2147483647","0","51677365","2147483647","0","513838963","0","0","0","513838963","neraca","debet");
INSERT INTO tabel_neraca VALUES("1106.00.09","PENYISIHAN PIUTANG TK. TERTAG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1107.04.09","PIUTANG BON SEMENTARA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1107.05.09","PENDAPATAN YMA DITERIMA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1107.50.09","PIUTANG LAIN-LAIN","2019-02-14","25000000","0","0","0","25000000","0","0","0","25000000","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1107.99.09","PENYI.PIUT.LAIN2 TAK TERTAGIH","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.02.09","PERSEDIAAN BARANG JADI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.03.09","PERSEDIAAN BARANG DLM PROSES","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.04.09","PERSEDIAAN BAHAN BAKU SIAP PK","2019-02-14","2147483647","0","0","2147483647","2147483647","0","0","0","2147483647","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.06.09","PERSEDIAAN BAHAN PEMBANTU","2019-02-14","373989562","0","0","1003615876","0","629626314","0","0","0","629626314","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.07.09","PERSEDIAAN ALAT-ALAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1108.09.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1113.01.09","UANG MUKA PPN MASUKAN","2019-02-14","2147483647","0","0","2147483647","2147483647","0","0","0","2147483647","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1113.02.09","UANG MUKA PPH PS. 21","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1113.03.09","UANG MUKA PPH PS. 22","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1113.04.09","UANG MUKA PPH. 23","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1113.05.09","UANG MUKA PPH PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1114.02.09","SEWA DIBAYAR DIMUKA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1114.04.09","UANG MUKA PESANAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1114.06.09","UANG MUKA PELKS. ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1114.99.09","UANG MUKA BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1201.01.09","PIUTANG KERJASAMA OPS","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1302.00.09","AKTIVA PAJAK TANGGUHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1401.01.09","TANAH","2019-02-14","1990940000","0","0","0","1990940000","0","0","0","1990940000","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1402.01.09","BANGUNAN PABRIK","2019-02-14","538603375","0","0","0","538603375","0","0","0","538603375","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1402.51.09","AKM.PENY. BANGUNAN PABRIK","2019-02-14","0","0","1064376","0","1064376","0","0","0","1064376","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1402.53.09","AKM.PENY. BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1403.01.09","MESIN PRODUKSI","2019-02-14","2147483647","0","0","0","2147483647","0","0","0","2147483647","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1403.51.09","AKM.PENY. MESIN PRODUKSI","2019-02-14","0","0","10645013","0","10645013","0","0","0","10645013","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1404.01.09","KENDARAAN PABRIK","2019-02-14","274651682","0","0","0","274651682","0","0","0","274651682","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1404.51.09","AKM.PENY. KENDARAAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1405.01.09","PERALATAN PABRIK","2019-02-14","91290584","0","0","0","91290584","0","0","0","91290584","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1405.02.09","PERALATAN KANTOR","2019-02-14","321245131","0","0","0","321245131","0","0","0","321245131","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1405.51.09","AKM.PENY. PERALATAN PABRIK","2019-02-14","0","0","52497","0","52497","0","0","0","52497","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1405.52.09","AKM.PENY. PERALATAN KANTOR","2019-02-14","0","0","852217","0","852217","0","0","0","852217","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1701.02.09","BANGUNAN PABRIK KARANGPILANG","2019-02-14","0","0","0","30100000","0","30100000","0","0","0","30100000","neraca","debet");
INSERT INTO tabel_neraca VALUES("1701.05.09","PEMASANGAN MESIN KARANGPILANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1704.99.09","BEBAN LAIN YANG DITANGGUHKAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1705.01.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1705.99.09","CAD.PENURUNAN PERSEDIAAN LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1706.01.09","PIUTANG USAHA MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1706.02.09","PIUTANG LAIN-LAIN MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("1706.51.09","CAD.PENURUNAN PIUT. MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("2101.01.09","HUTANG KREDIT MODAL KERJA BCA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2101.02.09","HUTANG KREDIT MODAL KERJA BRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2103.00.09","HUTANG USAHA SWASTA","2019-02-14","0","775340151","2147483647","2147483647","1297896598","0","0","0","1297896598","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.01.09","GAJI YMH DIBAYAR","2019-02-14","0","190486989","12000000","124424000","0","302910989","0","0","0","302910989","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.02.09","BEBAN PESANGON/MANFAAT KARY","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.04.09","LISTRIK/TELPON/PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.07.09","PERJALANAN DINAS","2019-02-14","0","-99999999","0","0","99999999","0","0","0","99999999","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.10.09","FABRIKASI","2019-02-14","0","104456757","1000000","0","0","103456757","0","0","0","103456757","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.12.09","ORDER KHUSUS TL. AGUNG","2019-02-14","0","85896817","0","0","0","85896817","0","0","0","85896817","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.13.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","31063305","0","0","0","31063305","0","0","0","31063305","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.14.09","ASTEK","2019-02-14","0","425641962","0","0","0","425641962","0","0","0","425641962","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.15.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","2147483647","46923617","412994191","0","2147483647","0","0","0","2147483647","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.16.09","THR YMH DIBAYAR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2104.99.09","LAIN-LAIN","2019-02-14","0","-67218242","20000000","20000000","67218242","0","0","0","67218242","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2105.01.09","PPN KELUARAN","2019-02-14","0","407231937","8329360","0","0","398902577","0","0","0","398902577","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2105.02.09","PPH PS. 21/PPh PS.23","2019-02-14","0","1214735","0","0","0","1214735","0","0","0","1214735","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2105.03.09","PPh. PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2105.04.09","HUTANG PBB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2106.00.09","UANG MUKA PENJUALAN","2019-02-14","0","0","15000000","0","15000000","0","0","0","15000000","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2198.03.09","HUTANG SUB KONTRAKTOR","2019-02-14","0","0","648356898","50000000","598356898","0","0","0","598356898","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2198.50.09","HUTANG LAIN-LAIN","2019-02-14","0","15000000","2147483647","435000000","2147483647","0","0","0","2147483647","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2199.00.09","R/K DIREKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2203.00.09","BANK","2019-02-14","0","2147483647","0","0","0","2147483647","0","0","0","2147483647","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2203.02.09","BANK MANDIRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("2205.02.09","KEWAJIBAN BEBAN MANFAAT","2019-02-14","0","133137406","0","0","0","133137406","0","0","0","133137406","neraca","kredit");
INSERT INTO tabel_neraca VALUES("3101.03.09","MODAL LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("3102.02.09","MBD - SAHAM BIASA","2019-02-14","0","2147483647","0","0","0","2147483647","0","0","0","2147483647","neraca","kredit");
INSERT INTO tabel_neraca VALUES("3104.02.09","MDD - SAHAM BIASA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("3401.01.09","LABA/RUGI THN SEBELUMNYA","2019-02-14","0","-2147483648","0","0","2147483647","0","0","0","2147483647","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("3402.01.09","LABA/RUGI THN BERJALAN","2019-02-14","0","2147483647","0","0","0","2147483647","0","0","1159554803","0","neraca","kredit");
INSERT INTO tabel_neraca VALUES("1101.03.09","Pos Silang Kas Bank","2019-08-05","0","0","0","0","0","0","0","0","0","0","neraca","debet");
INSERT INTO tabel_neraca VALUES("2104.05.09","Bunga Pinjaman","2019-08-05","0","0","0","0","0","0","0","0","0","0","neraca","kredit");



DROP TABLE tabel_profil;

CREATE TABLE `tabel_profil` (
  `nama_perusahaan` varchar(30) NOT NULL,
  `gedung` varchar(30) NOT NULL,
  `jalan` varchar(30) NOT NULL,
  `kelurahan` varchar(30) NOT NULL,
  `kecamatan` varchar(30) NOT NULL,
  `propinsi` varchar(15) NOT NULL,
  `negara` varchar(15) NOT NULL,
  `telpon` varchar(12) NOT NULL,
  `fax` varchar(12) NOT NULL,
  `email` varchar(20) NOT NULL,
  `website` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tabel_profil VALUES("Koperasi Bersama","Menara Sarbini","Jl. Salak VII","Abadijaya","Sukmajaya","Jabar","Indonesia","0217703964","0217703964","sumarna_agus@yahoo.c","http://ri32.wordpres");



DROP TABLE tabel_rugi_laba;

CREATE TABLE `tabel_rugi_laba` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` varchar(12) NOT NULL,
  `awal_debet` int(15) NOT NULL,
  `awal_kredit` int(15) NOT NULL,
  `mut_debet` int(15) NOT NULL,
  `mut_kredit` int(15) NOT NULL,
  `sisa_debet` int(15) NOT NULL,
  `sisa_kredit` int(15) NOT NULL,
  `rl_debet` int(15) NOT NULL,
  `rl_kredit` int(15) NOT NULL,
  `nrc_debet` int(15) NOT NULL,
  `nrc_kredit` int(15) NOT NULL,
  `posisi` varchar(15) NOT NULL,
  `normal` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_rekening`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tabel_rugi_laba VALUES("4101.09","PT. PANCA PUJIBANGUN","2019-02-14","0","0","2147483647","0","2147483647","0","2147483647","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5101.09","PERSEDIAAN DALAM PROSES AWAL","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5102.09","PERSEDIAAN DALAM PROSES AKHIR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5200.01.09","BEBAN ORDER KHUSUS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5200.02.09","BEBAN ORDER KHUSUS PAKET A-B","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5200.09","LANGSUNG USAHA","2019-02-14","0","0","0","813564478","0","813564478","0","813564478","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5300.09","PEMAKAIAN BAHAN BAKU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5401.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5403.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5404.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5405.09","BIAYA KONSUMSI","2019-02-14","0","0","0","812000","0","812000","0","812000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5406.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5407.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5408.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5410.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5414.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5416.09","BONUS/TATIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5500.09","BAHAN BANTU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5601.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5603.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5604.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5605.09","BIAYA KONSUMSI","2019-02-14","0","0","0","280000","0","280000","0","280000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5606.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5607.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5608.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5610.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5614.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5616.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5702.09","PERB.& PEMEL.BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5704.09","PERB.& PEMEL.MESIN PRODUKSI","2019-02-14","0","0","0","39379000","0","39379000","0","39379000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5707.09","PERB.& PEMEL.KEND.PABRIK","2019-02-14","0","0","0","631804","0","631804","0","631804","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5708.09","PEMELIHARAAN PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5711.09","BIAYA PENY.BANGUNAN PABRIK","2019-02-14","0","0","0","1064376","0","1064376","0","1064376","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5713.09","BIAYA PENY.MESIN PRODUKSI","2019-02-14","0","0","0","10645013","0","10645013","0","10645013","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5717.09","BIAYA PENY.PERALATAN PABRIK","2019-02-14","0","0","0","52497","0","52497","0","52497","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5720.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5721.09","CETAKAN,ATK","2019-02-14","0","0","0","23000","0","23000","0","23000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5722.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5723.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5726.09","BIAYA SEWA MESIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("5727.09","BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6101.09","GAJI/UAPH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6105.09","KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6202.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6206.09","BEBAN LAIN-LAIN PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6302.09","PEMEL. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6305.09","PENY. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6401.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6402.09","CETAKAN,ATK","2019-02-14","0","0","0","288000","0","288000","0","288000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6403.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6405.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6406.09","BIAYA PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6407.09","PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6408.09","ONGKOS KIRIM/PACKING","2019-02-14","0","0","0","25569000","0","25569000","0","25569000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6409.09","IKLAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6410.09","PROMOSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6411.09","TENDER PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6412.09","PENGURUSAN/PENCARIAN ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6413.09","BEBAN PENGURUSAN PENAGIHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("6414.09","BIAYA CLAIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7101.09","GAJI/UPAH","2019-02-14","0","0","0","12000000","0","12000000","0","12000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","1780659","0","1780659","0","1780659","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7105.09","KONSUMSI","2019-02-14","0","0","0","450329","0","450329","0","450329","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","9572881","0","9572881","0","9572881","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7109.09","TUNJANGAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7115.09","BIAYA TRAINING","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7201.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7202.09","REK.AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7205.09","BIAYA SEWA GEDUNG","2019-02-14","0","0","0","25000000","0","25000000","0","25000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7206.09","BEBAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7303.09","PERB.& PEMEL.BANG.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7304.09","PERB.& PEMEL.KEND.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7305.09","PERB.& PEMEL.PERALATAN KTR","2019-02-14","0","0","0","5213290","0","5213290","0","5213290","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7306.09","PERB.& PEMEL.PERABOT KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7308.09","PENY.BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7310.09","PENY.PERALATAN KANTOR","2019-02-14","0","0","0","852217","0","852217","0","852217","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7406.09","TELP,TELEX,INTERLOKAL,VHF","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7407.09","CETAKAN,ATK/FOTO COPY","2019-02-14","0","0","0","750300","0","750300","0","750300","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7409.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7410.09","REPRESENTASI,SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7411.09","PBB/STNK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7412.09","BEBAN KANTOR LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7413.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7414.09","BEBAN PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7415.09","BEBAN PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7416.09","IURAN-IURAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7417.09","BEBAN IURAN/SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7418.09","BEBAN KONSULTAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7419.09","BEBAN KONSULTAN (AUDIT,PERPAJA","2019-02-14","0","0","0","19000000","0","19000000","0","19000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7420.09","BEBAN KERUGIAN PIUTANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("7421.09","BEBAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8101.09","JASA GIRO","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit");
INSERT INTO tabel_rugi_laba VALUES("8103.09","PENDAPATAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit");
INSERT INTO tabel_rugi_laba VALUES("8199.09","PENDPT DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit");
INSERT INTO tabel_rugi_laba VALUES("8201.09","ADMINISTRASI BANK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8202.09","BEBAN PENDIDIKAN DAN LATIHAN","2019-02-14","0","0","0","1000000","0","1000000","0","1000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8204.09","MANAGEMENT FEE","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8206.09","BEBAN BUNGA BANK","2019-02-14","0","0","0","20000000","0","20000000","0","20000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8207.09","BEBAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("8211.09","BEBAN DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("III","JUMLAH PENDAPATAN","","0","0","0","0","0","0","0","2147483647","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("IV","JUMLAH BIAYA","","0","0","0","0","0","0","987928844","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("V","Sisa Hasil Usaha Tahun Berjalan","","0","0","0","0","0","0","1159554803","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("VI","Total Balance","","0","0","0","0","0","0","2147483647","2147483647","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("VII","TAHUN PERIODE","2019","0","0","0","0","0","0","0","0","0","0","","");



DROP TABLE tabel_transaksi;

CREATE TABLE `tabel_transaksi` (
  `id_transaksi` int(15) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(15) NOT NULL,
  `kode_rekening` varchar(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jenis_transaksi` varchar(15) NOT NULL,
  `keterangan_transaksi` text NOT NULL,
  `debet` int(15) NOT NULL,
  `kredit` int(15) NOT NULL,
  `tanggal_posting` date NOT NULL,
  `keterangan_posting` varchar(10) NOT NULL,
  `Kode_Pelanggan` varchar(15) NOT NULL,
  `id_admin` int(4) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=MyISAM AUTO_INCREMENT=1075 DEFAULT CHARSET=latin1;

INSERT INTO tabel_transaksi VALUES("721","0069/BK/19","1102.02.09","2019-01-29","0069/BK/19","PEMBY.DP SEWA FORKLIP PROYEK KPU","10000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("718","0067/BK/19","7419.09","2019-01-29","0067/BK/19","PEMBY.ANGSURAN 1 BIAYA KONSULTAN BP.ABD.MUBAROK","0","12000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("714","0053/BK/19","2103.00.09","2019-01-25","0053/BK/19","PEMBY.MEKA BOX KARDUS PROYEK KPU","0","148365147","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("713","0053/BK/19","1102.02.09","2019-01-25","0053/BK/19","PEMBY.MEKA BOX KARDUS PROYEK KPU","148365147","0","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("711","0037/BK/19","1102.02.09","2019-01-18","0037/BK/19","PEMBY.BUDI MITRA JAYA KERTAS KPU","2147483647","0","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("710","0037/BK/19","2103.00.09","2019-01-18","0037/BK/19","PEMBY.BUDI MITRA JAYA KERTAS KPU","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("706","0010/MM/19","2104.01.09","2019-01-31","0010/MM/19","BIAYA GAJI KOMISARIS","12000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("705","0010/MM/19","7101.09","2019-01-31","0010/MM/19","BIAYA GAJI KOMISARIS","0","12000000","2019-03-22","Post","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("704","0007/MM/19","2198.50.09","2019-01-31","0007/MM/19","PEMBY.SEWA LAHAN BANGUNAN IEWJ","25000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("692","0009/PB/19","2103.00.09","2019-01-15","0009/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80 GSM 65X90CM PPN","434860578","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("691","0009/PB/19","1113.01.09","2019-01-15","0009/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80 GSM 65X90CM PPN","0","434860578","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("690","0009/PB/19","2103.00.09","2019-01-15","0009/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80 GSM 65X90CM","2147483647","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("689","0009/PB/19","1108.04.09","2019-01-15","0009/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80 GSM 65X90CM","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("688","0024/BK/19","2103.00.09","2019-01-16","0024/BK/19","PEMBY.DP.KERDUS SBY MEKABOX","0","145320978","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("685","0022/BK/19","1102.02.09","2019-01-16","0022/BK/19","PEMBY.DP.KERTAS ROLL PT.BUDI MITRAJAYA","2147483647","0","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("683","0022/BK/19","1102.02.09","2019-01-16","0022/BK/19","PEMBY.DP.KERTAS ROLL PT.BUDI MITRAJAYA","2147483647","0","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("681","0008/PB/19","1113.01.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM PPN","0","1546513291","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("679","0008/PB/19","1108.04.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("678","0008/PB/19","2103.00.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM","2147483647","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("676","0005/BM/19","2106.00.09","2019-01-15","0005/BM/19","TD.PUSTAKA CEMERLANG,CETAK SKHUS","15000000","0","2019-03-22","Post","HM.P028.8","1");
INSERT INTO tabel_transaksi VALUES("667","0042/KK/19","1101.01.09","2019-01-18","0042/KK/19","PEMBY.HOLOGRAM,NOMORATOR SHUSSUMBAWA","1200000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("666","0041/KM/19","1105.00.09","2019-01-18","0041/KM/19","TD.ANGSURAN P.YINO/PURBENGKARA","5000000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("620","0039/KK/19","5707.09","2019-01-18","0039/KK/19","PEMBL.SOLAR U/.FORKLIP","0","100000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("619","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.SOLAR U/.FORKLIP","100000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("618","0006/PJ/19","4101.09","2019-01-05","0006/PJ/19","PT.INTAN PARIWARA,BUKU K13","1449875806","0","2019-03-22","Post","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("617","0006/PJ/19","1105.00.09","2019-01-05","0006/PJ/19","PT.INTAN PARIWARA,BUKU K13","0","1449875806","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("616","0005/PJ/19","4101.09","2019-01-04","0005/PJ/19","PT.INTAN PARIWARA,BUKU K13","370000170","0","2019-03-22","Post","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("605","0060/BK/19","1102.02.09","2019-01-29","0060/BK/19","PEMBY.KARYA INDI PRATAMA STRAPPING BAND","2757810","0","2019-03-22","Post","HD.K025.8","1");
INSERT INTO tabel_transaksi VALUES("604","0059/BK/19","2104.15.09","2019-01-29","0059/BK/19","PEMBY.TAGIHAN KONTAINER PROYEKKPU","0","9800000","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("603","0059/BK/19","1102.02.09","2019-01-29","0059/BK/19","PEMBY.TAGIHAN KONTAINER PROYEKKPU","9800000","0","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("602","0058/BM/19","2198.50.09","2019-01-29","0058/BM/19","TRM.PINJAMAN BP.NANANG KLATEN","500000000","0","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("601","0058/BM/19","1102.02.09","2019-01-29","0058/BM/19","TRM.PINJAMAN BP.NANANG KLATEN","0","500000000","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("600","0057/BK/19","2198.50.09","2019-01-26","0057/BK/19","PEMBY.ANGSURAN TELKOM","0","400000000","2019-03-22","Post","HL.T002.8","1");
INSERT INTO tabel_transaksi VALUES("599","0057/BK/19","1102.02.09","2019-01-26","0057/BK/19","PEMBY.ANGSURAN TELKOM","400000000","0","2019-03-22","Post","HL.T002.8","1");
INSERT INTO tabel_transaksi VALUES("598","0054/BK/19","5200.09","2019-01-25","0054/BK/19","PEMBY.LODING BUKU,BONGKAR,TERPAL DAN PALET DI PT.KASA","0","0","2019-03-22","","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("588","0048/BK/19","2104.15.09","2019-01-23","0048/BK/19","PEMBY.SEWA GENSET 1 BLN CV.INTI DAYA","0","16000000","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("587","0048/BK/19","1102.02.09","2019-01-23","0048/BK/19","PEMBY.SEWA GENSET 1 BLN CV.INTI DAYA","16000000","0","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("586","0047/BK/19","6408.09","2019-01-23","0047/BK/19","PEMBY.PENGIRIMAN EKSPEDISI RAYA EXSPRES","0","1000000","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("566","0031/BK/19","7305.09","2019-01-18","0031/BK/19","PEMBY.APAR PEMADAM KEBAKARAN APROTECO","0","3090000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("565","0031/BK/19","1102.02.09","2019-01-18","0031/BK/19","PEMBY.APAR PEMADAM KEBAKARAN APROTECO","3090000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("564","0030/BK/19","5704.09","2019-01-17","0030/BK/19","PEMBY.PERBAIKAN MESIN WEB CV.MIRZA","0","24250000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("563","0030/BK/19","1102.02.09","2019-01-17","0030/BK/19","PEMBY.PERBAIKAN MESIN WEB CV.MIRZA","24250000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("562","0029/BK/19","5200.09","2019-01-17","0029/BK/19","PEMBY.UV VERNIS TOP POP BUANA","0","520965","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("561","0029/BK/19","1102.02.09","2019-01-17","0029/BK/19","PEMBY.UV VERNIS TOP POP BUANA","520965","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("560","0028/BK/19","2104.15.09","2019-01-17","0028/BK/19","PEMBY.PEMASANGAN INSTALASI PIPA COMPRESOR BP.KARIONO","0","0","2019-03-22","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("559","0028/BK/19","1102.02.09","2019-01-17","0028/BK/19","PEMBY.PEMASANGAN INSTALASI PIPA COMPRESOR BP.KARIONO","2100000","0","2019-03-22","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("556","0026/BK/19","2104.15.09","2019-01-17","0026/BK/19","PEMBY.DP MESIN LIPAT,MESIN POTONG BP.PURWANTO","0","207500000","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("552","0023/BM/19","2198.50.09","2019-01-16","0023/BM/19","TD.PINJAMAN BP.NANANG KLATEN","500000000","0","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("551","0023/BM/19","1102.02.09","2019-01-16","0023/BM/19","TD.PINJAMAN BP.NANANG KLATEN","0","500000000","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("550","0007/PB/19","2103.00.09","2019-01-10","0007/PB/19","MARY SETIAWAN,PLASTIK PP UK.16X28+42X30+100X90 CM PPN","1996480","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("547","0007/PB/19","1108.06.09","2019-01-10","0007/PB/19","MARY SETIAWAN,PLASTIK PP UK.16X28+42X30+100X90 CM","0","49721090","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("546","0018/PB/19","2103.00.09","2019-01-16","0018/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK PPN","24244853","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("545","0018/PB/19","1113.01.09","2019-01-16","0018/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK PPN","0","24244853","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("544","0018/PB/19","2103.00.09","2019-01-16","0018/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK","242448527","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("542","0023/PB/19","2103.00.09","2019-01-23","0023/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK PPN","14711670","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("541","0023/PB/19","1113.01.09","2019-01-23","0023/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK PPN","0","14711670","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("540","0023/PB/19","2103.00.09","2019-01-23","0023/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK","147116700","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("537","0017/PB/19","1113.01.09","2019-01-16","0017/PB/19","PT.CITRA GRAFIKA S,BW PR.YELLOW,MAGENTA,CYAN,BLACK PPN","0","99096700","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("536","0017/PB/19","2103.00.09","2019-01-16","0017/PB/19","PT.CITRA GRAFIKA S,BW PR.YELLOW,MAGENTA,CYAN,BLACK","990967000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("534","0023/PB/19","2103.00.09","2019-01-25","0023/PB/19","CV.BINTANG LANCAR,IPA 1 DRUM PPN","220000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("532","0023/PB/19","2103.00.09","2019-01-25","0023/PB/19","CV.BINTANG LANCAR,IPA 1 DRUM","2200000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("529","0024/PB/19","1108.06.09","2019-01-25","0024/PB/19","MEDIA PRISMA GRAFIKA,CLANER 650","0","1140000","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("528","0022/PB/19","2103.00.09","2019-01-16","0022/PB/19","ANEKA JAYA KARYA,KERTAS HVS 80GR UK.65X90 CM","11091600","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("527","0022/PB/19","1108.04.09","2019-01-16","0022/PB/19","ANEKA JAYA KARYA,KERTAS HVS 80GR UK.65X90 CM","0","11091600","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("526","0020/PB/19","2103.00.09","2019-01-16","0020/PB/19","ANEKA JAYA KARYA,KERTAS HVS 80GR UK.65X100CM","4110000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("519","0014/PB/19","1108.04.09","2019-01-15","0014/PB/19","PT.MAHKOTA RS,TINTA ECO 416 GREEN","0","2193000","2019-03-22","Post","HD.M004.8","1");
INSERT INTO tabel_transaksi VALUES("518","0010/PB/19","2103.00.09","2019-01-14","0010/PB/19","KARYA INDI PRATAMA,STRAPING BAND UK.12 MM.8 KG ROLL PPN","835700","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("516","0010/PB/19","2103.00.09","2019-01-14","0010/PB/19","KARYA INDI PRATAMA,STRAPING BAND UK.12 MM.8 KG ROLL","8357000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("515","0010/PB/19","1108.06.09","2019-01-14","0010/PB/19","KARYA INDI PRATAMA,STRAPING BAND UK.12 MM.8 KG ROLL","0","8357000","2019-03-22","Post","HD.K025.8","1");
INSERT INTO tabel_transaksi VALUES("514","0002/PB/19","2103.00.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,MAXIFOUNT PPN","138400","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("513","0002/PB/19","1113.01.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,MAXIFOUNT PPN","0","138400","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("512","0002/PB/19","2103.00.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,MAXIFOUNT","928000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("510","0001/PB/19","2103.00.09","2019-01-03","0001/PB/19","CV.BINTAMG LANCAR,BLANKET CONTI 889X595X1.70 CM PPN","140000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("508","0001/PB/19","2103.00.09","2019-01-03","0001/PB/19","CV.BINTAMG LANCAR,BLANKET CONTI 889X595X1.70 CM","1400000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("507","0001/PB/19","1108.06.09","2019-01-03","0001/PB/19","CV.BINTAMG LANCAR,BLANKET CONTI 889X595X1.70 CM","0","1400000","2019-03-22","Post","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("505","0021/BM/19","1102.02.09","2019-01-16","0021/BM/19","TRM.PINJAMAN YUDISTIRA GHALIA","0","2147483647","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("504","0021/BM/19","2198.50.09","2019-01-16","0021/BM/19","TRM.PINJAMAN YUDISTIRA GHALIA","2147483647","0","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("500","0039/KK/19","5200.09","2019-01-18","0039/KK/19","PEMBL.PAKU,ENGSEL,LEM RAJAWALI","0","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("498","0039/KK/19","5200.09","2019-01-18","0039/KK/19","PEMBY.NOMERATOR SERTIFIKAT SD/MI NTB","0","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("494","0038/KM/19","1105.00.09","2019-01-18","0038/KM/19","TD.PT.KASA HUSADA,CETAK SULFIT","6435000","0","2019-03-22","Post","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("490","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.MAKAN PRODUKSI LOADING","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("489","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.MAKAN PRODUKSI LOADING","250000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("488","0020/KK/19","5704.09","2019-01-16","0020/KK/19","PEMBL.BEARING U/.MESIN WEB","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("484","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.TINTA GRREN U/.KASA HUSADA","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("483","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.TINTA GRREN U/.KASA HUSADA","1206200","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("480","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.OBAT ANTI RAYAB","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("468","0020/KK/19","5707.09","2019-01-16","0020/KK/19","PEMBL.MUR BAUT BAJA U/.MESIN WEB","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("467","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.MUR BAUT BAJA U/.MESIN WEB","45000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("466","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.RAFIA,PLAKBAND","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("465","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.RAFIA,PLAKBAND","82000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("464","0019/KM/19","1105.00.09","2019-01-15","0019/KM/19","TD.P.YITNO/PURBENGKARA ANGSURAN CETAKAN","10000000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("445","0011/BK/19","1102.02.09","2019-01-15","0011/BK/19","PEMBY.CV.MITRA SETIA SEJAHTERATINTA MAXXIMA","3806000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("443","0010/BK/19","1102.02.09","2019-01-15","0010/BK/19","PEMBY.CV.MEDIA PRISMA GRAFIKATINTA HUBBER","44197700","0","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("442","0009/BK/19","2103.00.09","2019-01-15","0009/BK/19","PEMBY.CAHAYA TRINITAS,KERTAS","0","35951820","2019-03-22","Post","HD.C005.8","1");
INSERT INTO tabel_transaksi VALUES("437","0008/KK/19","1101.01.09","2019-01-15","0008/KK/19","PEMBY.BPJS KETENAGAKERJAAN","9572881","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("436","0007/KK/19","2104.15.09","2019-01-15","0007/KK/19","PEMBY.PERJALANAN DINAS P.NASIRKE JKT","0","28000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("435","0007/KK/19","1101.01.09","2019-01-15","0007/KK/19","PEMBY.PERJALANAN DINAS P.NASIRKE JKT","28000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("399","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PREMIUM OPD GUDANG","24804","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("398","0002/KK/19","7105.09","2019-01-02","0002/KK/19","PEMBL.JAMUAN TAMU KTR","0","173329","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("397","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBL.JAMUAN TAMU KTR","173329","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("390","0001/KK/19","7305.09","2019-01-02","0001/KK/19","PEMBL.TINTA PRINTER ADM PRODUKSI","0","483000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("720","0068/BK/19","2104.15.09","2019-01-29","0068/BK/19","PEMBY.PLATE VICTORY TJIO LIE CHING","0","4833000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("719","0068/BK/19","1102.02.09","2019-01-29","0068/BK/19","PEMBY.PLATE VICTORY TJIO LIE CHING","4833000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("717","0067/BK/19","1102.02.09","2019-01-29","0067/BK/19","PEMBY.ANGSURAN 1 BIAYA KONSULTAN BP.ABD.MUBAROK","12000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("716","0055/BK/19","7419.09","2019-01-26","0055/BK/19","PEMBY.TS SERTIFIKASI INDONESIA","0","7000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("715","0055/BK/19","1102.02.09","2019-01-26","0055/BK/19","PEMBY.TS SERTIFIKASI INDONESIA","7000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("712","0037/BK/19","2103.00.09","2019-01-18","0037/BK/19","PEMBY.BUDI MITRA JAYA KERTAS KPU","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("709","0037/BK/19","1102.02.09","2019-01-18","0037/BK/19","PEMBY.BUDI MITRA JAYA KERTAS KPU","2147483647","0","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("708","0010/MM/19","2104.10.09","2019-01-31","0010/MM/19","BEBAN BIAYA PENDIDIKAN","1000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("707","0010/MM/19","8202.09","2019-01-31","0010/MM/19","BEBAN BIAYA PENDIDIKAN","0","1000000","2019-03-22","Post","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("703","0007/MM/19","7205.09","2019-01-31","0007/MM/19","PEMBY.SEWA LAHAN BANGUNAN IEWJ","0","25000000","2019-03-22","Post","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("702","0005/MM/19","2104.99.09","2019-01-31","0005/MM/19","CAD.BACK TO BACK","20000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("701","0005/MM/19","8206.09","2019-01-31","0005/MM/19","CAD.BACK TO BACK","0","20000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("700","0004/MM/19","1405.51.09","2019-01-31","0004/MM/19","PENYST.PERALATAN PABRIK","52497","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("699","0004/MM/19","5717.09","2019-01-31","0004/MM/19","PENYST.PERALATAN PABRIK","0","52497","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("698","0003/MM/19","1402.51.09","2019-01-31","0003/MM/19","PENYST.BANGUNAN PABRIK","1064376","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("697","0003/MM/19","5711.09","2019-01-31","0003/MM/19","PENYST.BANGUNAN PABRIK","0","1064376","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("696","0002/MM/19","1405.52.09","2019-01-31","0002/MM/19","PENYST.PERALATAN KANTOR","852217","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("695","0002/MM/19","7310.09","2019-01-31","0002/MM/19","PENYST.PERALATAN KANTOR","0","852217","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("694","0001/MM/19","1403.51.09","2019-01-31","0001/MM/19","PENYST.MESIN PRODUKSI","10645013","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("693","0001/MM/19","5713.09","2019-01-31","0001/MM/19","PENYST.MESIN PRODUKSI","0","10645013","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("687","0024/BK/19","1102.02.09","2019-01-16","0024/BK/19","PEMBY.DP.KERDUS SBY MEKABOX","145320978","0","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("686","0022/BK/19","2103.00.09","2019-01-16","0022/BK/19","PEMBY.DP.KERTAS ROLL PT.BUDI MITRAJAYA","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("684","0022/BK/19","2103.00.09","2019-01-16","0022/BK/19","PEMBY.DP.KERTAS ROLL PT.BUDI MITRAJAYA","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("682","0008/PB/19","2103.00.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM PPN","1546513291","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("680","0008/PB/19","2103.00.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM","2147483647","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("677","0008/PB/19","1108.04.09","2019-01-14","0008/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/83CM","0","2147483647","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("675","0005/BM/19","1102.02.09","2019-01-15","0005/BM/19","TD.PUSTAKA CEMERLANG,CETAK SKHUS","0","15000000","2019-03-22","Post","HM.P028.8","1");
INSERT INTO tabel_transaksi VALUES("674","0066/KK/19","2104.01.09","2019-01-29","0066/KK/19","PEMBY.GAJI KOMISARIS","0","124424000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("673","0066/KK/19","1101.01.09","2019-01-29","0066/KK/19","PEMBY.GAJI KOMISARIS","124424000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("672","0065/KM/19","1102.02.09","2019-01-29","0065/KM/19","PENGAMBILAN BANK MANDIR U/.KAS","124424000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("671","0065/KM/19","1101.01.09","2019-01-29","0065/KM/19","PENGAMBILAN BANK MANDIR U/.KAS","0","124424000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("670","0043/KK/19","6408.09","2019-01-18","0043/KK/19","PEMBY.PENGIRIMAN SHUS KE SUMBAWA","0","1819000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("669","0043/KK/19","1101.01.09","2019-01-18","0043/KK/19","PEMBY.PENGIRIMAN SHUS KE SUMBAWA","1819000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("668","0042/KK/19","5200.09","2019-01-18","0042/KK/19","PEMBY.HOLOGRAM,NOMORATOR SHUSSUMBAWA","0","1200000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("665","0041/KM/19","1101.01.09","2019-01-18","0041/KM/19","TD.ANGSURAN P.YINO/PURBENGKARA","0","5000000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("664","0040/KK/19","5707.09","2019-01-18","0040/KK/19","PEMBL.SOLAR U/.FORKLIP","0","50000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("663","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.SOLAR U/.FORKLIP","50000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("662","0040/KK/19","5707.09","2019-01-18","0040/KK/19","PREMIUM OPS REPRO","0","35000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("661","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PREMIUM OPS REPRO","35000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("660","0040/KK/19","5707.09","2019-01-18","0040/KK/19","PEMBL.SOLAR U/.FORKLIP","0","90000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("659","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.SOLAR U/.FORKLIP","90000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("658","0040/KK/19","5704.09","2019-01-18","0040/KK/19","PEMBL.MAJUN U/.MESIN","0","105000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("657","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.MAJUN U/.MESIN","105000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("656","0040/KK/19","5200.09","2019-01-18","0040/KK/19","PEMBY.KONSUMSI SOPIR BALEBAT","0","100000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("655","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.KONSUMSI SOPIR BALEBAT","100000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("654","0040/KK/19","6402.09","2019-01-18","0040/KK/19","PEMBY.FOTO COPY","0","288000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("653","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.FOTO COPY","288000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("652","0040/KK/19","7305.09","2019-01-18","0040/KK/19","PEMBL.PAKU.KAWAT U/.KTR","0","39000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("651","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.PAKU.KAWAT U/.KTR","39000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("650","0040/KK/19","7305.09","2019-01-18","0040/KK/19","PEMBL.AIRWASTANINCAR,KLAIN KECIL","0","177000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("649","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.AIRWASTANINCAR,KLAIN KECIL","177000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("648","0040/KK/19","6408.09","2019-01-18","0040/KK/19","PEMBY.PENGIRIMAN PT.KASA","0","300000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("647","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.PENGIRIMAN PT.KASA","300000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("646","0040/KK/19","5707.09","2019-01-18","0040/KK/19","PREMIUM OPS PEMBELIAN","0","45000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("645","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PREMIUM OPS PEMBELIAN","45000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("644","0040/KK/19","7407.09","2019-01-18","0040/KK/19","PEMBY.PENGIRIMA DOK.BIN","0","26000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("643","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.PENGIRIMA DOK.BIN","26000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("642","0040/KK/19","7407.09","2019-01-18","0040/KK/19","PEMBL.ATK U/.SEKRETARIS","0","170800","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("641","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.ATK U/.SEKRETARIS","170800","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("640","0040/KK/19","7407.09","2019-01-18","0040/KK/19","PEMBY.FOTO COPY","0","146500","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("639","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.FOTO COPY","146500","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("638","0040/KK/19","7305.09","2019-01-18","0040/KK/19","PEMBY.SERVICE AC","0","300000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("637","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBY.SERVICE AC","300000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("636","0040/KK/19","5200.09","2019-01-18","0040/KK/19","PEMBL.MAKAN LOADING","0","747000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("635","0040/KK/19","1101.01.09","2019-01-18","0040/KK/19","PEMBL.MAKAN LOADING","747000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("634","0039/KK/19","5707.09","2019-01-18","0039/KK/19","PREMIUM OPS OB","0","40000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("633","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PREMIUM OPS OB","40000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("632","0039/KK/19","7407.09","2019-01-18","0039/KK/19","PEMBY.PEMBUATAN ID CARD","0","192000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("631","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBY.PEMBUATAN ID CARD","192000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("630","0039/KK/19","5721.09","2019-01-18","0039/KK/19","PEMBL.BENSIN U/.REPRO","0","23000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("629","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.BENSIN U/.REPRO","23000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("628","0039/KK/19","5704.09","2019-01-18","0039/KK/19","PEMBL.TERPAL U/.TUTUP MESIN","0","3744000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("627","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.TERPAL U/.TUTUP MESIN","3744000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("626","0039/KK/19","5704.09","2019-01-18","0039/KK/19","PEMBL.VANBEL U/.MESIN POTONG","0","480000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("625","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.VANBEL U/.MESIN POTONG","480000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("624","0039/KK/19","7305.09","2019-01-18","0039/KK/19","PEMBL.KEB.KANTOR","0","71790","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("623","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.KEB.KANTOR","71790","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("622","0039/KK/19","5707.09","2019-01-18","0039/KK/19","PREMIUM BOK","0","65000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("621","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PREMIUM BOK","65000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("615","0005/PJ/19","1105.00.09","2019-01-04","0005/PJ/19","PT.INTAN PARIWARA,BUKU K13","0","370000170","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("614","0004/PJ/19","4101.09","2019-01-03","0004/PJ/19","PT.INTAN PARIWARA,BUKU K13","179147200","0","2019-03-22","Post","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("613","0004/PJ/19","1105.00.09","2019-01-03","0004/PJ/19","PT.INTAN PARIWARA,BUKU K13","0","179147200","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("612","0002/PJ/19","4101.09","2019-01-03","0002/PJ/19","CV.MEKARSARI ARDHI,BUKU K13","2012514595","0","2019-03-22","Post","PD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("611","0002/PJ/19","1105.00.09","2019-01-03","0002/PJ/19","CV.MEKARSARI ARDHI,BUKU K13","0","2012514595","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("610","0001/PJ/19","2105.01.09","2019-01-22","0001/PJ/19","PT.NYATA GRAFIKA MS,KERTAS ROLL CD ADOG 69 CM PPN","8329360","0","2019-03-22","Post","PD.N014.8","1");
INSERT INTO tabel_transaksi VALUES("609","0001/PJ/19","1105.00.09","2019-01-22","0001/PJ/19","PT.NYATA GRAFIKA MS,KERTAS ROLL CD ADOG 69 CM PPN","0","8329360","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("608","0001/PJ/19","4101.09","2019-01-22","0001/PJ/19","PT.NYATA GRAFIKA MS,KERTAS ROLL CD ADOG 69 CM","83293597","0","2019-03-22","Post","PD.N014.8","1");
INSERT INTO tabel_transaksi VALUES("607","0001/PJ/19","1105.00.09","2019-01-22","0001/PJ/19","PT.NYATA GRAFIKA MS,KERTAS ROLL CD ADOG 69 CM","0","83293597","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("606","0060/BK/19","2103.00.09","2019-01-29","0060/BK/19","PEMBY.KARYA INDI PRATAMA STRAPPING BAND","0","2757810","2019-03-22","Post","HD.K025.8","1");
INSERT INTO tabel_transaksi VALUES("597","0054/BK/19","1102.02.09","2019-01-25","0054/BK/19","PEMBY.LODING BUKU,BONGKAR,TERPAL DAN PALET DI PT.KASA","3000000","0","2019-03-22","","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("596","0052/BM/19","2198.50.09","2019-01-23","0052/BM/19","TD.PINJAMAN BP.NANANG KLATEN","500000000","0","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("595","0052/BM/19","1102.02.09","2019-01-23","0052/BM/19","TD.PINJAMAN BP.NANANG KLATEN","0","500000000","2019-03-22","Post","HL.N001.8","1");
INSERT INTO tabel_transaksi VALUES("594","0051/BM/19","1105.00.09","2019-01-23","0051/BM/19","TD.JP PRES DN.042","25242365","0","2019-03-22","Post","PD.J023.8","1");
INSERT INTO tabel_transaksi VALUES("593","0051/BM/19","1102.02.09","2019-01-23","0051/BM/19","TD.JP PRES DN.042","0","25242365","2019-03-22","Post","PD.J023.8","1");
INSERT INTO tabel_transaksi VALUES("592","0050/BK/19","2198.50.09","2019-01-23","0050/BK/19","PEMBY.SEWA LAHAN IEWJ","0","35000000","2019-03-22","Post","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("591","0050/BK/19","1102.02.09","2019-01-23","0050/BK/19","PEMBY.SEWA LAHAN IEWJ","35000000","0","2019-03-22","Post","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("590","0049/BK/19","2104.99.09","2019-01-23","0049/BK/19","PEMBY.BUNGA BACK TO BACK BRI","0","20000000","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("589","0049/BK/19","1102.02.09","2019-01-23","0049/BK/19","PEMBY.BUNGA BACK TO BACK BRI","20000000","0","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("585","0047/BK/19","1102.02.09","2019-01-23","0047/BK/19","PEMBY.PENGIRIMAN EKSPEDISI RAYA EXSPRES","1000000","0","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("584","0046/BK/19","2103.00.09","2019-01-23","0046/BK/19","PEMBY.CV.ANEKA KARYA JAYA,HVS80GR","0","11091600","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("583","0046/BK/19","1102.02.09","2019-01-23","0046/BK/19","PEMBY.CV.ANEKA KARYA JAYA,HVS80GR","11091600","0","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("582","0045/BK/19","5200.09","2019-01-18","0045/BK/19","PEMBY.LOADING BUKU K13 PENITIPAN BUKU K13 DI PT.KASA","0","3000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("581","0045/BK/19","1102.02.09","2019-01-18","0045/BK/19","PEMBY.LOADING BUKU K13 PENITIPAN BUKU K13 DI PT.KASA","3000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("580","0044/BK/19","5200.09","2019-01-18","0044/BK/19","PEMBY.LOADING BUKU K13 PENITIPAN BUKU K13 DI PT.KASA","0","6500000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("579","0044/BK/19","1102.02.09","2019-01-18","0044/BK/19","PEMBY.LOADING BUKU K13 PENITIPAN BUKU K13 DI PT.KASA","6500000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("578","0036/BM/19","2198.50.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","2147483647","0","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("577","0036/BM/19","1102.02.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","0","2147483647","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("576","0036/BM/19","2198.50.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","2147483647","0","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("575","0036/BM/19","1102.02.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","0","2147483647","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("574","0036/BM/19","2198.50.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","2147483647","0","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("573","0036/BM/19","1102.02.09","2019-01-18","0036/BM/19","TD.PINJAMAN PT.YUDHISTIRA,U/.PROYEK KPU","0","2147483647","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("572","0035/BK/19","1701.02.09","2019-01-18","0035/BK/19","PEMBY.DP.PAVING DAN BELI PAVING","0","18250000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("571","0035/BK/19","1102.02.09","2019-01-18","0035/BK/19","PEMBY.DP.PAVING DAN BELI PAVING","18250000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("570","0033/BK/19","5704.09","2019-01-18","0033/BK/19","PEMBY.MODIFIKASI MOTOR ROL AIRMESIN SHEET","0","9800000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("569","0033/BK/19","1102.02.09","2019-01-18","0033/BK/19","PEMBY.MODIFIKASI MOTOR ROL AIRMESIN SHEET","9800000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("568","0032/BK/19","5200.09","2019-01-18","0032/BK/19","PEMBY.TAGIHAN PLATE BUKU TEMPRINA MEDIA GRAFIKA","0","3899998","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("567","0032/BK/19","1102.02.09","2019-01-18","0032/BK/19","PEMBY.TAGIHAN PLATE BUKU TEMPRINA MEDIA GRAFIKA","3899998","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("558","0027/BK/19","2104.15.09","2019-01-17","0027/BK/19","PEMBY.MATRIX POLYMER ROL AIR","0","2266704","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("557","0027/BK/19","1102.02.09","2019-01-17","0027/BK/19","PEMBY.MATRIX POLYMER ROL AIR","2266704","0","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("555","0026/BK/19","1102.02.09","2019-01-17","0026/BK/19","PEMBY.DP MESIN LIPAT,MESIN POTONG BP.PURWANTO","207500000","0","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("554","0025/BK/19","2103.00.09","2019-01-16","0025/BK/19","PEMBY.DP 50% KARDUS SBYMEKABOXKPU","0","0","2019-03-22","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("553","0025/BK/19","1102.02.09","2019-01-16","0025/BK/19","PEMBY.DP 50% KARDUS SBYMEKABOXKPU","25858785","0","2019-03-22","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("549","0007/PB/19","1113.01.09","2019-01-10","0007/PB/19","MARY SETIAWAN,PLASTIK PP UK.16X28+42X30+100X90 CM PPN","0","1996480","2019-03-22","Post","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("548","0007/PB/19","2103.00.09","2019-01-10","0007/PB/19","MARY SETIAWAN,PLASTIK PP UK.16X28+42X30+100X90 CM","49721090","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("543","0018/PB/19","1108.04.09","2019-01-16","0018/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK","0","242448527","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("539","0023/PB/19","1108.04.09","2019-01-23","0023/PB/19","PT.CITRA GRAFIKA S,NEW CHY.PR.YELLOW,MAGENTA,CYAN,BLACK","0","147116700","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("538","0017/PB/19","2103.00.09","2019-01-16","0017/PB/19","PT.CITRA GRAFIKA S,BW PR.YELLOW,MAGENTA,CYAN,BLACK PPN","99096700","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("535","0017/PB/19","1108.04.09","2019-01-16","0017/PB/19","PT.CITRA GRAFIKA S,BW PR.YELLOW,MAGENTA,CYAN,BLACK","0","990967000","2019-03-22","Post","HD.C019.8","1");
INSERT INTO tabel_transaksi VALUES("533","0023/PB/19","1113.01.09","2019-01-25","0023/PB/19","CV.BINTANG LANCAR,IPA 1 DRUM PPN","0","220000","2019-03-22","Post","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("531","0023/PB/19","1108.06.09","2019-01-25","0023/PB/19","CV.BINTANG LANCAR,IPA 1 DRUM","0","2200000","2019-03-22","Post","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("530","0024/PB/19","2103.00.09","2019-01-25","0024/PB/19","MEDIA PRISMA GRAFIKA,CLANER 650","1140000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("525","0020/PB/19","1108.04.09","2019-01-16","0020/PB/19","ANEKA JAYA KARYA,KERTAS HVS 80GR UK.65X100CM","0","4110000","2019-03-22","Post","HD.A049.8","1");
INSERT INTO tabel_transaksi VALUES("524","0002/PB/19","2103.00.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650.24 LTR","456000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("523","0002/PB/19","1108.06.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650.24 LTR","0","456000","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("522","0014/PB/19","2103.00.09","2019-01-15","0014/PB/19","PT.MAHKOTA RS,TINTA ECO 416 GREEN PPN","219300","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("521","0014/PB/19","1113.01.09","2019-01-15","0014/PB/19","PT.MAHKOTA RS,TINTA ECO 416 GREEN PPN","0","219300","2019-03-22","Post","HD.M004.8","1");
INSERT INTO tabel_transaksi VALUES("520","0014/PB/19","2103.00.09","2019-01-15","0014/PB/19","PT.MAHKOTA RS,TINTA ECO 416 GREEN","2193000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("517","0010/PB/19","1113.01.09","2019-01-14","0010/PB/19","KARYA INDI PRATAMA,STRAPING BAND UK.12 MM.8 KG ROLL PPN","0","835700","2019-03-22","Post","HD.K025.8","1");
INSERT INTO tabel_transaksi VALUES("511","0002/PB/19","1108.06.09","2019-01-03","0002/PB/19","CV.MEDIA PRISMA GRAFIKA,MAXIFOUNT","0","928000","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("509","0001/PB/19","1113.01.09","2019-01-03","0001/PB/19","CV.BINTAMG LANCAR,BLANKET CONTI 889X595X1.70 CM PPN","0","140000","2019-03-22","Post","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("506","0021/BM/19","2198.50.09","2019-01-16","0021/BM/19","TRM.PINJAMAN YUDISTIRA GHALIA","2147483647","0","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("503","0021/BM/19","1102.02.09","2019-01-16","0021/BM/19","TRM.PINJAMAN YUDISTIRA GHALIA","0","2147483647","2019-03-22","Post","HL.Y001.8","1");
INSERT INTO tabel_transaksi VALUES("502","0039/KK/19","7417.09","2019-01-18","0039/KK/19","PEMBY.IURAN RW","0","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("501","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBY.IURAN RW","150000","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("499","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.PAKU,ENGSEL,LEM RAJAWALI","93500","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("497","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBY.NOMERATOR SERTIFIKAT SD/MI NTB","200000","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("496","0039/KK/19","6402.09","2019-01-18","0039/KK/19","PEMBL.MATERAI","0","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("495","0039/KK/19","1101.01.09","2019-01-18","0039/KK/19","PEMBL.MATERAI","30000","0","2019-03-22","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("493","0038/KM/19","1101.01.09","2019-01-18","0038/KM/19","TD.PT.KASA HUSADA,CETAK SULFIT","0","6435000","2019-03-22","Post","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("492","0020/KK/19","5707.09","2019-01-16","0020/KK/19","PREMIUM OPS PEMBELIAN","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("491","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PREMIUM OPS PEMBELIAN","48000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("487","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.BEARING U/.MESIN WEB","4500000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("486","0020/KK/19","5704.09","2019-01-16","0020/KK/19","PEMBL.KAMPAS","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("485","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.KAMPAS","800000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("482","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.HOOP,LOOK FASTENER","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("481","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.HOOP,LOOK FASTENER","170000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("479","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.OBAT ANTI RAYAB","210000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("478","0020/KK/19","5200.09","2019-01-16","0020/KK/19","PEMBL.PALET KAYU","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("477","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.PALET KAYU","770000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("476","0020/KK/19","5704.09","2019-01-16","0020/KK/19","PEMBL.OLIE MESIN","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("475","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.OLIE MESIN","250000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("474","0020/KK/19","5704.09","2019-01-16","0020/KK/19","PEMBL.PIR TEKAN","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("473","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.PIR TEKAN","150000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("472","0020/KK/19","5707.09","2019-01-16","0020/KK/19","PREMIUM OPS OB","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("471","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PREMIUM OPS OB","47000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("470","0020/KK/19","5707.09","2019-01-16","0020/KK/19","PEMBL.AMPLAS,LEM G U/.MESIN WEB","0","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("469","0020/KK/19","1101.01.09","2019-01-16","0020/KK/19","PEMBL.AMPLAS,LEM G U/.MESIN WEB","81000","0","2019-03-22","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("463","0019/KM/19","1101.01.09","2019-01-15","0019/KM/19","TD.P.YITNO/PURBENGKARA ANGSURAN CETAKAN","0","10000000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("462","0017/BK/19","6408.09","2019-01-15","0017/BK/19","PEMBY.ONGKS.KIRIM BUKU","0","22200000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("461","0017/BK/19","1102.02.09","2019-01-15","0017/BK/19","PEMBY.ONGKS.KIRIM BUKU","22200000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("460","0017/BK/19","1701.02.09","2019-01-15","0017/BK/19","PEMBY.CV.JACKY PEKERJAAN SALURAN AIR","0","11850000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("459","0017/BK/19","1102.02.09","2019-01-15","0017/BK/19","PEMBY.CV.JACKY PEKERJAAN SALURAN AIR","11850000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("458","0015/BK/19","5200.09","2019-01-15","0015/BK/19","PEMBY.CENTRAL DINAMIKA","0","412500","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("457","0015/BK/19","1102.02.09","2019-01-15","0015/BK/19","PEMBY.CENTRAL DINAMIKA","412500","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("456","0015/BK/19","5605.09","2019-01-15","0015/BK/19","PEMBY.AIR MINUM CHEER","0","280000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("455","0015/BK/19","1102.02.09","2019-01-15","0015/BK/19","PEMBY.AIR MINUM CHEER","280000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("454","0015/BK/19","5405.09","2019-01-15","0015/BK/19","PEMBY.AIR MINUM CHEER","0","812000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("453","0015/BK/19","1102.02.09","2019-01-15","0015/BK/19","PEMBY.AIR MINUM CHEER","812000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("452","0014/BK/19","5200.09","2019-01-15","0014/BK/19","PEMBY.UV LAMINASI","0","2293000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("451","0014/BK/19","1102.02.09","2019-01-15","0014/BK/19","PEMBY.UV LAMINASI","2293000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("450","0013/BK/19","5200.09","2019-01-15","0013/BK/19","PEMBY.PLAT COUNTRY","0","54367000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("449","0013/BK/19","1102.02.09","2019-01-15","0013/BK/19","PEMBY.PLAT COUNTRY","54367000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("448","0012/BK/19","5200.09","2019-01-15","0012/BK/19","PEMBY.CV.BINTANG LANCAR,BLANKET","0","38238000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("447","0012/BK/19","1102.02.09","2019-01-15","0012/BK/19","PEMBY.CV.BINTANG LANCAR,BLANKET","38238000","0","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("446","0011/BK/19","2103.00.09","2019-01-15","0011/BK/19","PEMBY.CV.MITRA SETIA SEJAHTERATINTA MAXXIMA","0","3806000","2019-03-22","Post","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("444","0010/BK/19","2103.00.09","2019-01-15","0010/BK/19","PEMBY.CV.MEDIA PRISMA GRAFIKATINTA HUBBER","0","44197700","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("441","0009/BK/19","1102.02.09","2019-01-15","0009/BK/19","PEMBY.CAHAYA TRINITAS,KERTAS","35951820","0","2019-03-22","Post","HD.C005.8","1");
INSERT INTO tabel_transaksi VALUES("440","0008/KK/19","7104.09","2019-01-15","0008/KK/19","PEMBY.BPJS KESEHATAN","0","1780659","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("439","0008/KK/19","1101.01.09","2019-01-15","0008/KK/19","PEMBY.BPJS KESEHATAN","1780659","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("438","0008/KK/19","7107.09","2019-01-15","0008/KK/19","PEMBY.BPJS KETENAGAKERJAAN","0","9572881","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("434","0004/KM/19","1102.02.09","2019-01-15","0004/KM/19","PENGAMBILAN BANK MANDIRI U/.KAS","49600000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("433","0004/KM/19","1101.01.09","2019-01-15","0004/KM/19","PENGAMBILAN BANK MANDIRI U/.KAS","0","49600000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("432","0003/KK/19","7105.09","2019-01-08","0003/KK/19","PEMBL.JAMUAN TAMU","0","30000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("431","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.JAMUAN TAMU","30000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("430","0003/KK/19","7407.09","2019-01-08","0003/KK/19","PEMBY.KIRIM TIKI KE JKT","0","15000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("429","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBY.KIRIM TIKI KE JKT","15000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("428","0003/KK/19","5707.09","2019-01-08","0003/KK/19","PREMIUM OPS GUDANG","0","41000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("427","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PREMIUM OPS GUDANG","41000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("426","0003/KK/19","7105.09","2019-01-08","0003/KK/19","PEMBY.JAMUAN RAPAT","0","247000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("425","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBY.JAMUAN RAPAT","247000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("424","0003/KK/19","7305.09","2019-01-08","0003/KK/19","PEMBL.STEMPEL","0","260000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("423","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.STEMPEL","260000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("422","0003/KK/19","5707.09","2019-01-08","0003/KK/19","PREMIUM OPS U/.REPRO","0","20000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("421","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PREMIUM OPS U/.REPRO","20000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("420","0003/KK/19","7305.09","2019-01-08","0003/KK/19","PEMBL.MASKER U/.KTR","0","75000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("419","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.MASKER U/.KTR","75000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("418","0003/KK/19","5707.09","2019-01-08","0003/KK/19","PEMBL.SOLAR U/.FORKLIP","0","25000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("417","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.SOLAR U/.FORKLIP","25000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("416","0003/KK/19","5200.09","2019-01-08","0003/KK/19","PEMBY.HOT STAMPING","0","300000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("415","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBY.HOT STAMPING","300000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("414","0003/KK/19","7305.09","2019-01-08","0003/KK/19","PEMBL.MIFI TELKOMSEL","0","625000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("413","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.MIFI TELKOMSEL","625000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("412","0003/KK/19","7407.09","2019-01-08","0003/KK/19","PEMBL.PENGISIAN PAKET WIFI","0","200000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("411","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PEMBL.PENGISIAN PAKET WIFI","200000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("410","0003/KK/19","5707.09","2019-01-08","0003/KK/19","PREMIUM OPS OB,UMUM PARKIR","0","46000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("409","0003/KK/19","1101.01.09","2019-01-08","0003/KK/19","PREMIUM OPS OB,UMUM PARKIR","46000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("408","0002/KK/19","5200.09","2019-01-02","0002/KK/19","PEMBY.LODING BUKU","0","100000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("407","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBY.LODING BUKU","100000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("406","0002/KK/19","6408.09","2019-01-02","0002/KK/19","PEMBY.ONGKS.KIRIM KASA","0","250000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("405","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBY.ONGKS.KIRIM KASA","250000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("404","0002/KK/19","5200.09","2019-01-02","0002/KK/19","PEMBL.STREAPING","0","270000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("403","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBL.STREAPING","270000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("402","0002/KK/19","5200.09","2019-01-02","0002/KK/19","PEMBL.PLAKBAND","0","280000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("401","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBL.PLAKBAND","280000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("400","0002/KK/19","5707.09","2019-01-02","0002/KK/19","PREMIUM OPD GUDANG","0","24804","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("396","0002/KK/19","5707.09","2019-01-02","0002/KK/19","PREMIUM OPS PEMBELIAN","0","50000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("395","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PREMIUM OPS PEMBELIAN","50000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("394","0002/KK/19","7305.09","2019-01-02","0002/KK/19","PEMBL.TANDON AIR","0","92500","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("393","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBL.TANDON AIR","92500","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("392","0002/KK/19","5200.09","2019-01-02","0002/KK/19","PEMBL.BENANG NYLON","0","47500","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("391","0002/KK/19","1101.01.09","2019-01-02","0002/KK/19","PEMBL.BENANG NYLON","47500","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("389","0001/KK/19","1101.01.09","2019-01-02","0001/KK/19","PEMBL.TINTA PRINTER ADM PRODUKSI","483000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("388","0001/KK/19","5704.09","2019-01-02","0001/KK/19","PEMBL.OLIE MESIN","0","1000000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("387","0001/KK/19","1101.01.09","2019-01-02","0001/KK/19","PEMBL.OLIE MESIN","1000000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("386","0001/KK/19","5200.09","2019-01-02","0001/KK/19","PEMBL.NEW MOALL","0","1440000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("385","0001/KK/19","1101.01.09","2019-01-02","0001/KK/19","PEMBL.NEW MOALL","1440000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("384","0001/KK/19","5200.09","2019-01-02","0001/KK/19","PEMBL.TINTA GREEN KASA HUSADA","0","1568000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("383","0001/KK/19","1101.01.09","2019-01-02","0001/KK/19","PEMBL.TINTA GREEN KASA HUSADA","1568000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("382","0001/KM/19","1105.00.09","2019-01-02","0001/KM/19","TD.YITNO/PURBENGKARA ONGKS CETAK","5000000","0","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("381","0001/KM/19","1101.01.09","2019-01-02","0001/KM/19","TD.YITNO/PURBENGKARA ONGKS CETAK","0","5000000","2019-03-22","Post","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("722","0069/BK/19","2104.15.09","2019-01-29","0069/BK/19","PEMBY.DP SEWA FORKLIP PROYEK KPU","0","10000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("723","0070/BK/19","1102.02.09","2019-01-29","0070/BK/19","PEMBY.DP SEWA FORKLIP PROYEK KPU","38394000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("724","0070/BK/19","2104.15.09","2019-01-29","0070/BK/19","PEMBY.DP SEWA FORKLIP PROYEK KPU","0","38394000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("725","0061/BK/19","1102.02.09","2019-01-29","0061/BK/19","PEMBY.TITIAN ILMU BP.FAUZAN BACKRI","50000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("726","0061/BK/19","2198.03.09","2019-01-29","0061/BK/19","PEMBY.TITIAN ILMU BP.FAUZAN BACKRI","0","50000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("727","0062/BK/19","1102.02.09","2019-01-29","0062/BK/19","PEMBY.BIAYA OUTSORCHING","96200487","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("728","0062/BK/19","2104.15.09","2019-01-29","0062/BK/19","PEMBY.BIAYA OUTSORCHING","0","96200487","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("729","0063/BK/19","1102.02.09","2019-01-29","0063/BK/19","PEMBY.PALET,BONGKAR BUKU K13","3000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("730","0063/BK/19","5200.09","2019-01-29","0063/BK/19","PEMBY.PALET,BONGKAR BUKU K13","0","3000000","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("731","0064/BK/19","1102.02.09","2019-01-29","0064/BK/19","PEMBY.MEKABOX KARDUS PROYEK KPU","30074530","0","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("732","0064/BK/19","2103.00.09","2019-01-29","0064/BK/19","PEMBY.MEKABOX KARDUS PROYEK KPU","0","30074530","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("733","0011/PB/19","1108.06.09","2019-01-23","0011/PB/19","PT.MEKABOX,KARDUS SURAT SUARAKPU","0","266987386","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("734","0011/PB/19","2103.00.09","2019-01-23","0011/PB/19","PT.MEKABOX,KARDUS SURAT SUARAKPU","266987386","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("735","0011/PB/19","1113.01.09","2019-01-23","0011/PB/19","PT.MEKABOX,KARDUS SURAT SUARAKPU PPN","0","26698739","2019-03-22","Post","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("736","0011/PB/19","2103.00.09","2019-01-23","0011/PB/19","PT.MEKABOX,KARDUS SURAT SUARAKPU PPN","26698739","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("737","0021/PB/19","1108.04.09","2019-01-16","0021/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/86CM","0","21555388","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("738","0021/PB/19","2103.00.09","2019-01-16","0021/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/86CM","21555388","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("739","0021/PB/19","1113.01.09","2019-01-16","0021/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/86CM PPN","0","2155539","2019-03-22","Post","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("740","0021/PB/19","2103.00.09","2019-01-16","0021/PB/19","PT.BUDI MITRA JAYA,KERTAS ROLHVS 80/86CM PPN","2155539","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("741","0026/BK/19","1102.02.09","2019-01-26","0026/BK/19","PEMBY.BEST JAYA SUKSES,DOORSLAG LITTO KASA HUSADA","55050000","0","2019-03-22","Post","HD.B028.8","1");
INSERT INTO tabel_transaksi VALUES("742","0026/BK/19","2103.00.09","2019-01-26","0026/BK/19","PEMBY.BEST JAYA SUKSES,DOORSLAG LITTO KASA HUSADA","0","55050000","2019-03-22","Post","HD.B028.8","1");
INSERT INTO tabel_transaksi VALUES("743","XXXX/MM/19","5200.09","2019-01-31","XXXX/MM/19","BIAYA KPU SS","0","46923617","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("744","XXXX/MM/19","2104.15.09","2019-01-31","XXXX/MM/19","BIAYA KPU SS","46923617","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("745","XXXX/PB/19","1108.04.09","2019-01-29","XXXX/PB/19","PT.BEST JAYA SUKSES.KERTAS LITTO","0","50045455","2019-03-22","Post","HD.B028.8","1");
INSERT INTO tabel_transaksi VALUES("746","XXXX/PB/19","2103.00.09","2019-01-29","XXXX/PB/19","PT.BEST JAYA SUKSES.KERTAS LITTO","50045455","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("747","XXXX/PB/19","1113.01.09","2019-01-29","XXXX/PB/19","PT.BEST JAYA SUKSES.KERTAS LITTO PPN","0","5004545","2019-03-22","Post","HD.B028.8","1");
INSERT INTO tabel_transaksi VALUES("748","XXXX/PB/19","2103.00.09","2019-01-29","XXXX/PB/19","PT.BEST JAYA SUKSES.KERTAS LITTO PPN","5004545","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("749","0012/MM/19","5200.09","2019-01-31","0012/MM/19","BIAYA PEMASARAN","0","98356898","2019-03-22","Post","H3.D005.8","1");
INSERT INTO tabel_transaksi VALUES("750","0012/MM/19","2198.03.09","2019-01-31","0012/MM/19","BIAYA PEMASARAN","98356898","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("751","0013/MM/19","5200.09","2019-01-31","0013/MM/19","BIAYA CETAK K13","0","550000000","2019-03-22","Post","H3.T001.8","1");
INSERT INTO tabel_transaksi VALUES("752","0013/MM/19","2198.03.09","2019-01-31","0013/MM/19","BIAYA CETAK K13","550000000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("753","0012/PB/19","1108.06.09","2019-01-23","0012/PB/19","PT.CIPTA MULTIBP,KARDUS SURATSUARA","0","666626400","2019-03-22","Post","HD.C020.8","1");
INSERT INTO tabel_transaksi VALUES("754","0012/PB/19","2103.00.09","2019-01-23","0012/PB/19","PT.CIPTA MULTIBP,KARDUS SURATSUARA","666626400","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("755","0012/PB/19","1113.01.09","2019-01-23","0012/PB/19","PT.CIPTA MULTIBP,KARDUS SURATSUARA PPN","0","66662640","2019-03-22","Post","HD.C020.8","1");
INSERT INTO tabel_transaksi VALUES("756","0012/PB/19","2103.00.09","2019-01-23","0012/PB/19","PT.CIPTA MULTIBP,KARDUS SURATSUARA PPN","66662640","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("757","0024/PB/19","1108.06.09","2019-01-24","0024/PB/19","MEDIA PRISMA GRAFIKA,WEFOUNT 1DRUM","0","5800000","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("758","0024/PB/19","2103.00.09","2019-01-24","0024/PB/19","MEDIA PRISMA GRAFIKA,WEFOUNT 1DRUM","5800000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("759","0024/PB/19","1113.01.09","2019-01-24","0024/PB/19","MEDIA PRISMA GRAFIKA,WEFOUNT 1DRUM PPN","0","694000","2019-03-22","Post","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("760","0024/PB/19","2103.00.09","2019-01-24","0024/PB/19","MEDIA PRISMA GRAFIKA,WEFOUNT 1DRUM PPN","694000","0","2019-03-22","Post","","1");
INSERT INTO tabel_transaksi VALUES("763","0076/KM/19","1101.01.09","2019-02-06","0076/KM/19","TD.BP.YITNO/PURBENGKARA,PELUNASAN CETAKAN","0","13658500","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("764","0076/KM/19","1105.00.09","2019-02-06","0076/KM/19","TD.BP.YITNO/PURBENGKARA,PELUNASAN CETAKAN","13658500","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("765","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.SOLAR U/.FORKLIP","135000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("766","0077/KK/19","2104.15.09","2019-02-08","0077/KK/19","PEMBL.SOLAR U/.FORKLIP","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("767","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.BATREI,SAPU,MASKER,CLUBU/.KTR","151500","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("768","0077/KK/19","7305","2019-02-08","0077/KK/19","PEMBL.BATREI,SAPU,MASKER,CLUBU/.KTR","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("769","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.ALAT TULIS KTR","38000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("770","0077/KK/19","7305","2019-02-08","0077/KK/19","PEMBL.ALAT TULIS KTR","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("771","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.KEBUTUHAN PRODUKSI","194409","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("772","0077/KK/19","2104.15.09","2019-02-08","0077/KK/19","PEMBL.KEBUTUHAN PRODUKSI","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("773","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.SUPELMEN U/.PRODUKSI","111000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("774","0077/KK/19","2104.15.09","2019-02-08","0077/KK/19","PEMBL.SUPELMEN U/.PRODUKSI","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("775","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.REPAIR DRAT","30000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("776","0077/KK/19","5704","2019-02-08","0077/KK/19","PEMBL.REPAIR DRAT","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("777","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PEMBL.MATREI U/.KTR","90000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("778","0077/KK/19","7407","2019-02-08","0077/KK/19","PEMBL.MATREI U/.KTR","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("779","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PREMIUM OPS OB","10000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("780","0077/KK/19","2104.15.09","2019-02-08","0077/KK/19","PREMIUM OPS OB","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("781","0077/KK/19","1101.01.09","2019-02-08","0077/KK/19","PREMIUM OPS REPRO","25000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("782","0077/KK/19","2104.15.09","2019-02-08","0077/KK/19","PREMIUM OPS REPRO","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("783","0080/KK/19","1101.01.09","2019-02-08","0080/KK/19","PEMBY.TRANSPORTASI UNDANGAN KOMISARIS HAJATAN","813500","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("784","0080/KK/19","6407","2019-02-08","0080/KK/19","PEMBY.TRANSPORTASI UNDANGAN KOMISARIS HAJATAN","0","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("785","0096/KM/19","1101.01.09","2019-02-15","0096/KM/19","PENGAMBILAN CEK BANK MANDIRI U/.KAS","0","128200000","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("786","0096/KM/19","1102.02.09","2019-02-15","0096/KM/19","PENGAMBILAN CEK BANK MANDIRI U/.KAS","128200000","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("787","0100/KK/19","1101.01.09","2019-02-15","0100/KK/19","PEMBY.BIAYA OPS KPU","2781900","0","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("788","0100/KK/19","2104.15.09","2019-02-15","0100/KK/19","PEMBY.BIAYA OPS KPU","0","2781900","0000-00-00","","PD.Y003.8","1");
INSERT INTO tabel_transaksi VALUES("789","0101/KM/19","1101.01.09","2019-02-15","0101/KM/19","TD.KASA HUSADA,CETAK KERTAS SULFIT","0","7590000","0000-00-00","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("790","0101/KM/19","1105.00.09","2019-02-15","0101/KM/19","TD.KASA HUSADA,CETAK KERTAS SULFIT","7590000","0","0000-00-00","","PD.K029.8","1");
INSERT INTO tabel_transaksi VALUES("791","0079/KK/19","1101.01.09","2019-02-08","0079/KK/19","PEMMBY.TRANSPORTASI,AKOMODASITIKET","3765891","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("792","0079/KK/19","7105","2019-02-08","0079/KK/19","PEMMBY.TRANSPORTASI,AKOMODASITIKET","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("793","0071/BK/19","1102.02.09","2019-02-06","0071/BK/19","PEMBY.HANDPALET CAPACITY 3 TONU/.KPU","7120000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("794","0071/BK/19","2104.15.09","2019-02-06","0071/BK/19","PEMBY.HANDPALET CAPACITY 3 TONU/.KPU","0","7120000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("795","0071/BK/19","1102.02.09","2019-02-06","0071/BK/19","PEMBY.PT.PLATENO EXPEDISI BUKUK13","7600000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("796","0071/BK/19","5200","2019-02-06","0071/BK/19","PEMBY.PT.PLATENO EXPEDISI BUKUK13","0","7600000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("797","0073/BK/19","1102.02.09","2019-02-06","0073/BK/19","PEMBY.PT.POS IND.EXP.BUKU","8500000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("798","0073/BK/19","5200","2019-02-06","0073/BK/19","PEMBY.PT.POS IND.EXP.BUKU","0","8500000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("799","0075/BK/19","1102.02.09","2019-02-06","0075/BK/19","PEMBY.PELUNASAN PAVING BELAKANG GEDUNG","4335000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("800","0075/BK/19","1701.02.09","2019-02-06","0075/BK/19","PEMBY.PELUNASAN PAVING BELAKANG GEDUNG","0","4335000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("801","0078/BM/19","1102.02.09","2019-02-08","0078/BM/19","TRM.PINJAMAN SEMENTARA BANK MANDIRI","0","70000000","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("802","0078/BM/19","2198.50.09","2019-02-08","0078/BM/19","TRM.PINJAMAN SEMENTARA BANK MANDIRI","70000000","0","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("803","0081/BK/19","1102.02.09","2019-02-08","0081/BK/19","PEMBY.AIR MINUM DAN SIRUP U/.PROYEK KPU","9906600","0","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("804","0081/BK/19","2104.15.09","2019-02-08","0081/BK/19","PEMBY.AIR MINUM DAN SIRUP U/.PROYEK KPU","0","9906600","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("805","0082/BK/19","1102.02.09","2019-02-08","0082/BK/19","PEMBY.MEKA BOX PELUNASAN KARDUS ROYEK KPU","30074530","0","0000-00-00","","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("806","0082/BK/19","2103.00.09","2019-02-08","0082/BK/19","PEMBY.MEKA BOX PELUNASAN KARDUS ROYEK KPU","0","30074530","0000-00-00","","HD.M051.8","1");
INSERT INTO tabel_transaksi VALUES("807","0083/BK/19","1102.02.09","2019-02-08","0083/BK/19","PEMBY.MERY SETIAWAN PLASTIK","10208785","0","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("808","0083/BK/19","2103.00.09","2019-02-08","0083/BK/19","PEMBY.MERY SETIAWAN PLASTIK","0","10208785","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("809","0084/BK/19","1102.02.09","2019-02-08","0084/BK/19","PEMBY.PRINTER KEB.PROYRK KPU","5545000","0","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("810","0084/BK/19","2104.15.09","2019-02-08","0084/BK/19","PEMBY.PRINTER KEB.PROYRK KPU","0","5545000","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("811","0086/BK/19","1102.02.09","2019-02-08","0086/BK/19","PEMBY.EXPEDISI PENGAMBILAN KERTAS","600000","0","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("812","0086/BK/19","5200","2019-02-08","0086/BK/19","PEMBY.EXPEDISI PENGAMBILAN KERTAS","0","600000","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("813","0087/BM/19","1102.02.09","2019-02-08","0087/BM/19","TD.INTAN PARIWARA,CETAK BUKU K13","0","2147483647","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("814","0087/BM/19","1105.00.09","2019-02-08","0087/BM/19","TD.INTAN PARIWARA,CETAK BUKU K13","2147483647","0","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("815","0088/BK/19","1102.02.09","2019-02-08","0088/BK/19","PEMBY.JEBE PRESS MEDIA BUKU K13","40938750","0","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("816","0088/BK/19","2104.10.09","2019-02-08","0088/BK/19","PEMBY.JEBE PRESS MEDIA BUKU K13","0","40938750","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("817","0089/BK/19","1102.02.09","2019-02-08","0089/BK/19","PEMBY.CAHAYA MAS PLASTIK","6240000","0","0000-00-00","","HD.C021.8","1");
INSERT INTO tabel_transaksi VALUES("818","0089/BK/19","2103.00.09","2019-02-08","0089/BK/19","PEMBY.CAHAYA MAS PLASTIK","0","6240000","0000-00-00","","HD.C021.8","1");
INSERT INTO tabel_transaksi VALUES("819","0090/BK/19","1102.02.09","2019-02-08","0090/BK/19","PEMBY.TELKOM ANGSURAN BUKU K13","2000000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("820","0090/BK/19","2198.03.09","2019-02-08","0090/BK/19","PEMBY.TELKOM ANGSURAN BUKU K13","0","2000000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("821","0091/BK/19","1102.02.09","2019-02-14","0091/BK/19","PEMBY.IURAN ASPERINDO","13000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("822","0091/BK/19","7419","2019-02-14","0091/BK/19","PEMBY.IURAN ASPERINDO","0","13000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("823","0094/BK/19","1102.02.09","2019-02-15","0094/BK/19","PEMBY.SPJ P.NASIR KE JKT PROYEK KPU","15620000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("824","0094/BK/19","2104.15.09","2019-02-15","0094/BK/19","PEMBY.SPJ P.NASIR KE JKT PROYEK KPU","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("825","0095/BK/19","1102.02.09","2019-02-15","0095/BK/19","PEMBY.SPJ P.ARIF KE JKT PROYEKKPU","2185500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("826","0095/BK/19","2104.15.09","2019-02-15","0095/BK/19","PEMBY.SPJ P.ARIF KE JKT PROYEKKPU","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("827","0102/BK/19","1102.02.09","2019-02-15","0102/BK/19","PEMBY.AFA TRANS EXPEDISI BUK K13","26300000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("828","0102/BK/19","5200","2019-02-15","0102/BK/19","PEMBY.AFA TRANS EXPEDISI BUK K13","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("829","0103/BK/19","1102.02.09","2019-02-15","0103/BK/19","PEMBY.RAYA EXSPRES EXSPEDISI ROLL","3200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("830","0103/BK/19","2104.15.09","2019-02-15","0103/BK/19","PEMBY.RAYA EXSPRES EXSPEDISI ROLL","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("831","0104/BM/19","1102.02.09","2019-02-15","0104/BM/19","TD.INTAN PARIWARA,CETAK BUKU K13","0","2147483647","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("832","0104/BM/19","1105.00.09","2019-02-15","0104/BM/19","TD.INTAN PARIWARA,CETAK BUKU K13","2147483647","0","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("833","0108/BK/19","1102.02.09","2019-02-15","0108/BK/19","PEMBY.STRAPPING BAND PROYEK KPU","6434890","0","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("834","0108/BK/19","2104.15.09","2019-02-15","0108/BK/19","PEMBY.STRAPPING BAND PROYEK KPU","0","6434890","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("835","0109/BK/19","1102.02.09","2019-02-15","0109/BK/19","PEMBY.SEWA GENSET CV.INTI DAYA","1600000","0","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("836","0109/BK/19","2104.15.09","2019-02-15","0109/BK/19","PEMBY.SEWA GENSET CV.INTI DAYA","0","1600000","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("837","0110/BK/19","1102.02.09","2019-02-15","0110/BK/19","PEMBY.MERY SETIAWAN PLASTIK PROYEK KPU","3488240","0","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("838","0110/BK/19","2103.00.09","2019-02-15","0110/BK/19","PEMBY.MERY SETIAWAN PLASTIK PROYEK KPU","0","3488240","0000-00-00","","HD.M054.8","1");
INSERT INTO tabel_transaksi VALUES("839","0111/BK/19","1102.02.09","2019-02-15","0111/BK/19","PEMBY.TITIN ILMU PELUNASAN BUKU K13","56159091","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("840","0111/BK/19","2198.03.09","2019-02-15","0111/BK/19","PEMBY.TITIN ILMU PELUNASAN BUKU K13","0","56159091","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("841","0112/BK/19","1102.02.09","2019-02-26","0112/BK/19","PEMBY.CV.MEDIA PRISMA GRAFIKA","45636400","0","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("842","0112/BK/19","2103.00.09","2019-02-26","0112/BK/19","PEMBY.CV.MEDIA PRISMA GRAFIKA","0","45636400","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("843","0116/BK/19","1102.02.09","2019-02-26","0116/BK/19","PEMBY.MAKAN KONSUMSI PROYEK KPU","27600000","0","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("844","0116/BK/19","2104.15.09","2019-02-26","0116/BK/19","PEMBY.MAKAN KONSUMSI PROYEK KPU","0","27600000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("845","0117/BK/19","1102.02.09","2019-02-26","0117/BK/19","PEMBY.BUNGA BANK BRI","20000000","0","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("846","0117/BK/19","2104.99.09","2019-02-26","0117/BK/19","PEMBY.BUNGA BANK BRI","0","20000000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("847","0118/BK/19","1102.02.09","2019-02-26","0118/BK/19","PEMBY.GAJI KARY.PROYEK KPU","347581713","0","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("848","0118/BK/19","2104.15.09","2019-02-26","0118/BK/19","PEMBY.GAJI KARY.PROYEK KPU","0","347581713","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("849","0120/BM/19","1102.02.09","2019-02-26","0120/BM/19","TRM.BUNGA BANK HARDA","0","8611471","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("850","0120/BM/19","8103","2019-02-26","0120/BM/19","TRM.BUNGA BANK HARDA","8611471","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("851","0124/BK/19","1102.02.09","2019-02-26","0124/BK/19","PENGAMBILAN CEK BANK MANDIRI U/.KAS","37900000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("852","0124/BK/19","1101.01.09","2019-02-26","0124/BK/19","PENGAMBILAN CEK BANK MANDIRI U/.KAS","0","37900000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("853","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.SOLAR U/.FORKLIP","215000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("854","0105/KK/19","2104.15.09","2019-02-15","0105/KK/19","PEMBL.SOLAR U/.FORKLIP","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("855","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.OPS LODING BUKU K13","100000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("856","0105/KK/19","5200","2019-02-15","0105/KK/19","PEMBL.OPS LODING BUKU K13","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("857","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PREMIUM OPS OB","15000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("858","0105/KK/19","2104.15.09","2019-02-15","0105/KK/19","PREMIUM OPS OB","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("859","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.KEBUTUHAN KTR","182600","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("860","0105/KK/19","7305","2019-02-15","0105/KK/19","PEMBL.KEBUTUHAN KTR","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("861","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.KEKURANGAN MAKAN P.KPU","180000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("862","0105/KK/19","2104.15.09","2019-02-15","0105/KK/19","PEMBL.KEKURANGAN MAKAN P.KPU","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("863","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBY.FOTO COPY","42500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("864","0105/KK/19","6402","2019-02-15","0105/KK/19","PEMBY.FOTO COPY","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("865","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.KEBUTUHAN KTR","43200","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("866","0105/KK/19","7305","2019-02-15","0105/KK/19","PEMBL.KEBUTUHAN KTR","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("867","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.MAJUN U/.PRODUKSI","101250","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("868","0105/KK/19","2104.15.09","2019-02-15","0105/KK/19","PEMBL.MAJUN U/.PRODUKSI","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("869","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.KONSUMSI RAPART","100000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("870","0105/KK/19","2104.15.09","2019-02-15","0105/KK/19","PEMBL.KONSUMSI RAPART","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("871","0106/KK/19","1101.01.09","2019-02-15","0106/KK/19","PEMBY.BIAYA BORONGAN PEKERJAANBUKU K13","7378000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("872","0106/KK/19","5200","2019-02-15","0106/KK/19","PEMBY.BIAYA BORONGAN PEKERJAANBUKU K13","0","7378000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("873","0114/KK/19","1101.01.09","2019-02-26","0114/KK/19","PEMBY.BIAYA LEMBUR PRODUKSI ANDANY FERY","1350000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("874","0114/KK/19","2104.15.09","2019-02-26","0114/KK/19","PEMBY.BIAYA LEMBUR PRODUKSI ANDANY FERY","0","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("875","0122/KM/19","1101.01.09","2019-02-26","0122/KM/19","PENGAMBILAN BANK MANDIRI U/.PRODUKSI BP.ARIEF MAULANA","0","7000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("876","0122/KM/19","1102.02.09","2019-02-26","0122/KM/19","PENGAMBILAN BANK MANDIRI U/.PRODUKSI BP.ARIEF MAULANA","7000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("877","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.ABC WASH","645000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("878","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.ABC WASH","0","645000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("879","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.OO VERNIS","340000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("880","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.OO VERNIS","0","340000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("881","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.VANBELT U/.MESIN","34000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("882","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.VANBELT U/.MESIN","0","34000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("883","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","25500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("884","0123/KK/19","5707","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","0","25500","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("885","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PREMIUM DUPLEX UNDELAY","325000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("886","0123/KK/19","5200","2019-02-26","0123/KK/19","PREMIUM DUPLEX UNDELAY","0","325000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("887","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.VAMBEL U/.MESIN","60000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("888","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.VAMBEL U/.MESIN","0","60000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("889","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.BAUT LG U/.MESIN","40000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("890","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.BAUT LG U/.MESIN","0","40000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("891","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.SPON VISCOVITA","125000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("892","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.SPON VISCOVITA","0","125000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("893","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.SELANG U/.MESIN","25000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("894","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.SELANG U/.MESIN","0","25000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("895","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.PENTIL+BUKAAN U/.MESIN","65000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("896","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.PENTIL+BUKAAN U/.MESIN","0","65000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("897","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","20000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("898","0123/KK/19","5707","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","0","20000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("899","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.MATA BOR U/.MESIN","94500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("900","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.MATA BOR U/.MESIN","0","94500","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("901","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.LEM FOX","200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("902","0123/KK/19","5200","2019-02-26","0123/KK/19","PEMBL.LEM FOX","0","200000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("903","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.AMPLAS U/.MESIN","31000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("904","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.AMPLAS U/.MESIN","0","31000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("905","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBY.PAKET JNE KE JKT","18000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("906","0123/KK/19","7407","2019-02-26","0123/KK/19","PEMBY.PAKET JNE KE JKT","0","18000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("907","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.MATA BOR U/.MESIN","13000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("908","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.MATA BOR U/.MESIN","0","13000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("909","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.KUNCI SHOCK","20000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("910","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.KUNCI SHOCK","0","20000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("911","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","20000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("912","0123/KK/19","5707","2019-02-26","0123/KK/19","PREMIUM OPS PEMBELIAN","0","20000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("913","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.BEARING 368 U/.MESIN","3000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("914","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.BEARING 368 U/.MESIN","0","3000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("915","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.AMPLAS U/.MESIN","26500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("916","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.AMPLAS U/.MESIN","0","26500","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("917","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBL.OLIE U/.MESIN","40000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("918","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBL.OLIE U/.MESIN","0","40000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("919","0123/KK/19","1101.01.09","2019-02-26","0123/KK/19","PEMBY.PERBAIKAN SEPATU FORKLIP","2640000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("920","0123/KK/19","5704","2019-02-26","0123/KK/19","PEMBY.PERBAIKAN SEPATU FORKLIP","0","2640000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("921","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.SOLAR U/.FORKLIP","123000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("922","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.SOLAR U/.FORKLIP","0","123000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("923","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.MASKER,OBAT2TAN P.KPU","63300","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("924","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.MASKER,OBAT2TAN P.KPU","0","63300","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("925","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.HVS WARNA U/.LABEL KPU","230000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("926","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.HVS WARNA U/.LABEL KPU","0","230000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("927","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.AIR MINUM U/.KPU","34000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("928","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.AIR MINUM U/.KPU","0","34000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("929","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.JAMUAN TAMU U/.SULTRA","176000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("930","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBY.JAMUAN TAMU U/.SULTRA","0","176000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("931","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.BIAYA PENGOBATAN KECELAKAAN KERJA","405500","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("932","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBY.BIAYA PENGOBATAN KECELAKAAN KERJA","0","405500","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("933","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.PAPAN BUNGA","500000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("934","0127/KK/19","5200","2019-02-26","0127/KK/19","PEMBY.PAPAN BUNGA","0","500000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("935","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.TRANSPORTASI KEUANGAN","100000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("936","0127/KK/19","7414","2019-02-26","0127/KK/19","PEMBY.TRANSPORTASI KEUANGAN","0","100000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("937","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.BERAS DI KOP.PWU","600000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("938","0127/KK/19","7105","2019-02-26","0127/KK/19","PEMBL.BERAS DI KOP.PWU","0","600000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("939","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.SIROPEN U/.KIF OF KPU","300000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("940","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.SIROPEN U/.KIF OF KPU","0","300000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("941","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.TISSUE KEB.KTR","20000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("942","0127/KK/19","7305","2019-02-26","0127/KK/19","PEMBL.TISSUE KEB.KTR","0","20000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("943","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.TINTA,ISI STEPLES","29000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("944","0127/KK/19","7305","2019-02-26","0127/KK/19","PEMBL.TINTA,ISI STEPLES","0","29000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("945","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PREMIUM OPS OB,PEMBELIAN","37600","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("946","0127/KK/19","5707","2019-02-26","0127/KK/19","PREMIUM OPS OB,PEMBELIAN","0","37600","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("947","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.MAJUN U/.MESIN","101250","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("948","0127/KK/19","5200","2019-02-26","0127/KK/19","PEMBL.MAJUN U/.MESIN","0","101250","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("949","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.GEMBOK U/.GUDANG","20000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("950","0127/KK/19","7305","2019-02-26","0127/KK/19","PEMBL.GEMBOK U/.GUDANG","0","20000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("951","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.PENGIRIMAN DOK.TIKI","21000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("952","0127/KK/19","7407","2019-02-26","0127/KK/19","PEMBY.PENGIRIMAN DOK.TIKI","0","21000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("953","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.FOTO COPY","148200","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("954","0127/KK/19","6402","2019-02-26","0127/KK/19","PEMBY.FOTO COPY","0","148200","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("955","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.SOLAR U/.FORKLIP","50000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("956","0127/KK/19","2104.15.09","2019-02-26","0127/KK/19","PEMBL.SOLAR U/.FORKLIP","0","50000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("957","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PREMIUM OPS PEMBELIAN+PARKIR","30000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("958","0127/KK/19","5707","2019-02-26","0127/KK/19","PREMIUM OPS PEMBELIAN+PARKIR","0","30000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("959","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.DEMPUL U/.MESIN","45000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("960","0127/KK/19","5704","2019-02-26","0127/KK/19","PEMBL.DEMPUL U/.MESIN","0","45000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("961","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBL.DOUBLE TAPE","360000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("962","0127/KK/19","5200","2019-02-26","0127/KK/19","PEMBL.DOUBLE TAPE","0","360000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("963","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.ASAH PISAU U/.MESIN POTONG","90000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("964","0127/KK/19","5704","2019-02-26","0127/KK/19","PEMBY.ASAH PISAU U/.MESIN POTONG","0","90000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("965","0127/KK/19","1101.01.09","2019-02-26","0127/KK/19","PEMBY.PAJAK PPH 21 KARY.","1532083","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("966","0127/KK/19","7109","2019-02-26","0127/KK/19","PEMBY.PAJAK PPH 21 KARY.","0","1532083","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("967","0097/KK/19","1101.01.09","2019-02-15","0097/KK/19","PEMBY.PINJAMAN SEMENTARA BANKMANDIRI","70000000","0","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("968","0097/KK/19","2198.50.09","2019-02-15","0097/KK/19","PEMBY.PINJAMAN SEMENTARA BANKMANDIRI","0","70000000","0000-00-00","","HL.B012.8","1");
INSERT INTO tabel_transaksi VALUES("969","0105/KK/19","1101.01.09","2019-02-15","0105/KK/19","PEMBL.ATK U/.KANTOR","157800","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("970","0105/KK/19","7305","2019-02-15","0105/KK/19","PEMBL.ATK U/.KANTOR","0","157800","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("971","0085/BK/19","1102.02.09","2019-02-08","0085/BK/19","PEMBY.BIAYA KELOLA BANK MANDIRI","30800000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("972","0085/BK/19","7419","2019-02-08","0085/BK/19","PEMBY.BIAYA KELOLA BANK MANDIRI","0","30800000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("973","0085/BK/19","1102.02.09","2019-02-08","0085/BK/19","PEMBY.TRANSFER SALDO REK.KELOLA","2000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("974","0085/BK/19","7419","2019-02-08","0085/BK/19","PEMBY.TRANSFER SALDO REK.KELOLA","0","2000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("975","0095/BK/19","1102.02.09","2019-02-15","0095/BK/19","PEMBY.SEWA GEDUNG,BANGUNAN PT.IEWJ","35000000","0","0000-00-00","","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("976","0095/BK/19","2198.50.09","2019-02-15","0095/BK/19","PEMBY.SEWA GEDUNG,BANGUNAN PT.IEWJ","0","35000000","0000-00-00","","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("977","0012/MM/19","5713","2019-02-28","0012/MM/19","PENYST.MESIN PRODUKSI","0","10645013","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("978","0012/MM/19","1403.51.09","2019-02-28","0012/MM/19","PENYST.MESIN PRODUKSI","10645013","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("979","0013/MM/19","7310","2019-02-28","0013/MM/19","PENYST.PERALATAN KANTOR","0","852217","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("980","0013/MM/19","1405.52.09","2019-02-28","0013/MM/19","PENYST.PERALATAN KANTOR","852217","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("981","0014/MM/19","5711","2019-02-28","0014/MM/19","PENYST.BANGUNAN PABRIK","0","1064376","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("982","0014/MM/19","1402.51.09","2019-02-28","0014/MM/19","PENYST.BANGUNAN PABRIK","1064376","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("983","0015/MM/19","5717","2019-02-28","0015/MM/19","PENYST.PERALATAN PABRIK","0","52497","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("984","0015/MM/19","1405.51.09","2019-02-28","0015/MM/19","PENYST.PERALATAN PABRIK","52497","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("985","0016/MM/19","8206","2019-02-28","0016/MM/19","CAD.BACK TO BACK BRI","0","20000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("986","0016/MM/19","2104.99.09","2019-02-28","0016/MM/19","CAD.BACK TO BACK BRI","20000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("987","0021/MM/19","7101","2019-02-28","0021/MM/19","CAD.BIAYA GAJI KOMISARIS","0","12000000","0000-00-00","","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("988","0021/MM/19","2104.01.09","2019-02-28","0021/MM/19","CAD.BIAYA GAJI KOMISARIS","12000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("989","0021/MM/19","8202","2019-02-28","0021/MM/19","CAD.BEBAN BIAYA PENDIDIKAN","0","1000000","0000-00-00","","HL.I001.8","1");
INSERT INTO tabel_transaksi VALUES("990","0021/MM/19","2104.10.09","2019-02-28","0021/MM/19","CAD.BEBAN BIAYA PENDIDIKAN","1000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("991","0043/PB/19","1108.06.09","2019-02-01","0043/PB/19","CV.MITRA SETIA SEJAHTERA,MAXIFONT","0","2900000","0000-00-00","","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("992","0043/PB/19","2103.00.09","2019-02-01","0043/PB/19","CV.MITRA SETIA SEJAHTERA,MAXIFONT","2900000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("993","0043/PB/19","1113.01.09","2019-02-01","0043/PB/19","CV.MITRA SETIA SEJAHTERA,MAXIFONT PPN","0","290000","0000-00-00","","HD.M053.8","1");
INSERT INTO tabel_transaksi VALUES("994","0043/PB/19","2103.00.09","2019-02-01","0043/PB/19","CV.MITRA SETIA SEJAHTERA,MAXIFONT PPN","290000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("995","0044/PB/19","1108.06.09","2019-02-04","0044/PB/19","CV.BINTANG LANCAR,FOLEX 889X595X010+020","0","4150000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("996","0044/PB/19","2103.00.09","2019-02-04","0044/PB/19","CV.BINTANG LANCAR,FOLEX 889X595X010+020","4150000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("997","0044/PB/19","1113.01.09","2019-02-04","0044/PB/19","CV.BINTANG LANCAR,FOLEX 889X595X010+020 PPN","0","415000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("998","0044/PB/19","2103.00.09","2019-02-04","0044/PB/19","CV.BINTANG LANCAR,FOLEX 889X595X010+020 PPN","415000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("999","0045/PB/19","1108.06.09","2019-02-04","0045/PB/19","CV.MEDIA PRISMA GRAFIKA,WEBFONT AT","0","6200000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1000","0045/PB/19","2103.00.09","2019-02-04","0045/PB/19","CV.MEDIA PRISMA GRAFIKA,WEBFONT AT","6200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1001","0045/PB/19","1113.01.09","2019-02-04","0045/PB/19","CV.MEDIA PRISMA GRAFIKA,WEBFONT AT PPN","0","620000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1002","0045/PB/19","2103.00.09","2019-02-04","0045/PB/19","CV.MEDIA PRISMA GRAFIKA,WEBFONT AT PPN","620000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1003","0046/PB/19","1108.06.09","2019-02-06","0046/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650","0","1140000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1004","0046/PB/19","2103.00.09","2019-02-06","0046/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650","1140000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1005","0046/PB/19","1113.01.09","2019-02-06","0046/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650 PPN","0","114000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1006","0046/PB/19","2103.00.09","2019-02-06","0046/PB/19","CV.MEDIA PRISMA GRAFIKA,CLEANER 650 PPN","114000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1007","0047/PB/19","1108.06.09","2019-02-06","0047/PB/19","CV.BINTANG LANCAR,PLATE CLEANER","0","523637","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1008","0047/PB/19","2103.00.09","2019-02-06","0047/PB/19","CV.BINTANG LANCAR,PLATE CLEANER","523637","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1009","0047/PB/19","1113.01.09","2019-02-06","0047/PB/19","CV.BINTANG LANCAR,PLATE CLEANER PPN","0","52363","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1010","0047/PB/19","2103.00.09","2019-02-06","0047/PB/19","CV.BINTANG LANCAR,PLATE CLEANER PPN","52363","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1011","0048/PB/19","1108.06.09","2019-02-06","0048/PB/19","CV.BINTANG LANCAR,IPA ALKOHOL","0","2200000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1012","0048/PB/19","2103.00.09","2019-02-06","0048/PB/19","CV.BINTANG LANCAR,IPA ALKOHOL","2200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1013","0048/PB/19","1113.01.09","2019-02-06","0048/PB/19","CV.BINTANG LANCAR,IPA ALKOHOLPPN","0","220000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1014","0048/PB/19","2103.00.09","2019-02-06","0048/PB/19","CV.BINTANG LANCAR,IPA ALKOHOLPPN","220000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1015","0049/PB/19","1108.06.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB889X695X1.70","0","5200000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1016","0049/PB/19","2103.00.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB889X695X1.70","5200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1017","0049/PB/19","1113.01.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB889X695X1.70 PPN","0","520000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1018","0049/PB/19","2103.00.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB889X695X1.70 PPN","520000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1019","0049/PB/19","1108.06.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB1045X800X1,95","0","4080000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1020","0049/PB/19","2103.00.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB1045X800X1,95","4080000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1021","0049/PB/19","1113.01.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB1045X800X1,95 PPN","0","408000","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1022","0049/PB/19","2103.00.09","2019-02-06","0049/PB/19","CV.BINTANG LANCAR,BLANKET WEB1045X800X1,95 PPN","408000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1023","0051/PB/19","1108.06.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,WEBFONT AT","0","6200000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1024","0051/PB/19","2103.00.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,WEBFONT AT","6200000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1025","0051/PB/19","1108.06.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,CLEANER 650","0","1140000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1026","0051/PB/19","2103.00.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,CLEANER 650","1140000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1027","0051/PB/19","1113.01.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,CLEANER 650 PPN","0","734000","0000-00-00","","HD.M052.8","1");
INSERT INTO tabel_transaksi VALUES("1028","0051/PB/19","2103.00.09","2019-02-28","0051/PB/19","CV.MEDIA PRISMA,CLEANER 650 PPN","734000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1029","0052/PB/19","1108.06.09","2019-02-28","0052/PB/19","CV.BINTANG LANCAR,PLATE CLEANER","0","523637","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1030","0052/PB/19","2103.00.09","2019-02-28","0052/PB/19","CV.BINTANG LANCAR,PLATE CLEANER","523637","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1031","0052/PB/19","1113.01.09","2019-02-28","0052/PB/19","CV.BINTANG LANCAR,PLATE CLEANER PPN","0","52363","0000-00-00","","HD.B030.8","1");
INSERT INTO tabel_transaksi VALUES("1032","0052/PB/19","2103.00.09","2019-02-28","0052/PB/19","CV.BINTANG LANCAR,PLATE CLEANER PPN","52363","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1033","0013/PB/19","1108.06.09","2019-02-14","0013/PB/19","PT.NACHINDO TAPE INDUSTRI,OPPNACHI UK.48X100 YARD","0","7056000","0000-00-00","","HD.N011.8","1");
INSERT INTO tabel_transaksi VALUES("1034","0013/PB/19","2103.00.09","2019-02-14","0013/PB/19","PT.NACHINDO TAPE INDUSTRI,OPPNACHI UK.48X100 YARD","7056000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1035","0013/PB/19","1113.01.09","2019-02-14","0013/PB/19","PT.NACHINDO TAPE INDUSTRI,OPPNACHI UK.48X100 YARD PPN","0","705600","0000-00-00","","HD.N011.8","1");
INSERT INTO tabel_transaksi VALUES("1036","0013/PB/19","2103.00.09","2019-02-14","0013/PB/19","PT.NACHINDO TAPE INDUSTRI,OPPNACHI UK.48X100 YARD PPN","705600","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1037","0016/PB/19","1108.04.09","2019-02-01","0016/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80GR","0","2147483647","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1038","0016/PB/19","2103.00.09","2019-02-01","0016/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80GR","2147483647","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1039","0016/PB/19","1113.01.09","2019-02-01","0016/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80GR PPN","0","431379867","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1040","0016/PB/19","2103.00.09","2019-02-01","0016/PB/19","PT.BUDI MITRA JAYA,KERTAS SHEET 80GR PPN","431379867","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1041","0015/PB/19","1108.04.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","0","2147483647","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1042","0015/PB/19","2103.00.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","2147483647","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1043","0015/PB/19","1108.04.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","0","2147483647","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1044","0015/PB/19","2103.00.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","2147483647","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1045","0015/PB/19","1108.04.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","0","2147483647","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1046","0015/PB/19","2103.00.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR","2147483647","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1047","0015/PB/19","1113.01.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR PPN","0","1662223765","0000-00-00","","HD.B029.8","1");
INSERT INTO tabel_transaksi VALUES("1048","0015/PB/19","2103.00.09","2019-02-01","0015/PB/19","PT.BUDI MITRA JAYA,KERTAS RPLL80GR PPN","1662223765","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1049","0007/PJ/19","1105.00.09","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03","0","2147483647","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1050","0007/PJ/19","4101","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03","2147483647","0","0000-00-00","","PD.K045.8","1");
INSERT INTO tabel_transaksi VALUES("1051","0007/PJ/19","1105.00.09","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03","0","2147483647","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1052","0007/PJ/19","4101","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03","2147483647","0","0000-00-00","","PD.K045.8","1");
INSERT INTO tabel_transaksi VALUES("1053","0007/PJ/19","1105.00.09","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03 PPN","0","1152632488","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1054","0007/PJ/19","2105.01.09","2019-02-28","0007/PJ/19","KPU,CETAK SURAT SUARA TK.03 PPN","1152632488","0","0000-00-00","","PD.K045.8","1");
INSERT INTO tabel_transaksi VALUES("1055","0023/MM/19","4101","2019-02-28","0023/MM/19","JURNAL BALIK DN.04 KOREKSI AUDIT","0","179147200","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("1056","0023/MM/19","1105.00.09","2019-02-28","0023/MM/19","JURNAL BALIK DN.04 KOREKSI AUDIT","179147200","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1057","0024/MM/19","4101","2019-02-28","0024/MM/19","JURNAL BALIK DN.05 KOREKSI AUDIT","0","370000170","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("1058","0024/MM/19","1105.00.09","2019-02-28","0024/MM/19","JURNAL BALIK DN.05 KOREKSI AUDIT","370000170","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1059","0025/MM/19","4101","2019-02-28","0025/MM/19","JURNAL BALIK DN.06 KOREKSI AUDIT","0","1449875806","0000-00-00","","PD.I034.8","1");
INSERT INTO tabel_transaksi VALUES("1060","0025/MM/19","1105.00.09","2019-02-28","0025/MM/19","JURNAL BALIK DN.06 KOREKSI AUDIT","1449875806","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1061","0119/BM/19","1102.02.09","2019-02-26","0119/BM/19","TD.PT.NYATA GRAFIKA MEDIA,KERTAS ROLL CD AD06 45 GR 69 CM","0","91622956","0000-00-00","","PD.N014.8","1");
INSERT INTO tabel_transaksi VALUES("1062","0119/BM/19","1105.00.09","2019-02-26","0119/BM/19","TD.PT.NYATA GRAFIKA MEDIA,KERTAS ROLL CD AD06 45 GR 69 CM","91622956","0","0000-00-00","","PD.N014.8","1");
INSERT INTO tabel_transaksi VALUES("1063","0093/BK/19","1102.02.09","2019-02-15","0093/BK/19","PEMBY.CETAK BUKU GURU PT.DYA GRAFIKA","136080000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1064","0093/BK/19","2198.03.09","2019-02-15","0093/BK/19","PEMBY.CETAK BUKU GURU PT.DYA GRAFIKA","0","136080000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1065","0003/PJ/19","1105.00.09","2019-02-27","0003/PJ/19","CV.AIRLANGGA,BUKU KURIKULUM 13","0","15801000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1066","0003/PJ/19","4101","2019-02-27","0003/PJ/19","CV.AIRLANGGA,BUKU KURIKULUM 13","15801000","0","0000-00-00","","PD.A080.8","1");
INSERT INTO tabel_transaksi VALUES("1067","0113/BK/19","1102.02.09","2019-02-26","0113/BK/19","PEMBY.TAGIHAN EKSPEDISI LEMBAHBUKUIT BARISAN","57250000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1068","0113/BK/19","5200","2019-02-26","0113/BK/19","PEMBY.TAGIHAN EKSPEDISI LEMBAHBUKUIT BARISAN","0","57250000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1069","0115/BK/19","1102.02.09","2019-02-26","0115/BK/19","PEMBY.SEWA MESIN KPD.INTAN PARIWARA","118400000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1070","0115/BK/19","2104.10.09","2019-02-26","0115/BK/19","PEMBY.SEWA MESIN KPD.INTAN PARIWARA","0","118400000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1071","0098/KK/19","1101.01.09","2019-02-15","0098/KK/19","PEMBY.BIAYA MAKAN KARYAWAN BORONGAN KPU","43000000","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1072","0098/KK/19","2104.15.09","2019-02-15","0098/KK/19","PEMBY.BIAYA MAKAN KARYAWAN BORONGAN KPU","0","43000000","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1073","0129/KK/19","1101.01.09","2019-02-26","0129/KK/19","PEMBY.GAJI UMUM+ADM KOMISARISPWU","17543654","0","0000-00-00","","","1");
INSERT INTO tabel_transaksi VALUES("1074","0129/KK/19","2104.01.09","2019-02-26","0129/KK/19","PEMBY.GAJI UMUM+ADM KOMISARISPWU","0","17543654","0000-00-00","","","1");



