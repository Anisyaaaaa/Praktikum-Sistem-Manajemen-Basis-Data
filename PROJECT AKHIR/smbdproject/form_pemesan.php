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
    <script type="text/javascript">
        function konfirmasi(){
            var pilihan = confirm('Yakin data Anda sudah benar?');
            return pilihan;
        }
    </script>
</head>
<body>                
    <div id="wrapper">                
        <header>    
            <nav>
                <div class="logo">
                    <p>Ticket Booking</p>
                </div>
                <ul>
                    <li><a class="active">Isi Data Pemesan</a></li>
                    <li><a>Pilih Kursi</a></li>
                    <li><a>Review</a></li>
                </ul>
            </nav>
        </header>                        
        <article class="hasil">
            <center>
            <?php
            $id = $_GET['id'];
            echo "<form method='POST' action='proses/proses_pesan.php?id=$id'>"; ?>
                <h3 id="jddetail">Isi Data Pemesan</h3>
                <table>
                    <tr>
                        <td id="jd">No. KTP</td>
                        <td id="jdisi"><input name="no_ktp" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td id="jd">Nama Lengkap</td>
                        <td id="jdisi"><input name="nama" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td id="jd">Nomor Telp/Hp</td>
                        <td id="jdisi"><input name="telepon" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td id="jd">Email</td>
                        <td id="jdisi"><input name="email" style="width: 400px;"></td>
                    </tr>
                    <tr>
                        <td id="jd">Jumlah Penumpang</td>
                        <td id="jdisi"><input name="jumlah_penumpang" style="width: 400px;"></td>
                    </tr>                                  
                </table>
                <br>
                <button type="submit" onclick="return konfirmasi()" name="lanjut" id="tbpesan2" class="custom-button">Selesai</button>

            </form>
            <br>
            <h5>Note : Semua form wajib diisi!</h5>
            </center>
        </article>  
    </div>        
</body>
</html>
