<?php
	include("proses/cek_sesi.php");
	include("proses/get_about.php");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Daftar About Us</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/admin/data_kereta.css">
    <link rel="icon" href="images/favicon.png" type="image/x-sicon">
</head>
<body>
    <div class="logo">
        <button id="menuBtn" onclick="toggleSidebar()">☰</button>
        <p>RailTicket</p>
        <aside class="topbar">
            <a href="proses/logout.php">
                <h5>Logout</h5>
            </a>
        </aside>
    </div>
    
    <div id="mySidebar" class="sidebar">
        <a href="javascript:void(0)" class="closebtn" onclick="toggleSidebar()">&times;</a>
        <ul>
            <li><a href="admin_home.php">Beranda</a></li>
            <li><a href="data_kereta.php">Data Kereta</a></li>
            <li><a href="tambah_data_kereta.php">Tambah Kereta</a></li>
            <li class="active"><a class="active" href="data_about.php">Data About</a></li>
            <li><a href="ubah_about.php">Ubah About</a></li>
            <li><a href="data_pelanggan.php">Pelanggan</a></li>
            <li><a href="data_ringkasan_pemesanan.php">Pemesanan</a></li>
            <li><a href="data_detail_pemesanan.php">Detail Pemesanan</a></li>
            <li><a href="data_pendapatan.php">Pendapatan</a></li>
            <li><a href="data_log_password.php">Log</a></li>
            <li><a href="pengaturan.php">Pengaturan</a></li>
        </ul>
    </div>

    <div id="content">
    <h3 style="margin-left: 45%;">Daftar About</h3>
					<table border="1" class="fontdt">
						<th>No</th>
						<th id="tabeljd">Judul</th>
						<th>Aksi</th>
							<?php
							$no = 1;
								while ($data = mysqli_fetch_array($get_judul)) {
									echo "<tr>";
									echo "<td>".$no++."</td>";
									echo "<td>".$data['judul']."</td>";
									echo "<td><a id ='lhtart' href='edit_about.php?id=".$data['id_about']."'>Edit</a>";
									echo "<a id ='lhtart' href='index.php#".$data['judul']."' target='_blank'>Lihat Teks</a>";
									echo "<a id ='lhtart' href='proses/hapus_about.php?id=".$data['id_about']."'>Hapus</a></td>";
									echo "</tr>";
								}
							?>

					</table>
    </div>
    
    <footer>
        Copyright &copy 2024 by Sukma dan Anisaa
    </footer>

    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById("mySidebar");
            var content = document.getElementById("content");
            var footer = document.querySelector("footer");
            
            if (sidebar.style.width === "250px") {
                sidebar.style.width = "0";
                content.style.marginLeft = "0";
                footer.style.marginLeft = "0";
            } else {
                sidebar.style.width = "250px";
                content.style.marginLeft = "250px";
                footer.style.marginLeft = "250px";
            }
        }
    </script>
</body>
</html>