<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_judul = mysqli_query($database,"SELECT * FROM about_view;");
	mysqli_close($database);
?>