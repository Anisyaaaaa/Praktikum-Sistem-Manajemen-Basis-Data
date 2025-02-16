<?php
session_start();
	$id = $_GET['id'];
	$database = mysqli_connect("localhost","root","","smbdproject");
	mysqli_query($database,"UPDATE kereta SET status='Tersedia' WHERE id_kereta=$id");
	echo "<script>window.location.href='../data_kereta.php';</script>";
	mysqli_close($database);
?>