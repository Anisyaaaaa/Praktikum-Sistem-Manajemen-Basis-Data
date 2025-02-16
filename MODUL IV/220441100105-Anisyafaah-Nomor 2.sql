CREATE DATABASE Mahasiswa;

USE Mahasiswa;

CREATE TABLE Mahasiswa (
	ID_Mahasiswa INT(11) NOT NULL PRIMARY KEY,
    Nama VARCHAR(100),
    Jurusan VARCHAR(50),
    Tanggal_Masuk DATE
);

INSERT INTO Mahasiswa (ID_Mahasiswa, Nama, Jurusan, Tanggal_Masuk) VALUES
(1, 'Anisah Nuril Izzati', 'Teknik Informatika', '2023-08-01'),
(2, 'Bayu Aditya Pratama', 'Manajemen', '2023-08-01'),
(3, 'Citra Wahyuni Putri', 'Akuntansi', '2023-08-01'),
(4, 'Dhika Putra Ramadhan', 'Teknik Sipil', '2023-08-01'),
(5, 'Eka Wahyu Kurniawan', 'Ilmu Komunikasi', '2023-08-01'),
(6, 'Fadhila Indah Permata', 'Sastra Inggris', '2023-08-01'),
(7, 'Gilang Fajar Saputra', 'Teknik Elektro', '2023-08-01'),
(8, 'Haniyah Amira Fitri', 'Kedokteran', '2023-08-01'),
(9, 'Ibrahim Hidayatullah', 'Hukum', '2023-08-01'),
(10, 'Joko Setiawan', 'Agribisnis', '2023-08-01');

CREATE TABLE Mata_Kuliah (
	ID_Matakuliah INT(11) NOT NULL PRIMARY KEY,
    Nama_Mata_Matakuliah VARCHAR(100),
    Sks INT(11),
    Semester VARCHAR(20)
);

INSERT INTO Mata_Kuliah (ID_Matakuliah, Nama_Mata_Matakuliah, Sks, Semester) VALUES
(1, 'Pemrograman Dasar', 3, 'Genap'),
(2, 'Basis Data', 4, 'Genap'),
(3, 'Matematika Diskrit', 3, 'Genap'),
(4, 'Pengantar Teknologi Informasi', 2, 'Genap'),
(5, 'Statistika', 3, 'Genap'),
(6, 'Pemrograman Lanjut', 4, 'Genap'),
(7, 'Sistem Operasi', 3, 'Genap'),
(8, 'Manajemen Proyek TI', 3, 'Genap'),
(9, 'Jaringan Komputer', 4, 'Genap'),
(10, 'Pemrograman Web', 3, 'Genap');

CREATE TABLE Nilai (
	ID INT(11) NOT NULL PRIMARY KEY,
    ID_Mahasiswa INT(11),
    ID_Matakuliah INT(11),
    Nilai VARCHAR(2),
    FOREIGN KEY (ID_Mahasiswa) REFERENCES Mahasiswa (ID_Mahasiswa),
    FOREIGN KEY (ID_Matakuliah) REFERENCES Mata_Kuliah (ID_Matakuliah)
);

INSERT INTO Nilai (ID, ID_Mahasiswa, ID_Matakuliah, Nilai) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B'),
(3, 1, 3, 'B'),
(4, 2, 2, 'B+'),
(5, 3, 1, 'A'),
(6, 3, 2, 'B'),
(7, 3, 3, 'C'),
(8, 4, 4, 'B'),
(9, 5, 5, 'C+'),
(10, 6, 6, 'A'),
(11, 7, 7, 'A'),
(12, 8, 8, 'B'),
(13, 9, 9, 'A'),
(14, 10, 10, 'C');



-- Nomor 2
DELIMITER //
CREATE PROCEDURE Rata_Rata()
BEGIN
    SELECT Mahasiswa.ID_Mahasiswa, Mahasiswa.Nama AS 'Nama Mahasiswa', Mata_Kuliah.Semester AS 'Semester', 
        AVG(
            CASE 
                WHEN N.Nilai = 'A' THEN 4
                WHEN N.Nilai = 'B+' THEN 3.5
                WHEN N.Nilai = 'B' THEN 3
                WHEN N.Nilai = 'C+' THEN 2.5
                WHEN N.Nilai = 'C' THEN 2
                WHEN N.Nilai = 'D+' THEN 1.5
                WHEN N.Nilai = 'D' THEN 1
                ELSE NULL
            END
        ) AS 'Nilai Rata-Rata'
    FROM Mahasiswa
    JOIN Nilai N ON Mahasiswa.ID_Mahasiswa = N.ID_Mahasiswa
    LEFT JOIN Mata_Kuliah ON N.ID_Matakuliah = Mata_Kuliah.ID_Matakuliah
    GROUP BY Mahasiswa.Nama, Mata_Kuliah.Semester;
END //
DELIMITER ;

CALL Rata_Rata();


SELECT * FROM Mahasiswa;
SELECT * FROM Mata_Kuliah;
SELECT * FROM Nilai;