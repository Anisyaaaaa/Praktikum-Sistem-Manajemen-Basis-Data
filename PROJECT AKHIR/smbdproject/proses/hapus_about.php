<?php
session_start();
$id = $_GET['id'];
$database = mysqli_connect("localhost","root","","smbdproject");
mysqli_query($database,"CALL hapus_about('$id')");
echo "<script>alert('Artikel berhasil dihapus');window.location.href='../data_about.php';</script>";
mysqli_close($database);
?>