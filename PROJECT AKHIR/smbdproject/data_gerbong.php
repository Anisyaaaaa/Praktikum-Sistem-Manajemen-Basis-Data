<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data Gerbong</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/admin/gerbong.css">
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
            <li><a href="data_about.php">Data About</a></li>
            <li><a href="ubah_about.php">Ubah About</a></li>
            <li class="active"><a href="data_pelanggan.php">Pelanggan</a></li>
            <li><a href="data_ringkasan_pemesanan.php">Pemesanan</a></li>
            <li><a href="data_detail_pemesanan.php">Detail Pemesanan</a></li>
            <li><a href="data_pendapatan.php">Pendapatan</a></li>
            <li><a href="data_log_password.php">Log</a></li>
            <li><a href="pengaturan.php">Pengaturan</a></li>
        </ul>
    </div>
    
    <article class="hasil">
        <div id="content">
            <center>
            <?php
                include('proses/batas.php');
                $database = mysqli_connect("localhost", "root", "", "smbdproject");
                $id = $_GET['id'];
                $query = mysqli_query($database, "SELECT * FROM gerbong WHERE id_kereta='$id'");

                echo "<table id='tbk'>";
                echo "<tr><th>Gerbong</th></tr>";

                while ($data = mysqli_fetch_array($query)) {
                    echo "<tr><td>" . $data['gerbong'] . "</td></tr>";
                }

                echo "</table>";

                mysqli_close($database);
            ?>
            </center>
        </div>
    </article>   

    <footer>
        <p> Copyright &copy 2024 by Sukma dan Anisaa</p>
    </footer>

    <script>
        function toggleSidebar() {
            var sidebar = document.getElementById("mySidebar");
            var content = document.getElementById("content");

            if (sidebar.style.width === "250px") {
                sidebar.style.width = "0";
                content.style.marginLeft = "0";
            } else {
                sidebar.style.width = "250px";
                content.style.marginLeft = "250px";
            }
        }
    </script>
</body>
</html>
