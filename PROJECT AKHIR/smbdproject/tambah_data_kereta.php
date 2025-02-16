<?php
	include("proses/cek_sesi.php");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Tambah Data Kereta</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/admin/tambah_kereta.css">
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
            <li class="active"><a class="active" href="tambah_data_kereta.php">Tambah Kereta</a></li>
            <li><a href="data_about.php">Data About</a></li>
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
    <h3 id="font">Tambah Data Kereta RailTicket</h3>
					<form method="POST" action="proses/set_data.php">						
						<label>Nama Kereta Api</label>
						<input class="jaraknama" name="namakereta" type="text"></input><br>
						<label>Kelas</label>
						<select class="jarakkelas" name="kelas">
							<option value="Eksekutif">Eksekutif</option>
							<option value="Bisnis">Bisnis</option>
							<option value="Ekonomi">Ekonomi</option>
						</select><br>
						<label>Asal</label>
						<select class="jarakasal" name="asal">
							<option value="Stasiun Gambir">Stasiun Gambir</option>
							<option value="Stasiun Bandung">Stasiun Bandung</option>
							<option value="Stasiun Surabaya">Stasiun Surabaya</option>
							<option value="Stasiun Jakarta Kota">Stasiun Jakarta Kota</option>
							<option value="Stasiun Malang">Stasiun Malang</option> 
						</select><br>
						<label>Tujuan</label>
						<select class="jaraktujuan" name="tujuan" type="text">
							<option value="Stasiun Surabaya Gubeng">Stasiun Surabaya Gubeng</option>
							<option value="Stasiun Bandung">Stasiun Semarang Tawang</option>
							<option value="Stasiun Yogyakarta Tugu">Stasiun Yogyakarta Tugu</option>
							<option value="Stasiun Jakarta Kota">Stasiun Balapan</option>
							<option value="Stasiun Malang Kota Lama">Stasiun Malang Kota Lama</option> 
							<!-- <option value="Stasiun Surabaya">Stasiun Surabaya</option>  -->
						</select><br>
						<label>Tanggal/Bulan/Tahun</label>
						<?php
							echo "<select class='tanggal' name='tanggal'>";
							for ($i=1; $i <=31 ; $i++) { 
								echo "<option value='$i'>$i</option>";
							}
							echo "</select>&#45;";
							echo "<select class='bulan' name='bulan'>";
							for($i=1;$i<=12;$i++){
								echo "<option value='$i'>$i</option>";
							}
							echo "</select>&#45;";
							echo "<select class='tahun' name='tahun'>";
							for($i=2023;$i<=2024;$i++){
								echo "<option value='$i'>$i</option>";
							}
							echo "</select>";
						?><br>
						<label>Jam Keberangkatan/Tiba</label>
						<input class="jarakjam" name="jam1" type="time"></input><label><b>/</b></label><input class="jarakjam2" name="jam2" type="time"></input><br>
						<label>Harga Tiket</label>
						<!-- <input class="jarakharga1" name="tarif_d" type="text"></input><br>
						<label>Harga Tiket Anak-anak<br>(&#8804; 3 Tahun)</label> -->
						<input class="jarakharga" name="tarif" type="text"></input><br>
						<button class="batal" type="submit" name="batal">Batal</button>
						<button class="simpan" type="submit" name="simpan">Simpan</button>
					</form>
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