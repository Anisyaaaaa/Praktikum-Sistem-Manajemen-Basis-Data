<?php
	$database = mysqli_connect("localhost","root","","smbdproject");
	$get_data = mysqli_query($database,"SELECT * FROM admin_password_log");
	mysqli_close($database);
?>