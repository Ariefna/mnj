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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO tabel_admin VALUES("1","Arief Nur Abdullah","admin","21232f297a57a5a743894a0e4a801fc3","2019-03-11 06:11:38");



DROP TABLE tabel_master;

CREATE TABLE `tabel_master` (
  `kode_rekening` varchar(10) NOT NULL DEFAULT '',
  `nama_rekening` varchar(100) NOT NULL,
  `tanggal_awal` date NOT NULL,
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
  `subacct` varchar(12) NOT NULL,
  PRIMARY KEY (`kode_rekening`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO tabel_master VALUES("1101.01.09","KAS BESAR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","KAS");
INSERT INTO tabel_master VALUES("1102.01.09","BG- RUPIAH - BCA PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.02.09","BG- RUPIAH - BANK MANDIRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.03.09","BG- RUPIAH - BPD JATIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.04.09","BG- RUPIAH - BANK BRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.05.09","BG- RUPIAH - BPD PPPB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.06.09","BG- RUPIAH - UMKR JATIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1102.07.09","TAB. BANK RAKYAT INDONESIA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BANK");
INSERT INTO tabel_master VALUES("1104.00.09","DEPOSITO-RUPIAH-BANK HARFA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","DEPOSITO");
INSERT INTO tabel_master VALUES("1105.00.09","PIUTANG USAHA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1106.00.09","PENYISIHAN PIUTANG TK. TERTAG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1107.04.09","PIUTANG BON SEMENTARA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1107.05.09","PENDAPATAN YMA DITERIMA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1107.50.09","PIUTANG LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1107.99.09","PENYI.PIUT.LAIN2 TAK TERTAGIH","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG");
INSERT INTO tabel_master VALUES("1108.02.09","PERSEDIAAN BARANG JADI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.03.09","PERSEDIAAN BARANG DLM PROSES","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.04.09","PERSEDIAAN BAHAN BAKU SIAP PK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.06.09","PERSEDIAAN BAHAN PEMBANTU","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.07.09","PERSEDIAAN ALAT-ALAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1108.09.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PERSEDIAAN");
INSERT INTO tabel_master VALUES("1113.01.09","UANG MUKA PPN MASUKAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.02.09","UANG MUKA PPH PS. 21","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.03.09","UANG MUKA PPH PS. 22","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.04.09","UANG MUKA PPH. 23","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1113.05.09","UANG MUKA PPH PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA PA");
INSERT INTO tabel_master VALUES("1114.02.09","SEWA DIBAYAR DIMUKA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.04.09","UANG MUKA PESANAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.06.09","UANG MUKA PELKS. ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1114.99.09","UANG MUKA BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA BI");
INSERT INTO tabel_master VALUES("1201.01.09","PIUTANG KERJASAMA OPS","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","PIUTANG LAIN");
INSERT INTO tabel_master VALUES("1302.00.09","AKTIVA PAJAK TANGGUHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TIDAK");
INSERT INTO tabel_master VALUES("1401.01.09","TANAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.01.09","BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.51.09","AKM.PENY. BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1402.53.09","AKM.PENY. BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1403.01.09","MESIN PRODUKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1403.51.09","AKM.PENY. MESIN PRODUKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1404.01.09","KENDARAAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1404.51.09","AKM.PENY. KENDARAAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.01.09","PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.02.09","PERALATAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.51.09","AKM.PENY. PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1405.52.09","AKM.PENY. PERALATAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1701.02.09","BANGUNAN PABRIK KARANGPILANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1701.05.09","PEMASANGAN MESIN KARANGPILANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA TETAP");
INSERT INTO tabel_master VALUES("1704.99.09","BEBAN LAIN YANG DITANGGUHKAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1705.01.09","PERSEDIAAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1705.99.09","CAD.PENURUNAN PERSEDIAAN LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1706.01.09","PIUTANG USAHA MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("1706.02.09","PIUTANG LAIN-LAIN MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","UANG MUKA LA");
INSERT INTO tabel_master VALUES("1706.51.09","CAD.PENURUNAN PIUT. MACET","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","AKTIVA LAIN-");
INSERT INTO tabel_master VALUES("2101.01.09","HUTANG KREDIT MODAL KERJA BCA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG BANK");
INSERT INTO tabel_master VALUES("2101.02.09","HUTANG KREDIT MODAL KERJA BRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","TOTAL HUTANG");
INSERT INTO tabel_master VALUES("2103.00.09","HUTANG USAHA SWASTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG LANCA");
INSERT INTO tabel_master VALUES("2104.01.09","GAJI YMH DIBAYAR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.02.09","BEBAN PESANGON/MANFAAT KARY","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.04.09","LISTRIK/TELPON/PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.07.09","PERJALANAN DINAS","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.10.09","FABRIKASI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.12.09","ORDER KHUSUS TL. AGUNG","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.13.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.14.09","ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.15.09","ORDER KHUSUS KPU PUSAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.16.09","THR YMH DIBAYAR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2104.99.09","LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","BIAYA YMH DI");
INSERT INTO tabel_master VALUES("2105.01.09","PPN KELUARAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.02.09","PPH PS. 21/PPh PS.23","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.03.09","PPh. PS. 25","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2105.04.09","HUTANG PBB","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG PAJAK");
INSERT INTO tabel_master VALUES("2106.00.09","UANG MUKA PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.03.09","HUTANG SUB KONTRAKTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2198.50.09","HUTANG LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG UANG ");
INSERT INTO tabel_master VALUES("2199.00.09","R/K DIREKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","REKENING ANT");
INSERT INTO tabel_master VALUES("2203.00.09","BANK","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG");
INSERT INTO tabel_master VALUES("2203.02.09","BANK MANDIRI","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","HUTANG");
INSERT INTO tabel_master VALUES("2205.02.09","KEWAJIBAN BEBAN MANFAAT","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","KEWAJIBAN JK");
INSERT INTO tabel_master VALUES("3101.03.09","MODAL LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","MODAL");
INSERT INTO tabel_master VALUES("3102.02.09","MBD - SAHAM BIASA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","MODAL");
INSERT INTO tabel_master VALUES("3104.02.09","MDD - SAHAM BIASA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","MODAL");
INSERT INTO tabel_master VALUES("3401.01.09","LABA/RUGI THN SEBELUMNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","LABA/RUGI");
INSERT INTO tabel_master VALUES("3402.01.09","LABA/RUGI THN BERJALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","neraca","0","LABA/RUGI");
INSERT INTO tabel_master VALUES("4101.09","PT. PANCA PUJIBANGUN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","PENJUALAN");
INSERT INTO tabel_master VALUES("5101.09","PERSEDIAAN DALAM PROSES AWAL","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN POKOK");
INSERT INTO tabel_master VALUES("5102.09","PERSEDIAAN DALAM PROSES AKHIR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN POKOK");
INSERT INTO tabel_master VALUES("5200.01.09","BEBAN ORDER KHUSUS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN LANGSU");
INSERT INTO tabel_master VALUES("5200.02.09","BEBAN ORDER KHUSUS PAKET A-B","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN KHUSUS");
INSERT INTO tabel_master VALUES("5200.09","LANGSUNG USAHA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN LANGSU");
INSERT INTO tabel_master VALUES("5300.09","PEMAKAIAN BAHAN BAKU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BAHAN BAKU");
INSERT INTO tabel_master VALUES("5401.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5403.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5404.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5405.09","BIAYA KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5406.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5407.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5408.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5410.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5414.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","TENAGA LANGS");
INSERT INTO tabel_master VALUES("5416.09","BONUS/TATIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","T. KERJA LAN");
INSERT INTO tabel_master VALUES("5500.09","BAHAN BANTU","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BI. BAHAN BA");
INSERT INTO tabel_master VALUES("5601.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5603.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5604.09","BIAYA PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5605.09","BIAYA KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5606.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5607.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5608.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5610.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5614.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5616.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5702.09","PERB.& PEMEL.BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5704.09","PERB.& PEMEL.MESIN PRODUKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5707.09","PERB.& PEMEL.KEND.PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5708.09","PEMELIHARAAN PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5711.09","BIAYA PENY.BANGUNAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5713.09","BIAYA PENY.MESIN PRODUKSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5717.09","BIAYA PENY.PERALATAN PABRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5720.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5721.09","CETAKAN,ATK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5722.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5723.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5726.09","BIAYA SEWA MESIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("5727.09","BIAYA LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN TAK LA");
INSERT INTO tabel_master VALUES("6101.09","GAJI/UAPH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6105.09","KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6202.09","AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6206.09","BEBAN LAIN-LAIN PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6302.09","PEMEL. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6305.09","PENY. KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6401.09","TELP/TELEX","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6402.09","CETAKAN,ATK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6403.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6405.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6406.09","BIAYA PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6407.09","PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6408.09","ONGKOS KIRIM/PACKING","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6409.09","IKLAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6410.09","PROMOSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6411.09","TENDER PENJUALAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6412.09","PENGURUSAN/PENCARIAN ORDER","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6413.09","BEBAN PENGURUSAN PENAGIHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("6414.09","BIAYA CLAIM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN PENJUA");
INSERT INTO tabel_master VALUES("7101.09","GAJI/UPAH","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7103.09","LEMBUR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7104.09","PENGOBATAN/KESEHATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7105.09","KONSUMSI","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7106.09","TUNJANGAN KESEJAHTERAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7107.09","TUNJANGAN ASTEK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7108.09","TUNJANGAN JABATAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7109.09","TUNJANGAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN.ADM & ");
INSERT INTO tabel_master VALUES("7110.09","TUNJANGAN HARI RAYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7114.09","BIAYA PESANGON","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7115.09","BIAYA TRAINING","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7116.09","BONUS/TANTIEM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7201.09","TENAGA LISTRIK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7202.09","REK.AIR PDAM","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7205.09","BIAYA SEWA GEDUNG","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7206.09","BEBAN LAIN-LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7303.09","PERB.& PEMEL.BANG.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7304.09","PERB.& PEMEL.KEND.KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7305.09","PERB.& PEMEL.PERALATAN KTR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7306.09","PERB.& PEMEL.PERABOT KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7308.09","PENY.BANGUNAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7310.09","PENY.PERALATAN KANTOR","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7406.09","TELP,TELEX,INTERLOKAL,VHF","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7407.09","CETAKAN,ATK/FOTO COPY","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7409.09","BENDA POS","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7410.09","REPRESENTASI,SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7411.09","PBB/STNK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7412.09","BEBAN KANTOR LAIN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7413.09","BBM KENDARAAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7414.09","BEBAN PERJALANAN DALAM KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7415.09","BEBAN PERJALANAN LUAR KOTA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7416.09","IURAN-IURAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7417.09","BEBAN IURAN/SUMBANGAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7418.09","BEBAN KONSULTAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7419.09","BEBAN KONSULTAN (AUDIT,PERPAJA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7420.09","BEBAN KERUGIAN PIUTANG","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("7421.09","BEBAN PAJAK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN ADM & ");
INSERT INTO tabel_master VALUES("8101.09","JASA GIRO","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8103.09","PENDAPATAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8199.09","PENDPT DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","PENDPT DILUA");
INSERT INTO tabel_master VALUES("8201.09","ADMINISTRASI BANK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8202.09","BEBAN PENDIDIKAN DAN LATIHAN","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8204.09","MANAGEMENT FEE","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8206.09","BEBAN BUNGA BANK","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8207.09","BEBAN BUNGA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");
INSERT INTO tabel_master VALUES("8211.09","BEBAN DILUAR USAHA LAINNYA","2019-02-14","0","0","0","0","0","0","0","0","0","0","rugi-laba","0","BEBAN DILUAR");



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

INSERT INTO tabel_neraca VALUES("0","<b>AKTIVA LANCAR</b>","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("1","Kas","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("2","Bank","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("3","Piutang Anggota","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("4","Piutang Bukan Anggota","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("5","Pendapatan yang masih harus diterima","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("6","Persediaan Barang Toko","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("7","break","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("8","<b>TOTAL AKTIVA LANCAR</b>","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("9","break","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("10","<b>PENYERTAAN PKPRI</b>","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("11","Penyertaan PKPRI","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("12","break","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("13","<b>AKTIVA TETAP</b>","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("14","Mesin-mesin","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("15","Kendaraan","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("16","Perlengkapan Toko","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("17","Perabot","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("18","Penyusutan Mesin","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("19","Penyusutan Kendaraan","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("20","Penyusutan Perlengkapan Toko","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("21","Penyusutan Perabot","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("22","Total Aktiva Tetap","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("23","","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("24","<b>AKTIVA LAINNYA<b>","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("25","Piutang Sementara","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("26","break","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_neraca VALUES("27","<b>JUMLAH AKTIVA</b>","","0","0","0","0","0","0","0","0","0","0","","");



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

INSERT INTO tabel_rugi_laba VALUES("I.","SUMBER PENGHASILAN","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("411.01","Penjualan Barang Toko","02/12/2010","0","0","0","10000000","0","10000000","0","10000000","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("411.02","Pendapatan Jasa","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("412.01","Pendapatan Simpan Pinjam","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit");
INSERT INTO tabel_rugi_laba VALUES("413.01","Pendapatan Jasa Lain-lain","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","kredit");
INSERT INTO tabel_rugi_laba VALUES("II.","BIAYA UMUM DAN ADMINISTRASI","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("B","BIAYA ADMINISTRASI","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("522.01","Biaya Administrasi","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("522.02","Biaya Gaji Karyawan","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("522.03","Biaya Keuangan (Bank)","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("522.04","Biaya Organisasi","02/12/2010","0","0","0","0","0","0","0","0","0","0","rugi-laba","debet");
INSERT INTO tabel_rugi_laba VALUES("III","JUMLAH PENDAPATAN","","0","0","0","0","0","0","0","10000000","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("IV","JUMLAH BIAYA","","0","0","0","0","0","0","0","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("V","Sisa Hasil Usaha Tahun Berjalan","","0","0","0","0","0","0","10000000","0","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("VI","Total Balance","","0","0","0","0","0","0","10000000","10000000","0","0","","");
INSERT INTO tabel_rugi_laba VALUES("VII","TANGGAL PERIODE","18/12/2010","0","0","0","0","0","0","0","0","0","0","","");



DROP TABLE tabel_transaksi;

CREATE TABLE `tabel_transaksi` (
  `id_transaksi` int(15) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` varchar(15) NOT NULL,
  `kode_rekening` varchar(10) NOT NULL,
  `tanggal_transaksi` varchar(12) NOT NULL,
  `jenis_transaksi` varchar(15) NOT NULL,
  `keterangan_transaksi` text NOT NULL,
  `debet` int(15) NOT NULL,
  `kredit` int(15) NOT NULL,
  `tanggal_posting` varchar(12) NOT NULL,
  `keterangan_posting` varchar(10) NOT NULL,
  `id_admin` int(4) NOT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;




