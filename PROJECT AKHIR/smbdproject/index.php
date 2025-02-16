<!DOCTYPE html>
<html>
<head>
    <title>Ticket Booking</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <link rel="icon" href="images/favicon.png" type="image/x-sicon">
    <script type="text/javascript" src="scripts/jquery-1.12.2.js"></script>
    <script type="text/javascript" src="scripts/main.js"></script>
</head>
<body>                
    <nav>
        <div class="logo">
            <p>Ticket Booking</p>
        </div>
        <ul>
            <li><a id="click" style='cursor: pointer;'>Cari Jadwal Kereta Api</a></li>
            <li class="login" id="login" style='cursor: pointer; margin-left: 450px'><a>Login Admin</a></li>
        </ul>        
    </nav>
    
    <div class="teks">
        <p>Nikmati pengalaman perjalanan yang luar biasa<br>Pesan tiket kereta api untuk liburan musim panas Anda sekarang.</p>
    </div>
    
    <div id="carijadwal">
        <div class="close">
            <button id="close">X</button>
        </div>
        <header id="rheader">
            <h1 style='text-align: center; margin-top: 0;'>Cari Jadwal Kereta Api</h1>
        </header>
        <form id="rform" style='margin-top: 20px; text-align: center' method="POST" action="hasilpencarian.php">
            <label style='font-weight: bold; font-family: Poppins'>Tanggal &#47; Bulan &#47; Tahun</label><br>
            <?php
                echo "<select name='tanggal' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for ($i=1; $i <=31 ; $i++) { 
                    echo "<option style='font-family: Poppins; font-size: 12px;' value='$i'>$i</option>";
                }
                echo "</select> &#47 ";
                echo "<select name='bulan' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for($i=1;$i<=12;$i++){
                    echo "<option style='font-family: Poppins; font-size: 12px;' value='$i'>$i</option>";
                }
                echo "</select> &#47 ";
                echo "<select name='tahun' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for($i=2023;$i<=2024;$i++){
                    echo "<option style='font-family: Poppins; font-size: 12px;' value='$i'>$i</option>";
                }
                echo "</select>";
            ?><br>
            <label style='font-weight: bold;'>Asal</label><br>
            <select id="roption" name="asal" style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 8px 10px; margin-bottom: 10px; font-family: Poppins'>
                <option value="Stasiun Gambir">Stasiun Gambir</option>
                <option value="Stasiun Bandung">Stasiun Bandung</option>
                <option value="Stasiun Surabaya">Stasiun Surabaya</option>
                <option value="Stasiun Jakarta Kota">Stasiun Jakarta Kota</option>
                <option value="Stasiun Malang">Stasiun Malang</option> 
            </select><br>
            <label style='font-weight: bold;'>Tujuan</label><br>
            <select id="roption" name="tujuan" style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 8px 10px; margin-bottom: 10px; font-family: Poppins'>
                <option value="Stasiun Surabaya Gubeng">Stasiun Surabaya Gubeng</option>
                <option value="Stasiun Semarang Tawang">Stasiun Semarang Tawang</option>
                <option value="Stasiun Yogyakarta Tugu">Stasiun Yogyakarta Tugu</option>
                <option value="Stasiun Solo Balapan">Stasiun Solo Balapan</option>
                <option value="Stasiun Malang Kota Lama">Stasiun Malang Kota Lama</option> 
            </select><br>
            <button id="lbutton" type="submit" name="cari" style='align-items: center;'>Cari</button>
        </form>
    </div>
    
    <div id="menulogin">
        <div class="close">
            <button id="cls">X</button>
        </div>
        
        <header id="lheader">
            <h1>Login Admin</h1>
        </header>
        <center>
            <form id="lform" method="POST" action="proses/sesi_login.php">
                <input id="linput" type="text" name="username" placeholder="Username"><br>
                <input id="linput" type="password" name="password" placeholder="Password"><br>
                <button id="lbutton" type="submit" name="login">Login</button>
            </form>
        </center>        
    </div>
    
    <article>
        <?php
        $database = mysqli_connect("localhost","root","","smbdproject");
        $query = mysqli_query($database,"SELECT * FROM about_view");
        while ($data = mysqli_fetch_array($query)) {
            echo "<h2 style='text-align: center;' class='judul' id='".$data['judul']."'>".$data['judul']."</h2>";
            echo "<p style= 'margin-top: 0; margin-bottom: 35px; font-weight: 200px; padding: 10px; text-align: center;' class='isi'>".$data['isi']."</p>";
        }
        ?>
    </article>    

    <footer>
        Copyright &copy 2024 by Sukma dan Anisaa
    </footer>
</body>
</html>
