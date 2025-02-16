<?php
include('batas.php');
	session_start();	
	$aksi = $_GET['s'];
	$kd_booking = $_GET['kdb'];
	$id_pelanggan = $_GET['idp'];
	$id_kursi = $_GET['idKrs'];
	$idkereta = $_GET['idkrt'];
	$jumlah_penumpang = $_GET['jumlah'];
	$database = mysqli_connect("localhost","root","","smbdproject");
	$getV = $_GET['p'];
	if($aksi=='booking'){
		$set->setBatas($getV);
		$set->batasp();
		$send = $set->getBatas();
		mysqli_query($database,"UPDATE KURSI SET status='Tidak Tersedia', kode_booking='$kd_booking',id_pelanggan=$id_pelanggan WHERE id_kursi=$id_kursi");
		echo "<script>window.location.href='../pilih_kursi.php?id=$idkereta&jumlah_penumpang=$jumlah&idplg=$id_pelanggan&kdb=$kd_booking&p=$send';</script>";
	}elseif($aksi=='batal'){
		$set->setBatas($getV);
		$set->batask();
		$send = $set->getBatas();
		mysqli_query($database,"UPDATE KURSI SET status='Tersedia',kode_booking=NULL,id_pelanggan=NULL WHERE id_kursi=$id_kursi");
		echo "<script>window.location.href='../pilih_kursi.php?id=$idkereta&ajumlah_penumpang=$jumlah&idplg=$id_pelanggan&kdb=$kd_booking&p=$send';</script>";
	}
	mysqli_close($database);
?>