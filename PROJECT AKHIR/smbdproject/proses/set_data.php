<?php
session_start();

$nama = $_POST['namakereta'];
$kelas = $_POST['kelas'];
$asal = $_POST['asal'];
$tujuan = $_POST['tujuan'];
$jambr = $_POST['jam1'];
$jamtb = $_POST['jam2'];
$tarif = $_POST['tarif'];
$tanggal = $_POST['tanggal'];
$bulan = $_POST['bulan'];
$tahun = $_POST['tahun'];

$database = mysqli_connect("localhost", "root", "", "smbdproject");

if (!$database) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

if ($asal != $tujuan) {
    // Memanggil prosedur tambah_kereta dengan 8 argumen
    $query = "CALL tambah_kereta(NULL, '$nama', '$kelas', '$tahun-$bulan-$tanggal', '$jambr', '$jamtb', $tarif, 'Tersedia')";
    $result = mysqli_query($database, $query);
}

if ($result) {
    // Mendapatkan ID kereta yang baru ditambahkan
    $query = "SELECT MAX(id_kereta) AS new_train_id FROM kereta";
    $result = mysqli_query($database, $query);

    if ($result && mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_assoc($result);
        $newTrainId = $row['new_train_id'];

        // Menyimpan data asal
        mysqli_query($database, "INSERT INTO asal_kereta (id_asal, asal_kereta, id_kereta) VALUES (NULL, '$asal', '$newTrainId')");

        // Menyimpan data tujuan
        mysqli_query($database, "INSERT INTO tujuan (id_tujuan, tujuan, id_kereta) VALUES (NULL, '$tujuan', '$newTrainId')");

        // Menyimpan data gerbong dan kursi
        mysqli_query($database, "CALL looping_gerbong($newTrainId)");

        echo "<script>alert('Data berhasil disimpan!');window.location.href='../data_kereta.php';</script>";
    } else {
        echo "<script>alert('Gagal mendapatkan ID kereta baru.');window.location.href='../data_kereta.php';</script>";
    }
} else {
    echo "<script>alert('Gagal menambahkan data kereta.');window.location.href='../data_kereta.php';</script>";
}

mysqli_close($database);
?>
