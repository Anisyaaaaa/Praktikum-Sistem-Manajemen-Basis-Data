<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_informasi_pelanggan = mysqli_query($database,"SELECT * FROM informasi_pelanggan_view;");
	mysqli_close($database);
?>