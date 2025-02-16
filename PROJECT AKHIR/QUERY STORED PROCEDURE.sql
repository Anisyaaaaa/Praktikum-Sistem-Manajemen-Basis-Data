-- S T O R E D  P R O C E D U R E -- 

-- Stored Procedure Untuk Menghapus About Us -- (Hapus About)
DELIMITER //
CREATE PROCEDURE hapus_about(
    IN id_about_param INT
)
BEGIN
    DELETE FROM about_us WHERE id_about = id_about_param;
END//
DELIMITER ;


-- Stored Procedure Untuk Menambah About Us -- (Tambah About)
DELIMITER //
CREATE PROCEDURE tambah_about(
	IN id INT(100), 
    IN $judul VARCHAR(255), 
    IN $isi TEXT
)
BEGIN
    INSERT INTO about_us VALUES(NULL, $judul, $isi, CURDATE());
END//
DELIMITER ;


-- Stored Procedure Untuk Menghapus Data Kereta -- (Hapus Kereta)
DELIMITER //
CREATE PROCEDURE hapus_kereta (IN idk INT(100))  
BEGIN
	DELETE FROM kereta WHERE id_kereta = idk;
END //
DELIMITER ;


-- Stored Procedure Untuk Mengupdate Password -- (Ubah Password)
DELIMITER //
CREATE PROCEDURE update_pass (
	IN admin_id INT(100), 
    IN old_password VARCHAR(255), 
    IN new_password VARCHAR(255)
)
BEGIN
	 DECLARE pass VARCHAR(255);

  -- Cek apakah password lama sesuai
  SELECT password INTO pass FROM admin WHERE id = admin_id;

  IF pass IS NOT NULL AND pass = old_password THEN
    -- Update password baru
    UPDATE admin SET password = new_password WHERE id = admin_id;
    SELECT 'Password berhasil diperbarui.' AS Message;
  ELSE
    SELECT 'Password lama tidak sesuai.' AS Message;
  END IF;
END //
DELIMITER ;


-- Stored Procedure Untuk Looping Gerbong dan Kursi Ketika Menambah Data Kereta Baru -- 
DELIMITER //
CREATE PROCEDURE looping_gerbong(
    IN new_train_id INT
)
BEGIN
    DECLARE gerbong_num INT DEFAULT 1;
    DECLARE gerbong_code CHAR(1);
    
    WHILE gerbong_num <= 5 DO
        SET gerbong_code = CHAR(64 + gerbong_num); -- Generates 'A', 'B', 'C', 'D', 'E'
        INSERT INTO gerbong (gerbong, id_kereta) VALUES (gerbong_code, new_train_id);
        SET gerbong_num = gerbong_num + 1;
    END WHILE;
END //
DELIMITER ;

-- Stored Procedure Untuk Menambah Data Kereta -- (Tambah Kereta)
DELIMITER //
CREATE PROCEDURE tambah_kereta (
	IN id INT(10), 
    IN kereta VARCHAR(100), 
    IN kls VARCHAR(50), 
    IN tgl DATE, 
    IN jam_brngkt VARCHAR(5), 
    IN jam_tb VARCHAR(5), 
    IN harga DECIMAL(22,2),
    IN stts VARCHAR(50))
BEGIN 
	INSERT INTO kereta (id_kereta, nama_kereta, kelas, tanggal, jam_berangkat, jam_tiba, tarif, status)
    VALUES (id, kereta, kls, tgl, jam_brngkt, jam_tb, harga, stts);
END //
DELIMITER ;





-- Stored Procedure Untuk Menghapus Kursi -- (Hapus Kursi)
-- DELIMITER //
-- CREATE PROCEDURE hapus_kursi(
--     IN p_id_kursi INT,
--     IN p_posisi_kursi VARCHAR(4),
--     IN p_id_gerbong INT
-- )
-- BEGIN
--     DELETE FROM kursi
--     WHERE (p_id_kursi IS NULL OR id_kursi = p_id_kursi)
--       AND (p_posisi_kursi IS NULL OR posisi_kursi = p_posisi_kursi)
--       AND (p_id_gerbong IS NULL OR id_gerbong = p_id_gerbong);
-- END //
-- DELIMITER ;