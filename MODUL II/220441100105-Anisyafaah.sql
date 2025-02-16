CREATE DATABASE db_penjualan;

USE db_penjualan;

CREATE TABLE Pelanggan (
	ID_Pelanggan INT (11) PRIMARY KEY, 
    Nama_Pelanggan VARCHAR (100), 
    Email VARCHAR (50),
    Alamat VARCHAR (255)
    );
    
INSERT INTO Pelanggan VALUES (01, "Anisyafaah", "anisyafaah@gmail.com", "Bangkalan");
INSERT INTO Pelanggan VALUES (02, "Herdiyanti Fifin Purwaningrum", "herdiyantififin@gmail.com", "Gresik");
INSERT INTO Pelanggan VALUES (03, "Anisah Nuril Izzati", "anisahnuril@gmail.com", "Bangkalan");
INSERT INTO Pelanggan VALUES (04, "Adhelia Kusumawati", "adheliakusumawati@gmail.com", "Gresik");
INSERT INTO Pelanggan VALUES (05, "Firdausi Putri Cahyani", "firdausiputri@gmail.com", "Surabaya");
INSERT INTO Pelanggan VALUES (06, "Rayhanza Nadhif Athala", "rayhanzanadhif@gmail.com", "Bangkalan");
INSERT INTO Pelanggan VALUES (07, "Birrur Rijaal", "birrurrijaal@gmail.com", "Gresik");
INSERT INTO Pelanggan VALUES (08, "Juanzha Nanda Pratama", "juanzhananda@gmail.com", "Gresik");
INSERT INTO Pelanggan VALUES (09, "Erick Firmansyah", "erickfirmansyah@gmail.com", "Surabaya");
INSERT INTO Pelanggan VALUES (010, "Syahrul Ramadhani", "syahrulramadhani@gmail.com", "Surabaya");

CREATE TABLE Pesanan (
	ID_Pesanan INT (11) PRIMARY KEY,
    ID_Pelanggan INT (11),
    Tanggal_Pesanan DATE,
    Total INT (11),
    FOREIGN KEY (ID_Pelanggan) REFERENCES Pelanggan (ID_Pelanggan)
	);
    
INSERT INTO Pesanan VALUES (1001, 01, "2024-04-04", 15000);    
INSERT INTO Pesanan VALUES (1002, 02, "2024-04-03", 15000);
INSERT INTO Pesanan VALUES (1003, 03, "2024-04-02", 18000);    
INSERT INTO Pesanan VALUES (1004, 04, "2024-04-01", 4000);
INSERT INTO Pesanan VALUES (1005, 05, "2024-03-31", 42000);    
INSERT INTO Pesanan VALUES (1006, 06, "2024-03-30", 8000);
INSERT INTO Pesanan VALUES (1007, 07, "2024-03-29", 8000);    
INSERT INTO Pesanan VALUES (1008, 08, "2024-03-28", 24000);
INSERT INTO Pesanan VALUES (1009, 09, "2024-03-27", 25000);    
INSERT INTO Pesanan VALUES (1010, 010, "2024-03-26", 30000);

UPDATE Pesanan SET Tanggal_Pesanan = "2024-01-01" WHERE ID_Pesanan = 1009;
UPDATE Pesanan SET Tanggal_Pesanan = "2024-01-02" WHERE ID_Pesanan = 1010;
SELECT * FROM Pesanan;


CREATE TABLE Produk (
	ID_Produk INT (11) PRIMARY KEY,
    Nama_Produk VARCHAR (100),
    Harga INT (11),
    Stok INT (11)
    );

