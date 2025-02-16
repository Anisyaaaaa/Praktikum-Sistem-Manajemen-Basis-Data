-- T R I G G E R --


-- Trigger Untuk Cek Tanggal Kereta Sebelum Menambah Data Kereta --  
DELIMITER //
CREATE TRIGGER cek_tanggal_kereta 
BEFORE INSERT ON kereta 
FOR EACH ROW 
BEGIN
    DECLARE waktu_sekarang TIMESTAMP;
    SET waktu_sekarang = NOW();
    
    IF NEW.tanggal < DATE(waktu_sekarang) OR (NEW.tanggal = DATE(waktu_sekarang) AND NEW.jam_berangkat < TIME(waktu_sekarang)) THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Tidak dapat menambahkan ke dalam Tabel Kereta. Tanggal dan jam harus di atas atau sama dengan waktu saat ini.';
    END IF;
END //
DELIMITER ;

INSERT INTO kereta (id_kereta, nama_kereta, kelas, tanggal, jam_berangkat, jam_tiba, tarif, status) 
VALUES 
(7, 'Kereta Api', 'Eksekutif', '2024-06-10', '08:00', '14:00', 250000.00, 'Tidak Tersedia');



-- Trigger Untuk Cek Status Kereta, Jika Tersedia Maka Tidak Dapat Dihapus --  
DELIMITER //
CREATE TRIGGER cek_status_tidak_tersedia 
BEFORE DELETE ON kereta 
FOR EACH ROW 
BEGIN
    IF OLD.status = 'Tersedia' THEN
        SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'Tidak dapat menghapus data dari Tabel Kereta. Status masih "Tersedia".';
    END IF;
END //
DELIMITER ;


-- Trigger Untuk Menghapus Child Key (Asal dan Tujuan) Sebelum Menghapus Data Kereta --  
DELIMITER //
CREATE TRIGGER before_delete_kereta 
BEFORE DELETE ON kereta
FOR EACH ROW 
BEGIN
    -- Hapus data terkait di tabel asal_kereta
    DELETE FROM asal_kereta WHERE id_kereta = OLD.id_kereta;

    -- Hapus data terkait di tabel tujuan
    DELETE FROM tujuan WHERE id_kereta = OLD.id_kereta;
END //
DELIMITER ;


-- Trigger Untuk Cek Password Baru, Jika Password Sama Maka Tidak Bisa --  
DELIMITER //
CREATE TRIGGER after_update_admin_password 
AFTER UPDATE ON admin
FOR EACH ROW 
BEGIN
    IF NEW.password = OLD.password THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Password admin tidak berhasil diperbarui.';
    END IF;
END //
DELIMITER ;


-- Trigger Untuk Menambah Data Perubahan Password Setiap Kali Mengubah Password --  
-- Buat Tabel Log
CREATE TABLE admin_password_log (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_admin INT NOT NULL,
    username VARCHAR(50),
    old_password VARCHAR(10) NOT NULL,
    new_password VARCHAR(10) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_admin) REFERENCES admin(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Trigger
DELIMITER //
CREATE TRIGGER after_update_admin_password_log
AFTER UPDATE ON admin
FOR EACH ROW 
BEGIN
    IF NEW.password != OLD.password THEN
        INSERT INTO admin_password_log (id_admin, username, old_password, new_password)
        VALUES (OLD.id, OLD.username, OLD.password, NEW.password);
    END IF;
END //
DELIMITER ;