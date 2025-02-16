<?php
	include("proses/cek_sesi.php");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Pengaturan</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/admin/pengaturan.css">
    <link rel="icon" href="images/favicon.png" type="image/x-sicon">
		<script type="text/javascript" src="scripts/jquery-1.12.2.js"></script>
		<script type="text/javascript" src="scripts/pengaturan.js"></script>
		<script type="text/javascript">
			function konfirmasi_ktk(){
				var konfirmasi = confirm('Yakin ingin mengubah data kontak?');
				if (konfirmasi==true) {
					return true;
				}else{
					return false;
				}
			}
			function konfirmasi_pss(){
				var konfirmasi = confirm('Yakin ingin mengubah password?');
				if (konfirmasi==true) {
					return true;
				}else{
					return false;
				}
			}
		</script>
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
            <li><a href="data_about.php">Data About</a></li>
            <li><a href="ubah_about.php">Ubah About</a></li>
            <li><a href="data_pelanggan.php">Pelanggan</a></li>
            <li><a href="data_ringkasan_pemesanan.php">Pemesanan</a></li>
            <li><a href="data_detail_pemesanan.php">Detail Pemesanan</a></li>
            <li><a href="data_pendapatan.php">Pendapatan</a></li>
            <li><a href="data_log_password.php">Log</a></li>
            <li class="active"><a class="active" href="pengaturan.php">Pengaturan</a></li>
        </ul>
    </div>

    <div id="content">
    <h2 id="font">Halaman Pengaturan Admin</h2><br>
    <center>
					<div id="buttons">					
						<button id="show1">Ubah Sandi</button>	
					</div>
                    <center>
					<div id="ubhpass">
						<form class="settings" id="font2" method="POST" action="proses/set_password.php">
							<table>
							<tr>
							<td><label>Masukkan Kata Sandi Lama</label></td>
							<td><input id="jarakpass3" type="password" name="oldpassword"></input></td></tr><br>
							<tr>
							<td><label>Masukkan Kata Sandi Baru</label></td>
							<td><input id="jarakpass2" type="password" name="newpassword"></input></td></tr><br>
							<tr>
							<td><label>Masukkan Ulang Kata Sandi</label></td>
							<td><input class="cekpass" id="jarakpass" type="password" name="newpassword2"></input></td></tr>
							</table>					
							<button class="setmargin" type="submit" name="batal">Batal</button>
							<button type="submit" name="simpan" onclick="return konfirmasi_pss()">Simpan</button>
						</form>
					</div>
				</div>
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