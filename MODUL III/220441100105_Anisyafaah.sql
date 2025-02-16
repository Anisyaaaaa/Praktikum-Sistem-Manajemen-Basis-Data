CREATE DATABASE peminjaman;

USE peminjaman;

CREATE TABLE Petugas (
    ID_Petugas VARCHAR(10) PRIMARY KEY,
    Username VARCHAR(15) NOT NULL,
    Password VARCHAR(15) NOT NULL,
    Nama VARCHAR(25) NOT NULL
);

INSERT INTO Petugas VALUES ("P001", "Anisa01", "anisa123", "Anisyafaah");
INSERT INTO Petugas VALUES ("P002", "Icha02", "icha123", "Anisah Nuril I.");
INSERT INTO Petugas VALUES ("P003", "Pipin03", "pipin123", "Herdiyanti Fifin P.");
INSERT INTO Petugas VALUES ("P004", "Putri04", "putri123", "Firdausi Putri C.");
INSERT INTO Petugas VALUES ("P005", "Adhel05", "adhel123", "Adhelia Kusumawati");
INSERT INTO Petugas VALUES ("P006", "Nadhif06", "nadhif123", "Rayhanza Nadhif A.");
INSERT INTO Petugas VALUES ("P007", "Erick07", "erick123", "Erick Firmansyah");
INSERT INTO Petugas VALUES ("P008", "Juan08", "juan123", "Juanzha Nanda P.");
INSERT INTO Petugas VALUES ("P009", "Firman09", "firman123", "Firman Syahril");
INSERT INTO Petugas VALUES ("P010", "Akmal10", "akmal123", "Akmal Nabil H.");

CREATE TABLE Buku (
    Kode_Buku VARCHAR(10) PRIMARY KEY,
    Judul_Buku VARCHAR(25) NOT NULL,
    Pengarang_Buku VARCHAR(30) NOT NULL,
    Penerbit_Buku VARCHAR(30) NOT NULL,
    Tahun_Buku VARCHAR(10) NOT NULL,
    Jumlah_Buku VARCHAR(5) NOT NULL,
	Status_Buku VARCHAR(10) NOT NULL,
    Klasifikasi_Buku VARCHAR(20) NOT NULL
);

INSERT INTO Buku VALUES ("B01", "Pemrograman Java Dasar", "Budi Raharjo", "Andi Offset", "2019", "15", "Tersedia", "Teknologi Informasi");
INSERT INTO Buku VALUES ("B02", "Manajemen Keuangan Modern", "Fred Weston", "Salemba Empat", "2015", "12", "Tersedia", "Keuangan");
INSERT INTO Buku VALUES ("B03", "Keajaiban Doa", "Yusuf Mansur", "Pustaka Hidayah", "2017", "10", "Tersedia", "Agama");
INSERT INTO Buku VALUES ("B04", "Kisah Inspiratif Dunia", "Yusuf Mansur", "Qanita", "2020", "11", "Tersedia", "Inspiratif");
INSERT INTO Buku VALUES ("B05", "Kimia Organik Dasar", "John McMurry", "Erlangga", "2017", "12", "Tersedia", "Kimia Organik");
INSERT INTO Buku VALUES ("B06", "Manajemen Proyek Terpadu", "Rini Setyawati", "Penerbit Andi", "2016", "10", "Tersedia", "Manajemen Proyek");
INSERT INTO Buku VALUES ("B07", "Manajemen Waktu", "David Allen", "Gramedia Pustaka Utama", "2018", "10", "Tersedia", "Pengembangan Diri");
INSERT INTO Buku VALUES ("B08", "Panduan Cepat Photoshop", "Stuart Russell", "Erlangga", "2015", "11", "Tersedia", "Kimia");
INSERT INTO Buku VALUES ("B09", "Kecerdasan Buatan", "William A. Haviland", "Erlangga", "2018", "15", "Tersedia", "Teknologi");
INSERT INTO Buku VALUES ("B10", "Jalan Menuju Sukses", "Tung Desem Waringin", "Gramedia Pustaka Utama", "2017", "15", "Tersedia", "Motivasi");

CREATE TABLE Anggota (
    ID_Anggota VARCHAR(10) PRIMARY KEY,
    Nama_Anggota VARCHAR(20) NOT NULL,
    Angkatan_Anggota VARCHAR(6) NOT NULL,
    Tempat_Lahir_Anggota VARCHAR(20) NOT NULL,
    Tanggal_Lahir_Anggota DATE NOT NULL,
    No_Telp INT(12) NOT NULL,
    Jenis_Kelamin VARCHAR(15) NOT NULL,
    Status_Pinjam VARCHAR(15) NOT NULL
);

