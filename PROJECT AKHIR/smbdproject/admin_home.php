<?php
    include("proses/cek_sesi.php");
?>
<!DOCTYPE html>
<html>
<head>
    <title>RailTicket Admin</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/admin/admin_home.css">
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
            <li class="active"><a class="active" href="admin_home.php">Beranda</a></li>
            <li><a href="data_kereta.php">Data Kereta</a></li>
            <li><a href="tambah_data_kereta.php">Tambah Kereta</a></li>
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
        <h2 id="font">Selamat Datang Admin!</h2>
        <center>
            <img id="keretaadmin" src="images/kereta.png" alt="">
        </center>
        <article id="teks">
            <p>Portal Admin kami memberikan berbagai alat dan fitur yang memungkinkan pengguna untuk mengelola tiket kereta api dengan efisien. Dari akses ke dashboard interaktif untuk melihat informasi penting dengan cepat, hingga kemampuan untuk mengatur jadwal kereta, mengelola data penumpang, dan membuat laporan secara instan. Dengan solusi ini, tugas-tugas administratif terkait tiket kereta api dapat diselesaikan dengan mudah dan efektif, meningkatkan produktivitas dan pengalaman pengguna secara keseluruhan. Selain itu, kami terus mengembangkan fitur-fitur baru berdasarkan umpan balik pengguna untuk memastikan bahwa portal kami tetap relevan dan memenuhi kebutuhan yang berkembang dalam industri transportasi. Dengan fokus pada inovasi dan keunggulan pengguna, kami bertekad untuk menjadi mitra terpercaya dalam mengelola layanan tiket kereta api yang modern dan efisien.</p>
        </article>
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