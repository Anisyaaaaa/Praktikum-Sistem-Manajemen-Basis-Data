<!-- <?php
session_start();
	$id = $_GET['id'];
	$database = mysqli_connect("localhost","root","","smbdproject");
	$result = mysqli_query($database,"CALL hapus_kursi('$id')");
	if ($result) {
		echo "<script>alert('Data Customer di Kursi ini berhasil dihapus dan menjadi Tersedia kembali!');window.location.href='../lihatdata.php';</script>";
	}
	else {
		echo "<script>alert('Data Customer Tidak Bisa Dihapus!');window.location.href='../lihatdata.php';</script>";
	}
	mysqli_close($database);
?> -->