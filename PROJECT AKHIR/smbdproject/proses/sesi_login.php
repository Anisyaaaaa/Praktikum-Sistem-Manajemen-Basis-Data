<?php
	session_start();
	$username = $_POST['username'];
	$password = $_POST['password'];
	$database = mysqli_connect("localhost","root","","smbdproject");
	$request = mysqli_query($database,"SELECT * FROM admin WHERE password='$password' AND username='$username'");
	$cek = mysqli_num_rows($request);
	if($cek == 1){
		$_SESSION['admin'] = $username;
		header("location: ../admin_home.php");
	}else{
		echo "<script>alert('Username atau Password Salah');window.location.href='../index.php';</script>";
	}
	mysqli_close($database);
?>