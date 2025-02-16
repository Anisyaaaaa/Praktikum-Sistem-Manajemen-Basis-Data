<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_data_pendapatan = mysqli_query($database,"SELECT * FROM pendapatan_per_hari_view;");
	mysqli_close($database);
?>