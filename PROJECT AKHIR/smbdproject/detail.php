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
            <li><a id="click" style="cursor: pointer;">Cari Jadwal Kereta Api</a></li>
            <li class="login" id="login" style="cursor: pointer; margin-left: 450px"><a>Login Admin</a></li>
        </ul>
    </nav>
				</header>						
						<div id="carijadwal2">
							<button id="close">X</button>
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
							<button id="cls">X</button>
							<header id="lheader">
								<h1>Login Admin</h1>
							</header>
							<center>
								<form id="lform" method="POST" action="proses/sesi_login.php">
									<input id="linput" type="text" name="username" placeholder="Username"></input><br>
									<input id="linput" type="password" name="password" placeholder="Password"></input><br>
									<button id="lbutton" type="submit" name="login">Login</button>
								</form>
							</center>		
						</div>
				
					<?php
						$database = mysqli_connect("localhost","root","","smbdproject");
						$id = $_GET['id'];
						$query = mysqli_query($database,"SELECT * FROM kereta WHERE id_kereta=$id");
						$query2 = mysqli_query($database, "SELECT * FROM asal_kereta WHERE id_kereta=$id");
						$query3 = mysqli_query($database, "SELECT * FROM tujuan WHERE id_kereta=$id");
						$data1 = mysqli_fetch_array($query);
						$data2 = mysqli_fetch_array($query2);
						$data3 = mysqli_fetch_array($query3);
						?>
				<article class="hasil">
					<?php
						$tanggal = date("d-m-Y", strtotime($data1['tanggal']));
						echo "<center><h3 id='jddetail'>Detail Kereta</h3><center>";
						echo "<center><table id='detailtb'>";
						echo "<tr>";
						echo "<td id='jd'>Nama Kereta</td>";
						echo "<td id='jdisi'>".$data1['nama_kereta']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Kelas</td>";
						echo "<td id='jdisi'>".$data1['kelas']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Asal</td>";
						echo "<td id='jdisi'>".$data2['asal_kereta']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Tujuan</td>";
						echo "<td id='jdisi'>".$data3['tujuan']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Tanggal</td>";
						echo "<td id='jdisi'>$tanggal</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Jam Berangkat</td>";
						echo "<td id='jdisi'>".$data1['jam_berangkat']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Jam Tiba</td>";
						echo "<td id='jdisi'>".$data1['jam_tiba']."</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td id='jd'>Tarif</td>";
						echo "<td id='jdisi'>Rp ".number_format($data1['tarif'],"2",",",".")."</td>";
						echo "</tr>";
						// echo "<tr><td id='jd'></td><td id='jdisi' style='color: blue; cursor: pointer;'><a id='cek'> Cek Kursi</a></td></tr>";
						echo "</table>";
						echo "<script type='text/javascript'> function redirect(){window.location.href='form_pemesan.php?id=$id';}</script>";
						echo "<button type='submit' id='tbpesan' onclick='return redirect()'>PESAN</button></center>";
					?>							
				</article>	
			</div>
			</body>
</html>
