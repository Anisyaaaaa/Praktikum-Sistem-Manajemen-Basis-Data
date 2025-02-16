<?php
session_start();
	$judul = $_POST['judul'];
	$isi = $_POST['isi'];
	if(isset($_POST['simpan'])){
		$database = mysqli_connect("localhost","root","","smbdproject");
		mysqli_query($database,"CALL tambah_about(NULL, '$judul', '$isi')");
		echo "<script>alert('Artikel berhasil disimpan');window.location.href='../data_about.php';</script>";
	}elseif(isset($_POST['batal'])){
		echo "<script>window.location.href='../admin_home.php';</script>";
	}
	mysqli_close($database);
?>