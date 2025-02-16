-- V I E W -- 

-- View Untuk Menampilkan About Us Pada Halaman Awal --
CREATE VIEW about_view AS
SELECT about_us.id_about, about_us.judul, about_us.isi, about_us.tanggal
FROM about_us;


-- View Untuk Menampilkan Data Kereta - Asal - Tujuan --
CREATE VIEW kereta_view AS
SELECT k.id_kereta AS id,
k.nama_kereta AS nama_kereta,
k.kelas AS kelas,
k.tanggal AS tanggal,
k.jam_berangkat AS jam_berangkat,
k.jam_tiba AS jam_tiba,
k.tarif AS tarif,
k.status AS status,
a.asal_kereta AS nama_asal,
t.tujuan AS nama_tujuan 
FROM ((smbdproject.kereta k 
JOIN smbdproject.asal_kereta a ON(k.id_kereta = a.id_kereta)) 
JOIN smbdproject.tujuan t ON(a.id_kereta = t.id_kereta));


-- View Untuk Menampilkan Informasi Pelanggan --
CREATE VIEW informasi_pelanggan_view AS
SELECT 
    p.id_pelanggan,
    p.no_ktp,
    p.nama,
    p.telepon,
    p.email,
    p.total_pembayaran,
    p.tgl_pemesanan,
    k.nama_kereta
FROM 
    pelanggan p
JOIN 
    kereta k ON p.id_kereta = k.id_kereta;



--
CREATE VIEW ringkasan_pemesanan_view AS
SELECT 
    k.nama_kereta,
    k.kelas,
    COUNT(p.id_pelanggan) AS jumlah_pelanggan,
    SUM(p.total_pembayaran) AS total_pendapatan
FROM 
    pelanggan p
JOIN 
    kereta k ON p.id_kereta = k.id_kereta
GROUP BY 
    k.nama_kereta, k.kelas;
 
 
-- 
CREATE VIEW pendapatan_per_hari_view AS
SELECT 
    tgl_pemesanan,
    SUM(total_pembayaran) AS total_pendapatan
FROM 
    pelanggan
GROUP BY 
    tgl_pemesanan;


-- 
CREATE VIEW detail_pemesanan_view AS
SELECT
    p.nama AS nama_pelanggan,
    p.no_ktp,
    p.telepon,
    p.total_pembayaran,
    p.tgl_pemesanan,
    k.nama_kereta,
    k.kelas,
    k.tanggal,
    k.jam_berangkat,
    k.jam_tiba,
    ak.asal_kereta,
    t.tujuan
FROM 
    pelanggan p
JOIN 
    kereta k ON p.id_kereta = k.id_kereta
JOIN 
    asal_kereta ak ON k.id_kereta = ak.id_kereta
JOIN 
    tujuan t ON k.id_kereta = t.id_kereta;

drop view detail_pemesanan_view;