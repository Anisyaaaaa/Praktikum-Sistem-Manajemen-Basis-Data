<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_data_ringkasan_pemesanan = mysqli_query($database,"SELECT * FROM ringkasan_pemesanan_view;");
	mysqli_close($database);
?>