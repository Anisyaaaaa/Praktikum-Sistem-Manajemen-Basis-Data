<!DOCTYPE html>
<html>
<head>
    <title>Ticket Booking</title>
    <link rel="icon" type="image/png" href="images/iconnya.png">
    <link rel="stylesheet" type="text/css" href="css/data_hasil.css"/>
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
            <li><a id="click" style="cursor: pointer;">Cari Jadwal Kereta Api</a></li>
            <li class="login" id="login" style="cursor: pointer; margin-left: 450px"><a>Login Admin</a></li>
        </ul>
    </nav>
    
    <div id="carijadwal2">
        <div class="close">
            <button id="close">X</button>
        </div>
        <header id="rheader">
            <h1 style="text-align: center; margin-top: 0;">Cari Jadwal Kereta Api</h1>
        </header>
        <form id="rform" style="margin-top: 20px; text-align: center" method="POST" action="hasilpencarian.php">
            <label style="font-weight: bold; font-family: Poppins">Tanggal &#47; Bulan &#47; Tahun</label><br>
            <?php
                echo "<select name='tanggal' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for ($i=1; $i <=31 ; $i++) { 
                    echo "<option value='$i' style='font-family: Poppins; font-size: 12px;'>$i</option>";
                }
                echo "</select> &#47; ";
                echo "<select name='bulan' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for($i=1;$i<=12;$i++){
                    echo "<option value='$i' style='font-family: Poppins; font-size: 12px;'>$i</option>";
                }
                echo "</select> &#47; ";
                echo "<select name='tahun' style='font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 5px 8px; margin-bottom: 10px; font-family: Poppins'>";
                for($i=2023;$i<=2024;$i++){
                    echo "<option value='$i' style='font-family: Poppins; font-size: 12px;'>$i</option>";
                }
                echo "</select>";
            ?><br>
            <label style="font-weight: bold;">Asal</label><br>
            <select id="roption" name="asal" style="font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 8px 10px; margin-bottom: 10px; font-family: Poppins">
                <option value="Stasiun Gambir">Stasiun Gambir</option>
                <option value="Stasiun Bandung">Stasiun Bandung</option>
                <option value="Stasiun Surabaya">Stasiun Surabaya</option>
                <option value="Stasiun Jakarta Kota">Stasiun Jakarta Kota</option>
                <option value="Stasiun Malang">Stasiun Malang</option> 
            </select><br>
            <label style="font-weight: bold;">Tujuan</label><br>
            <select id="roption" name="tujuan" style="font-size: 12px; margin-top: 7px; border: solid #9CADCE; border-radius: 7px; padding: 8px 10px; margin-bottom: 10px; font-family: Poppins">
                <option value="Stasiun Surabaya Gubeng">Stasiun Surabaya Gubeng</option>
                <option value="Stasiun Semarang Tawang">Stasiun Semarang Tawang</option>
                <option value="Stasiun Yogyakarta Tugu">Stasiun Yogyakarta Tugu</option>
                <option value="Stasiun Balapan">Stasiun Balapan</option>
                <option value="Stasiun Malang Kota Lama">Stasiun Malang Kota Lama</option> 
            </select><br>
            <button id="lbutton" type="submit" name="cari" style="align-items: center;">Cari</button>
        </form>
    </div>
    
    <div id="menulogin2">
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
    <br>
    <article class="hasil">
        <?php
            error_reporting(0);
            $tgl = $_POST['tanggal'];
            $bln = $_POST['bulan'];
            $thn = $_POST['tahun'];
            $tujuan = $_POST['tujuan'];
            $asal = $_POST['asal'];
            $database = mysqli_connect("localhost","root","","smbdproject");
            $get = mysqli_query($database,"SELECT * FROM kereta WHERE tanggal='$thn-$bln-$tgl'");
            $cek = mysqli_num_rows($get);
            if($cek==0){
                echo "<center><h1>Tidak ada jadwal yang tersedia</h1></center>";
            }else{ ?>
                <center>
                    <table id="tbhasil">
                        <th id="jdwl">Nama Kereta</th>
                        <th id="jdwl">Asal</th>
                        <th id="jdwl">Tujuan</th>
                        <th id="jdwl">Tanggal</th>                                        
                        <th id="jdwl">Jam Berangkat</th>
                        <th id="jdwl">Jam Tiba</th>
                        <th id="jdwl">Kelas</th>
                        <th id="jdwl">Aksi</th>
            <?php
                while ($data = mysqli_fetch_array($get)) {
                    $id = $data['id_kereta'];
                    $get1 = mysqli_query($database,"SELECT * FROM asal_kereta WHERE id_kereta=$id AND asal_kereta='$asal'");
                    $get2 = mysqli_query($database,"SELECT * FROM tujuan WHERE id_kereta=$id AND tujuan='$tujuan'");
                    $data1 = mysqli_fetch_array($get1);
                    $data2 = mysqli_fetch_array($get2);
                    $tanggal = date("d-m-Y", strtotime($data['tanggal']));
                    if($data1['asal_kereta']!=null && $data2['tujuan']!=null){                                
                        echo "<tr>";
                        echo "<td id='isijdwl'>".$data['nama_kereta']."</td>";                                    
                        echo "<td id='isijdwl'>".$data1['asal_kereta']."</td>";
                        echo "<td id='isijdwl'>".$data2['tujuan']."</td>";
                        echo "<td id='isijdwl'>$tanggal</td>";
                        echo "<td align='center' id='isijdwl'>".$data['jam_berangkat']."</td>";
                        echo "<td align='center' id='isijdwl'>".$data['jam_tiba']."</td>";
                        echo "<td id='isijdwl'>".$data['kelas']."</td>";
                        if($data['status']=='Tersedia'){
                            echo "<td id='isijdwla'><a style='color: black;' href='detail.php?id=$id'>Detail</a></td>";    
                        }else{
                            echo "<script>alert('Kereta yang dipilih sudah berangkat');</script>";
                            exit;
                        }                                
                        echo "</tr>";
                    }
                }
            ?>
                    </table>
                </center>
            <?php
            }
        ?>
    </article>
</body>
</html>
