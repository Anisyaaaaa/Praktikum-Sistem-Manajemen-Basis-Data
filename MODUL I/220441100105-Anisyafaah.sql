CREATE DATABASE db_utm;

USE db_utm;

CREATE TABLE mahasiswa (nim INT (11) NOT NULL, 
	nama VARCHAR (50), fakultas VARCHAR (50), 
	program_studi VARCHAR (50), statusMhs VARCHAR (20), PRIMARY KEY (nim));

INSERT INTO mahasiswa VALUES (220441101, "Anisyafaah", "Teknik", "Sistem Informasi", "Belum Lulus");
INSERT INTO mahasiswa VALUES (220441102, "Anisah Nuril Izzati", "Teknik", "Sistem Informasi", "Belum Lulus");
INSERT INTO mahasiswa VALUES (220441103, "Herdiyanti Fifin Purwaningrum", "Teknik", "Sistem Informasi", "Belum Lulus");
INSERT INTO mahasiswa VALUES (220441104, "Firdausi Putri Cahyani", "Teknik", "Sistem Informasi", "Lulus");
INSERT INTO mahasiswa VALUES (220441105, "Adhelia Kusumawati", "Teknik", "Sistem Informasi", "Lulus");
INSERT INTO mahasiswa VALUES (220441106, "Tasya Dwiyanti", "Teknik", "Sistem Informasi", "Lulus");
INSERT INTO mahasiswa VALUES (220441107, "Syahrul Ramadhani", "Teknik", "Sistem Informasi", "Berhenti");
INSERT INTO mahasiswa VALUES (220441108, "Birrur Rijaal", "Teknik", "Sistem Informasi", "Berhenti");
INSERT INTO mahasiswa VALUES (220441109, "Rayhanza Nadhif Athala", "Teknik", "Sistem Informasi", "Berhenti");
INSERT INTO mahasiswa VALUES (220441110, "Ade Verdaus Saputra", "Teknik", "Sistem Informasi", "Berhenti");

CREATE TABLE dosen (nip INT (11) NOT NULL, nama VARCHAR (50), 
	jurusan VARCHAR (50), jabatan VARCHAR (50), PRIMARY KEY (nip));
    