INSERT INTO Anggota VALUES ("A001", "Tasya Dwiyanti", "2022", "Bangkalan", "2004-08-15", 0858437243, "Perempuan", "Meminjam");
INSERT INTO Anggota VALUES ("A002", "Amanda Hartanto", "2022", "Surabaya", "2004-04-08", 0878909567, "Perempuan", "Meminjam");
INSERT INTO Anggota VALUES ("A003", "Denny Pranata", "2022", "Surabaya", "2004-01-01", 0821414325, "Laki-Laki", "Meminjam");
INSERT INTO Anggota VALUES ("A004", "Siti Rahayu", "2022", "Gresik", "2004-03-12", 0812304785, "Perempuan", "Meminjam");
INSERT INTO Anggota VALUES ("A005", "Andre Tanjung", "2022", "Surabaya", "2004-05-18", 0812324598, "Laki-Laki", "Meminjam");
INSERT INTO Anggota VALUES ("A006", "Maya Suryani", "2022", "Bangkalan", "2004-02-20", 0856278540, "Perempuan", "Meminjam");
INSERT INTO Anggota VALUES ("A007", "Lisa Wijaya", "2022", "Gresik", "2004-05-27", 0878794062, "Perempuan", "Meminjam");
INSERT INTO Anggota VALUES ("A008", "Johan Widodo", "2022", "Sidoarjo", "2004-04-09", 0856925670, "Laki-Laki", "Meminjam");
INSERT INTO Anggota VALUES ("A009", "Budi Santoso", "2022", "Surabaya", "2004-06-11", 0821750925, "Laki-Laki", "Meminjam");
INSERT INTO Anggota VALUES ("A010", "Lina Purnama", "2022", "Gresik", "2004-04-26", 0856278012, "Perempuan", "Meminjam");

CREATE TABLE Peminjaman (
    Kode_Peminjaman VARCHAR(10) NOT NULL PRIMARY KEY,
    ID_Anggota VARCHAR(10) NOT NULL,
    ID_Petugas VARCHAR(10) NOT NULL,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
	Kode_Buku VARCHAR(10) NOT NULL,
    FOREIGN KEY (ID_Petugas) REFERENCES Petugas(ID_Petugas),
    FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku),
    FOREIGN KEY (ID_Anggota) REFERENCES Anggota(ID_Anggota)
);

INSERT INTO Peminjaman VALUES ("PI01", "A001", "P001", "2024-01-12", "2024-01-18", "B01");
INSERT INTO Peminjaman VALUES ("PI02", "A002", "P002", "2024-01-20", "2024-01-25", "B02");
INSERT INTO Peminjaman VALUES ("PI03", "A003", "P003", "2024-02-01", "2024-02-06", "B03");
INSERT INTO Peminjaman VALUES ("PI04", "A004", "P004", "2024-02-09", "2024-02-14", "B04");
INSERT INTO Peminjaman VALUES ("PI05", "A005", "P005", "2024-02-17", "2024-02-22", "B05");
INSERT INTO Peminjaman VALUES ("PI06", "A006", "P006", "2024-03-10", "2024-03-15", "B06");
INSERT INTO Peminjaman VALUES ("PI07", "A007", "P007", "2024-03-17", "2024-03-22", "B07");
INSERT INTO Peminjaman VALUES ("PI08", "A008", "P008", "2024-03-21", "2024-03-26", "B08");
INSERT INTO Peminjaman VALUES ("PI09", "A009", "P009", "2024-04-20", "2024-04-25", "B09");
INSERT INTO Peminjaman VALUES ("PI10", "A010", "P010", "2024-04-22", "2024-04-27", "B10");

CREATE TABLE Pengembalian (
    Kode_Kembali VARCHAR(10) NOT NULL PRIMARY KEY,
    ID_Anggota VARCHAR(20) NOT NULL,
    Kode_Buku VARCHAR(10) NOT NULL,
    ID_Petugas VARCHAR(10) not null,
    Tanggal_Pinjam DATE NOT NULL,
    Tanggal_Kembali DATE NOT NULL,
    Denda VARCHAR(15) NOT NULL,
    FOREIGN KEY (ID_Anggota) REFERENCES Anggota(ID_Anggota),
    FOREIGN KEY (Kode_Buku) REFERENCES Buku(Kode_Buku),
    FOREIGN KEY (ID_Petugas) REFERENCES Petugas(ID_Petugas)
);

