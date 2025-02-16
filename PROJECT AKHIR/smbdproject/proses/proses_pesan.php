<?php
session_start();

$id = $_GET['id'];
$no_ktp = $_POST['no_ktp'];
$nama = $_POST['nama'];
$no_telp = $_POST['telepon']; // Disesuaikan dengan nama di form
$email = $_POST['email'];
$jumlah_penumpang = $_POST['jumlah_penumpang'];

if (isset($_POST['lanjut'])) {
    if ($no_ktp && $nama && $no_telp && $email && $jumlah_penumpang) {
        if (strlen($no_ktp) != 16) {
            echo "<script>alert('No. KTP harus memiliki 16 digit');window.location.href='../form_pemesan.php?id=$id';</script>";
            exit;
        } elseif (preg_match('/[0-9]/', $nama)) {
            echo "<script>alert('Nama Lengkap tidak boleh mengandung angka');window.location.href='../form_pemesan.php?id=$id';</script>";
            exit;
        } elseif (preg_match('/[A-Za-z]/', $no_telp)) {
            echo "<script>alert('Nomor Hp tidak boleh mengandung huruf');window.location.href='../form_pemesan.php?id=$id';</script>";
            exit;
        } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            echo "<script>alert('Email tidak valid');window.location.href='../form_pemesan.php?id=$id';</script>";
            exit;
        } elseif (!is_numeric($jumlah_penumpang) || $jumlah_penumpang <= 0) {
            echo "<script>alert('Jumlah penumpang harus berupa angka positif');window.location.href='../form_pemesan.php?id=$id';</script>";
            exit;
        } else {
            $database = mysqli_connect("localhost", "root", "", "smbdproject");
            if (!$database) {
                die("Connection failed: " . mysqli_connect_error());
            }

            $query = mysqli_query($database, "SELECT * FROM kereta WHERE id_kereta=$id");
            if ($query) {
                $data = mysqli_fetch_array($query);
                $hasil = $data['tarif'] * $jumlah_penumpang;
                $insertQuery = mysqli_query($database, "INSERT INTO pelanggan (id_kereta, no_ktp, nama, telepon, email, total_pembayaran, tgl_pemesanan) VALUES ('$id', '$no_ktp', '$nama', '$no_telp', '$email', '$hasil', CURDATE())");

                if ($insertQuery) {
                    $query2 = mysqli_query($database, "SELECT * FROM pelanggan ORDER BY id_pelanggan DESC LIMIT 1");
                    if ($query2) {
                        $data2 = mysqli_fetch_array($query2);
                        $id_pelanggan = $data2['id_pelanggan'];

                        $char = "k83dfh3ld8ab9hfcfg12d4g5h88354hi647j3m24ef645dfp3675q6nfd7krty6yt8y96ou44656x0v55yrw1tklk87k56yz25up6i6rstr";
                        $kode = substr(str_shuffle($char), 0, 6);

                        echo "<script>alert('Data berhasil disimpan!');";
                        echo "window.location='../index.php?id=$id&jumlah=$jumlah_penumpang&idplg=$id_pelanggan&kdb=$kode'</script>";
                    }
                } else {
                    echo "<script>alert('Gagal menyimpan data pelanggan');window.location.href='../form_pemesan.php?id=$id';</script>";
                }
            } else {
                echo "<script>alert('Kereta tidak ditemukan');window.location.href='../form_pemesan.php?id=$id';</script>";
            }
            mysqli_close($database);
        }
    } else {
        echo "<script>alert('Isi data secara lengkap!');window.location.href='../form_pemesan.php?id=$id';</script>";
    }
}
?>
