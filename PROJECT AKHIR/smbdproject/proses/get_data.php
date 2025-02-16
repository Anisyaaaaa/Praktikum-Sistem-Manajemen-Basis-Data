<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_data = mysqli_query($database,"SELECT * FROM kereta_view");
	mysqli_close($database);
?>