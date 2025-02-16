<?php
include("proses/cek_sesi.php");
include("proses/get_data_detail_pemesanan.php");
?>
<!DOCTYPE html>
<html>
<head>
    <title>Data Detail Pemesanan</title>
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
            <li><a href="data_about.php">Data About</a></li>
            <li><a href="ubah_about.php">Ubah About</a></li>
            <li><a href="data_pelanggan.php">Pelanggan</a></li>
            <li><a href="data_ringkasan_pemesanan.php">Pemesanan</a></li>
            <li class="active"><a class="active" href="data_detail_pemesanan.php">Detail Pemesanan</a></li>
            <li><a href="data_pendapatan.php">Pendapatan</a></li>
            <li><a href="data_log_password.php">Log</a></li>
            <li><a href="pengaturan.php">Pengaturan</a></li>
        </ul>
    </div>

    <div id="content">
    <h3 style="text-align: center; font-family: Arial;">Detail Pemesanan</h3>
        <table border="0" class="fontdt">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Nama Pelanggan</th>
                    <th>No KTP</th>
                    <th>Telepon</th>
                    <th>Total Pembayaran</th>
                    <th>Tanggal Pemesanan</th>
                    <th>Nama Kereta</th>
                    <th>Kelas</th>
                    <th>Tanggal Keberangkatan</th>
                    <th>Jam Berangkat</th>
                    <th>Jam Tiba</th>
                    <th>Asal</th>
                    <th>Tujuan</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = 1;
                if (mysqli_num_rows($get_detail_pemesanan) > 0) {
                    while ($data = mysqli_fetch_assoc($get_detail_pemesanan)) {
                        echo "<tr>";
                        echo "<td>".$no++."</td>";
                        echo "<td>".$data['nama_pelanggan']."</td>";
                        echo "<td>".$data['no_ktp']."</td>";
                        echo "<td>".$data['telepon']."</td>";
                        echo "<td>".number_format($data['total_pembayaran'], 2, ',', '.')."</td>";
                        echo "<td>".$data['tgl_pemesanan']."</td>";
                        echo "<td>".$data['nama_kereta']."</td>";
                        echo "<td>".$data['kelas']."</td>";
                        echo "<td>".$data['tanggal']."</td>";
                        echo "<td>".$data['jam_berangkat']."</td>";
                        echo "<td>".$data['jam_tiba']."</td>";
                        echo "<td>".$data['asal_kereta']."</td>";
                        echo "<td>".$data['tujuan']."</td>";
                        echo "</tr>";
                    }
                } else {
                    echo "<tr><td colspan='15'>No data found</td></tr>";
                }
                ?>
            </tbody>
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