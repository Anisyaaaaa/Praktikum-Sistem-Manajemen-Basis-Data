CREATE DATABASE Karyawan;

USE Karyawan;

CREATE TABLE Karyawan (
	ID_Karyawan INT(11) NOT NULL PRIMARY KEY,
    Nama VARCHAR(100),
    Posisi VARCHAR(50),
    ID_Atasan INT(11)
);

INSERT INTO Karyawan (ID_Karyawan, Nama, Posisi, ID_Atasan) VALUES
	(1, 'Budi Santoso', 'Manager', NULL),
	(2, 'Ani Wijaya', 'Supervisor', 1),
	(3, 'Cahyo Nugroho', 'Staf', NULL),
	(4, 'Dewi Kurniawan', 'Staf', 1),
	(5, 'Eka Setiawan', 'Staf', 1),
	(6, 'Fita Dewanti', 'Staf', 1),
	(7, 'Galih Susanto', 'Staf', 2),
	(8, 'Hani Maulana', 'Staf', 2),
	(9, 'Indra Wibowo', 'Staf', 2),
	(10, 'Joko Prasetyo', 'Staf', 2);


-- Nomor 1
SELECT B.Nama AS Nama_Karyawan, B.Posisi AS Posisi_Karyawan,
		A.Nama AS Nama_Atasan, A.Posisi AS Posisi_Atasan
FROM Karyawan A
RIGHT JOIN Karyawan B ON A.ID_Karyawan = B.ID_Atasan
ORDER BY B.ID_Karyawan;

SELECT * FROM Karyawan;