INSERT INTO Produk VALUES (111, "Susu Ultramilk", 5000, 4);
INSERT INTO Produk VALUES (112, "Richeese Nabati", 3000, 10);
INSERT INTO Produk VALUES (113, "Wafer Tango", 6000, 8);
INSERT INTO Produk VALUES (114, "Nabati Rolls", 2000, 15);
INSERT INTO Produk VALUES (115, "Susu Indomilk", 7000, 3);
INSERT INTO Produk VALUES (116, "Sosis So Nice", 4000, 6);
INSERT INTO Produk VALUES (117, "Richoco", 2000, 11);
INSERT INTO Produk VALUES (118, "Roma Malkist", 8000, 7);
INSERT INTO Produk VALUES (119, "Qtela Singkong", 8000, 10);
INSERT INTO Produk VALUES (120, "Sari Gandum", 5000, 13);

SELECT * FROM Produk;

CREATE TABLE Detail_Pesanan (
	ID_Detail INT (11) PRIMARY KEY,
    ID_Pesanan INT (11),
    ID_Produk INT (11),
    Jumlah INT (11),
    FOREIGN KEY (ID_Pesanan) REFERENCES Pesanan (ID_Pesanan),
    FOREIGN KEY (ID_Produk) REFERENCES Produk (ID_Produk)
    );
    
INSERT INTO Detail_Pesanan VALUES (121, 1001, 111, 3);
INSERT INTO Detail_Pesanan VALUES (122, 1002, 112, 5);
INSERT INTO Detail_Pesanan VALUES (123, 1003, 113, 3);
INSERT INTO Detail_Pesanan VALUES (124, 1004, 114, 2);
INSERT INTO Detail_Pesanan VALUES (125, 1005, 115, 2);
INSERT INTO Detail_Pesanan VALUES (126, 1006, 116, 2);
INSERT INTO Detail_Pesanan VALUES (127, 1007, 117, 4);
INSERT INTO Detail_Pesanan VALUES (128, 1008, 118, 3);
INSERT INTO Detail_Pesanan VALUES (129, 1009, 119, 5);
INSERT INTO Detail_Pesanan VALUES (130, 1010, 120, 6);
INSERT INTO Detail_Pesanan VALUES (131, 1010, 120, 8);

SELECT * FROM detail_pesanan;

-- Nomor 1 
SELECT AVG(Total) FROM Pesanan;
CREATE VIEW Pemesanan AS
SELECT Pelanggan.Nama_Pelanggan, Pesanan.Total AS 
Total_Harga_Pesanan, Pesanan.Tanggal_Pesanan 
FROM Pelanggan JOIN Pesanan ON Pelanggan.ID_Pelanggan = Pesanan.ID_Pelanggan 
WHERE Pesanan.Total > (SELECT AVG(Total) FROM Pesanan);

SELECT * FROM Pemesanan;
SELECT AVG(Total) FROM Pesanan;


-- Nomor 2
CREATE VIEW Total_Pendapatan_Produk AS
SELECT Produk.Nama_Produk, Produk.Harga AS Harga_Satuan, Detail_Pesanan.Jumlah AS Jumlah_Produk_Terjual, 
(Produk.Harga * Detail_Pesanan.Jumlah) AS Total_Pendapatan
FROM Produk JOIN Detail_Pesanan ON Produk.ID_Produk = Detail_Pesanan.ID_Produk;

SELECT * FROM Total_Pendapatan_Produk;


-- Nomor 3
CREATE VIEW Sisa_Stok AS
SELECT Produk.Nama_Produk, Produk.Stok AS Jumlah_Stok FROM Produk WHERE Stok < 5;

SELECT * FROM Sisa_Stok;


-- Nomor 4
CREATE VIEW Jumlah_Pesanan_Sebulan AS
SELECT Pelanggan.Nama_Pelanggan, COUNT(Pesanan.ID_Pesanan) AS Total_pesanan 
FROM Pelanggan 
JOIN Pesanan ON Pelanggan.ID_Pelanggan = Pesanan.ID_Pelanggan 
WHERE Pesanan.Tanggal_Pesanan BETWEEN DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) AND CURRENT_DATE() 
GROUP BY Pelanggan.ID_Pelanggan;

SELECT * FROM Jumlah_Pesanan_Sebulan;
SELECT * FROM Pesanan;