INSERT INTO dosen VALUES (19900801, "Dr.BUDI DWI SATOTO, ST., M.Kom.", "Sistem Informasi", "Koordiator Prodi");
INSERT INTO dosen VALUES (19900802, "FIRLI IRHAMNI, ST., M.Kom.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900803, "MUHAMMAD ALI SYAKUR, S.Si., M.T.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900804, "NOVI PRASTITI, S.Kom, M.Kom", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900805, "Achmad Zain Nur, S.Kom.,M.T.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900806, "ROSIDA VIVIN NAHARI, S.Kom,.MT", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900807, "YENI KUSTIYAHNINGSIH, S.Kom., M.Kom.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900808, "YUDHA DWI PUTRA NEGARA, S.Kom., M.Kom.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900809, "FITRI DAMAYANTI, S.Kom., M.Kom.", "Sistem Informasi", "Dosen pengajar");
INSERT INTO dosen VALUES (19900810, "ACHMAD YASID, S.Kom. M.Kom	", "Sistem Informasi", "Dosen pengajar");


CREATE TABLE matakuliah (kode_matkul VARCHAR (50) NOT NULL, nip INT (11), matakuliah VARCHAR (50), 
	sks INT (10), semester INT (10), prodi VARCHAR (50), PRIMARY KEY (kode_matkul), FOREIGN KEY (nip) REFERENCES dosen (nip));
    
INSERT INTO matakuliah VALUES ("SI1", 19900801, "Sistem Manajemen Basis Data", 4, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI2", 19900802, "Pemrograman Bergerak", 4, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI3", 19900803, "Sistem Pendukung Keputusan", 3, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI4", 19900804, "Perancangan Sumber Daya Perusahaan", 3, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI5", 19900805, "Manajemen Proyek IT", 3, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI6", 19900806, "Implementasi Perancangan Perangkat Lunak", 3, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI7", 19900807, "Data Mining", 3, 4, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI8", 19900808, "Pemrograman Visual", 4 , 3, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI9", 19900809, "Arsitektur SI/TI", 3, 3, "Sistem Informasi");
INSERT INTO matakuliah VALUES ("SI10", 19900810, "Analisa Desain SI", 3, 3, "Sistem Informasi");


CREATE TABLE krs (kode_matkul VARCHAR (10) NOT NULL, nim INT (11), 
	nama VARCHAR (50), mataKuliah VARCHAR (50),
    semester INT (5), tahun_ajaran VARCHAR (20), PRIMARY KEY(kode_matkul), FOREIGN KEY (nim) REFERENCES mahasiswa (nim),
    FOREIGN KEY (kode_matkul) REFERENCES matakuliah (kode_matkul));

INSERT INTO krs VALUES ("SI1", 220441101, "Anisyafaah", "Sistem Manajemen Basis Data", 4, "2022-2023");
INSERT INTO krs VALUES ("SI2", 220441102, "Anisah Nuril Izzati", "Pemrograman Bergerak", 4, "2022-2023");
INSERT INTO krs VALUES ("SI3", 220441103, "Herdiyanti Fifin Purwaningrum", "Sistem Pendukung Keputusan", 4, "2022-2023");
INSERT INTO krs VALUES ("SI4", 220441104, "Firdausi Putri Cahyani", "Perancangan Sumber Daya Perusahaan", 4, "2020-2021");
INSERT INTO krs VALUES ("SI5", 220441105, "Adhelia Kusumawati", "Manajemen Proyek IT", 4, "2020-2021");
INSERT INTO krs VALUES ("SI6", 220441106, "Tasya Dwiyanti", "Implementasi Perancangan Perangkat Lunak", 4, "2020-2021");
INSERT INTO krs VALUES ("SI7", 220441107, "Syahrul Ramadhani", "Data Mining", 4, "2022-2023");
INSERT INTO krs VALUES ("SI8", 220441108, "Birrur Rijaal", "Pemrograman Visual", 4, "2022-2023");
INSERT INTO krs VALUES ("SI9", 220441109, "Rayhanza Nadhif Athala", "Arsitektur SI/TI", 4, "2022-2023");
INSERT INTO krs VALUES ("SI10", 220441110, "Ade Verdaus Saputra", "Analisa Desain SI", 4, "2022-2023");


CREATE TABLE pembayaranUKT (id_pembayaran INT (10) NOT NULL,
     NIM INT(11), nama VARCHAR(50), semester INT (10), jml_ukt VARCHAR (50), tgl_bayar DATE, PRIMARY KEY (id_pembayaran),
     FOREIGN KEY (nim) REFERENCES mahasiswa (nim));

INSERT INTO pembayaranUKT VALUES (1, 220441101, "Anisyafaah", 4, "Rp 3.000.000", "2024-02-16");
INSERT INTO pembayaranUKT VALUES (2, 220441102, "Anisah Nuril Izzati", 4, "Rp 3.000.000", "2024-02-17");
INSERT INTO pembayaranUKT VALUES (3, 220441103, "Herdiyanti Fifin Purwaningrum", 4, "Rp 3.000.000", "2024-02-18");
INSERT INTO pembayaranUKT VALUES (4, 220441104, "Firdausi Putri Cahyani", 4, "Rp 3.000.000", "2024-02-19");
INSERT INTO pembayaranUKT VALUES (5, 220441105, "Adhelia Kusumawati", 4, "Rp 3.000.000", "2024-02-20");
INSERT INTO pembayaranUKT VALUES (6, 220441106, "Tasya Dwiyanti", 4, "Rp 3.000.000", "2024-02-21");
INSERT INTO pembayaranUKT VALUES (7, 220441107, "Syahrul Ramadhani", 4, "Rp 3.000.000", "2024-02-22");
INSERT INTO pembayaranUKT VALUES (8, 220441108, "Birrur Rijaal", 4, "Rp 3.000.000", "2024-02-23");
INSERT INTO pembayaranUKT VALUES (9, 220441109, "Rayhanza Nadhif Athala", 4, "Rp 3.000.000", "2024-02-24");
INSERT INTO pembayaranUKT VALUES (10, 220441110, "Ade Verdaus Saputra", 4, "Rp 3.000.000", "2024-02-25");


CREATE TABLE gaji_dosen (id_gaji INT (10) NOT NULL, nip INT(11), nama VARCHAR(50), jmlGaji VARCHAR (20),
	tgl_dibayar DATE, PRIMARY KEY (id_gaji), FOREIGN KEY (nip) REFERENCES dosen (nip));

INSERT INTO gaji_dosen VALUES (1, 19900801, "Dr.BUDI DWI SATOTO, ST., M.Kom.", "Rp 5.000.000", "2024-07-01");
INSERT INTO gaji_dosen VALUES (2, 19900802, "FIRLI IRHAMNI, ST., M.Kom.", "Rp 5.000.000", "2024-07-02");
INSERT INTO gaji_dosen VALUES (3, 19900803, "MUHAMMAD ALI SYAKUR, S.Si., M.T.", "Rp 10.000.000", "2024-07-01");
INSERT INTO gaji_dosen VALUES (4, 19900804, "NOVI PRASTITI, S.Kom, M.Kom", "Rp 10.000.000", "2024-07-01");
INSERT INTO gaji_dosen VALUES (5, 19900805, "Achmad Zain Nur, S.Kom.,M.T.", "Rp 5.000.000", "2024-07-02");
INSERT INTO gaji_dosen VALUES (6, 19900806, "ROSIDA VIVIN NAHARI, S.Kom,.MT", "Rp 10.000.000", "2024-07-01");
INSERT INTO gaji_dosen VALUES (7, 19900807, "YENI KUSTIYAHNINGSIH, S.Kom., M.Kom.", "Rp 5.000.000", "2024-07-02");
INSERT INTO gaji_dosen VALUES (8, 19900808, "YUDHA DWI PUTRA NEGARA, S.Kom., M.Kom.", "Rp 10.000.000", "2024-07-02");
INSERT INTO gaji_dosen VALUES (9, 19900809, "FITRI DAMAYANTI, S.Kom., M.Kom.", "Rp 10.000.000", "2024-07-01");
INSERT INTO gaji_dosen VALUES (10, 19900810, "ACHMAD YASID, S.Kom. M.Kom	", "Rp 5.000.000", "2024-07-02");


CREATE TABLE pembelianPeralatan (id_pembelian INT (10) NOT NULL, peralatan VARCHAR(50), banyakPeralatan INT (10), 
	tgl_beli DATE, totalHarga VARCHAR (50), PRIMARY KEY (id_pembelian));

INSERT INTO pembelianPeralatan VALUES (1, "Papan Tulis", 3, "2024-01-07", "Rp 140.000");
INSERT INTO pembelianPeralatan VALUES (2, "Proyektor", 2, "2024-01-09", "Rp 2.000.000");
INSERT INTO pembelianPeralatan VALUES (3, "Printer", 2, "2024-01-10", "Rp 4.000.000");
INSERT INTO pembelianPeralatan VALUES (4, "Penghapus", 5, "2024-01-07", "Rp 50.000");
INSERT INTO pembelianPeralatan VALUES (5, "Spidol", 4, "2024-01-10", "Rp 36.000");
INSERT INTO pembelianPeralatan VALUES (6, "WebCam", 2, "2024-01-15", "Rp 1.000.000");
INSERT INTO pembelianPeralatan VALUES (7, "Mouse", 3, "2024-01-08", "Rp 600.000");
INSERT INTO pembelianPeralatan VALUES (8, "Keyboard", 3, "2024-01-07", "Rp 320.000");
INSERT INTO pembelianPeralatan VALUES (9, "Monitor", 1, "2024-01-07", "Rp 300.000");
INSERT INTO pembelianPeralatan VALUES (10, "HDMI", 2, "2024-01-07", "Rp 60.000");


CREATE TABLE pembayaranTagihan (id_pembayaran INT (10),
    jenisTagihan VARCHAR(70), tgl_bayar DATE, totalTagihan VARCHAR (50), PRIMARY KEY (id_pembayaran));
    
INSERT INTO pembayaranTagihan VALUES (1, "Biaya Listrik", "2024-01-01", "Rp 700.000");
INSERT INTO pembayaranTagihan VALUES (2, "Biaya Air", "2024-01-02", "Rp 500.000");
INSERT INTO pembayaranTagihan VALUES (3, "Biaya Layanan Pendukung Mahasiswa", "2024-01-02", "Rp 900.000");
INSERT INTO pembayaranTagihan VALUES (4, "Biaya Pajak dan Regulasi", "2024-01-04", "Rp 1.200.000");
INSERT INTO pembayaranTagihan VALUES (5, "Biaya Administrasi", "2024-01-05", "Rp 300.000");
INSERT INTO pembayaranTagihan VALUES (6, "Biaya Pembelian Peralatan Akademik", "2024-01-06", "Rp 800.000");
INSERT INTO pembayaranTagihan VALUES (7, "Biaya Gaji Pengajar", "2024-01-07", "Rp 20.000.000");
INSERT INTO pembayaranTagihan VALUES (8, "Biaya Seminar & Konferensi", "2024-01-08", "Rp 500.000");
INSERT INTO pembayaranTagihan VALUES (9, "Biaya Pengadaan Buku", "2024-01-09", "Rp 700.000");
INSERT INTO pembayaranTagihan VALUES (10, "Biaya Teknologi & Akses Internet", "2024-01-10", "Rp 500.000");
    
SHOW TABLES;

CREATE TABLE pengeluaran (id_bayar INT (10) NOT NULL, jenisPengeluaran VARCHAR (50), pengeluaran VARCHAR(50), 
	tglBayar DATE, totalBayar VARCHAR (50));
    
INSERT INTO pengeluaran VALUES (1, "Pembayaran Tagihan", "Tagihan Biaya Listrik", "2024-03-01", "Rp 1.000.000");
INSERT INTO pengeluaran VALUES (2, "Pembayaran Tagihan", "Tagihan Biaya Air", "2024-03-01", "Rp 1.500.000");
INSERT INTO pengeluaran VALUES (3, "Pembayaran Tagihan", "Tagihan Biaya Layanan Pendukung Mahasiswa", "2024-03-01", "Rp 2.300.000");
INSERT INTO pengeluaran VALUES (4, "Pembayaran Tagihan", "Tagihan Biaya Pajak dan Regulasi", "2024-03-01", "Rp 700.000");
INSERT INTO pengeluaran VALUES (5, "Pembayaran Tagihan", "Tagihan Biaya Administrasi", "2024-03-01", "Rp 500.000");
INSERT INTO pengeluaran VALUES (6, "Pembayaran Peralatan", "Tagihan Pembelian WebCam", "2024-03-01", "Rp 2.000.000");
INSERT INTO pengeluaran VALUES (7, "Pembayaran Peralatan", "Tagihan Pembelian Mouse", "2024-03-01", "Rp 500.000");
INSERT INTO pengeluaran VALUES (8, "Pembayaran Peralatan", "Tagihan Pembelian Keyboard", "2024-03-01", "Rp 600.000");
INSERT INTO pengeluaran VALUES (9, "Pembayaran Peralatan", "Tagihan Pembelian Monitor", "2024-03-01", "Rp 700.000");
INSERT INTO pengeluaran VALUES (10, "Pembayaran Peralatan", "Tagihan HDMI", "2024-03-01", "Rp 500.000");


ALTER TABLE pengeluaran CHANGE COLUMN jenisPengeluaran jenis VARCHAR (80);
ALTER TABLE pengeluaran ALTER COLUMN id_bayar SET DEFAULT 11;
ALTER TABLE pengeluaran ALTER COLUMN jenis SET DEFAULT "Tagihan&Peralatan";
ALTER TABLE pengeluaran ALTER COLUMN pengeluaran SET DEFAULT "Operasional&Barang";
ALTER TABLE pengeluaran ALTER COLUMN tglBayar SET DEFAULT "2024-03-01";
ALTER TABLE pengeluaran ALTER COLUMN totalBayar SET DEFAULT "Rp 1.000.000";

DESC pengeluaran;
SELECT * FROM pengeluaran;


-- SHOW TABLES;
SELECT * FROM mahasiswa;
SELECT * FROM dosen;
SELECT * FROM matakuliah;
SELECT * FROM krs;
SELECT * FROM pembayaranUKT; 
SELECT * FROM gaji_dosen; 
SELECT * FROM pembelianPeralatan; 
SELECT * FROM pembayaranTagihan;

-- drop database db_utm;

-- CREATE TABLE laporan (id_laporan INT (10) NOT NULL, jenisLaporan VARCHAR (100), deskripsiLaporan VARCHAR (100),
--     tanggalLaporan DATE, PRIMARY KEY (id_laporan));
--     
-- INSERT INTO laporan VALUES (1, "Laporan Daftar Mahasiswa", "Jumlah Mahasiswa Tahun Ajaran 2020/2021 sebanyak 5000 Mahasiswa", "2020-03-01");
-- INSERT INTO laporan VALUES (2, "Laporan Daftar Mahasiswa", "Jumlah Mahasiswa Tahun Ajaran 2021/2022 sebanyak 5500 Mahasiswa", "2021-03-02");
-- INSERT INTO laporan VALUES (3, "Laporan Daftar Mahasiswa", "Jumlah Mahasiswa Tahun Ajaran 2022/2023 sebanyak 7000 Mahasiswa", "2022-03-05");
-- INSERT INTO laporan VALUES (4, "Laporan Daftar Dosen", "Jumlah Dosen Tahun Ajaran 2021/2022 sebanyak 350 Dosen Pengajar", "2021-03-07");
-- INSERT INTO laporan VALUES (5, "Laporan Daftar Dosen", "Jumlah Dosen Tahun Ajaran 2022/2023 sebanyak 355 Dosen Pengajar", "2022-03-02");
-- INSERT INTO laporan VALUES (6, "Laporan Daftar Dosen", "Jumlah Dosen Tahun Ajaran 2023/2024 sebanyak 351 Dosen Pengajar", "2023-03-06");
-- INSERT INTO laporan VALUES (7, "Laporan Keuangan", "Laporan Pengeluaran Keuangan Tahun Ajaran 2021/2022 sebanyak Rp 50.000.000", "2021-03-05");
-- INSERT INTO laporan VALUES (8, "Laporan Keuangan", "Jumlah Pengeluaran Keuangan 2022/2023 sebanyak Rp 55.000.000", "2022-03-04");
-- INSERT INTO laporan VALUES (9, "Laporan Keuangan", "Jumlah Pengeluaran Keuangan Tahun Ajaran 2023/2024 sebanyak Rp 80.000.000", "2023-03-01");
-- INSERT INTO laporan VALUES (10, "Laporan Daftar Mahasiswa", "Jumlah Mahasiswa Tahun Ajaran 2023/2024 sebanyak 4987 Mahasiswa", "2023-03-03");

-- select deskripsiLaporan from laporan where jenisLaporan = "Laporan Daftar Mahasiswa";
-- SELECT * FROM laporan;