INSERT INTO Pengembalian VALUES ("K01", "A001", "B01", "P001", "2024-01-12", "2024-01-15", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K02", "A002", "B02", "P002", "2024-01-20", "2024-01-25", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K03", "A003", "B03", "P003", "2024-02-01", "2024-02-07", "Rp 3000");
INSERT INTO Pengembalian VALUES ("K04", "A004", "B04", "P004", "2024-02-09", "2024-02-17", "Rp 6000");
INSERT INTO Pengembalian VALUES ("K05", "A005", "B05", "P005", "2024-02-17", "2024-02-20", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K06", "A006", "B06", "P006", "2024-03-10", "2024-03-16", "Rp 3000");
INSERT INTO Pengembalian VALUES ("K07", "A007", "B07", "P007", "2024-03-17", "2024-03-19", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K08", "A008", "B08", "P008", "2024-03-21", "2024-03-25", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K09", "A009", "B09", "P009", "2024-04-20", "2024-04-21", "Tidak Didenda");
INSERT INTO Pengembalian VALUES ("K10", "A010", "B10", "P010", "2024-04-22", "2024-04-29", "Rp 6000");

-- Nomor 1
DELIMITER //
CREATE PROCEDURE Data_Petugas(Kode_Petugas VARCHAR(10))
BEGIN 
	SELECT * FROM Petugas
    WHERE ID_Petugas = Kode_Petugas;
END //
DELIMITER ;

CALL Nama_Petugas("P001");


-- Nomor 2
DELIMITER //
CREATE PROCEDURE PengembalianBuku(Book_Code VARCHAR(10))
BEGIN 
	SELECT * FROM Pengembalian	
    WHERE Kode_Buku = Book_Code;
END //
DELIMITER ;

CALL PengembalianBuku("B02");


-- Nomor 3
DELIMITER //
CREATE PROCEDURE AnggotaByAktDanJK (Angkatan VARCHAR(6), JK VARCHAR(15))
BEGIN
	SELECT * FROM Anggota
    WHERE Angkatan_Anggota = Angkatan
    AND Jenis_Kelamin LIKE CONCAT('%', JK, '%');
END //
DELIMITER ;

CALL AnggotaByAktDanJK ("2022", "Lak");
CALL AnggotaByAktDanJK ("2022", "Per");


-- Nomor 4
DELIMITER //
CREATE PROCEDURE BukuBy3Field(Pengarang VARCHAR(30), Penerbit VARCHAR(30), Tahun VARCHAR(10))
BEGIN 
	SELECT * FROM Buku
    WHERE Pengarang_Buku = Pengarang
    AND Penerbit_Buku = Penerbit
    AND Tahun_Buku = Tahun;
END //
DELIMITER ;

CALL BukuBy3Field ("Yusuf Mansur", "Pustaka Hidayah", "2017");


-- Nomor 5
DELIMITER //
CREATE PROCEDURE MenambahBuku(
	Kode VARCHAR(10), 
    Judul VARCHAR(25), 
    Pengarang VARCHAR(30), 
    Penerbit VARCHAR(30), 
    Tahun VARCHAR(10), 
    Jumlah VARCHAR(5), 
    StatusBuku VARCHAR(10), 
    Klasifikasi VARCHAR(20))
BEGIN 
	INSERT INTO Buku (Kode_Buku, Judul_Buku, Pengarang_Buku, Penerbit_Buku, Tahun_Buku, Jumlah_Buku, Status_Buku, Klasifikasi_Buku)
    VALUES (Kode, Judul, Pengarang, Penerbit, Tahun, Jumlah, StatusBuku, Klasifikasi);
END //
DELIMITER ;

CALL MenambahBuku ("B11", "Perjalanan Hidup", "Mario Teguh", "Gramedia Pustaka Utama", "2006", "7", "Tersedia", "Inspiratif");


-- Nomor 6
DELIMITER //
CREATE PROCEDURE JumlahBuku(OUT Jumlah VARCHAR(5))
BEGIN 
	SELECT COUNT(Jumlah_Buku)
    INTO Jumlah
    FROM Buku;
END //
DELIMITER ;

CALL JumlahBuku(@Jumlah);
SELECT @Jumlah;


-- Nomor 7
DELIMITER //
CREATE PROCEDURE DataAnggotaa(
    IN Angkatan VARCHAR(6),
    IN JenisKelamin VARCHAR(10),
    OUT JumlahAnggota INT
)
BEGIN 
    SELECT COUNT(Nama_Anggota)
    INTO JumlahAnggota
    FROM Anggota
    WHERE Angkatan_Anggota = Angkatan
    AND Jenis_Kelamin = JenisKelamin;
END //
DELIMITER ;

CALL DataAnggotaa("2022", "Perempuan", @JumlahPerempuan);
CALL DataAnggotaa("2022", "Laki-laki", @JumlahLakiLaki); 
SELECT @JumlahPerempuan, @JumlahLakiLaki;