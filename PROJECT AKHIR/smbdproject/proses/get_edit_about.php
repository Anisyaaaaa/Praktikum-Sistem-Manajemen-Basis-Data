<?php
session_start();
$judul = $_POST['judul'];
$isi = $_POST['isi'];
$id = $_POST['id'];

if (isset($_POST['simpan'])) {
    $database = mysqli_connect("localhost", "root", "", "smbdproject");
    $stmt = $database->prepare("UPDATE about_us SET judul = ?, isi = ? WHERE id_about = ?");
    $stmt->bind_param("ssi", $judul, $isi, $id);
    $stmt->execute();
    $stmt->close();
    mysqli_close($database);
    echo "<script>alert('Teks berhasil disimpan');window.location.href='../data_about.php';</script>";
} elseif (isset($_POST['batal'])) {
    echo "<script>window.location.href='../data_about.php';</script>";
}
?>
