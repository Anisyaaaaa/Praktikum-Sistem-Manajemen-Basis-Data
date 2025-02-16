<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_detail_pemesanan = mysqli_query($database,"SELECT * FROM detail_pemesanan_view;");
	mysqli_close($database);
?>