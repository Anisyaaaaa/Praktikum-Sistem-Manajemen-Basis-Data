<?php
session_start();
	$id = $_GET['id'];
	$database = mysqli_connect("localhost","root","","smbdproject");
	$result = mysqli_query($database,"CALL hapus_kereta('$id')");
	if ($result) {
		echo "<script>alert('Data Kereta berhasil dihapus!');window.location.href='../data_kereta.php';</script>";
	}
	else {
		echo "<script>alert('Data Kereta Tidak Bisa Dihapus!');window.location.href='../data_kereta.php';</script>";
	}
	mysqli_close($database);
?>