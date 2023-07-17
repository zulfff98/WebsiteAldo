<?php
// Bagian Home
if ($_GET['module']=='home'){
  if ($_SESSION['leveluser']=='siswa'){
  $a = mysql_query("SELECT * FROM siswa WHERE username_login='$_SESSION[namauser]'");
  $as = mysql_fetch_array($a);
  $b = mysql_query("SELECT * FROM kelas WHERE id_kelas='$as[id_kelas]'");
  $bs = mysql_fetch_array($b);
  $c = mysql_query("SELECT * FROM pengajar WHERE id_pengajar='$bs[id_pengajar]'");
  $cs = mysql_fetch_array($c);
  $d = mysql_query("SELECT * FROM siswa WHERE id_siswa='$bs[id_siswa]'");
  $ds = mysql_fetch_array($d);
  
  echo "<br><b class='judul'>Hai $_SESSION[namalengkap]</b><br><p class='garisbawah'></p>
        Selamat datang di <b>E-Learning System Nicesoftmedia</b>.<br>
		Anda berada di kelas <b>$bs[nama]</b><br>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>

  <p class='garisbawah'></p><p align='right'><b class='judul'>Login : $hari_ini, 
  <span id='date'></span>, <span id='clock'></span></p>";
  }
}
// Bagian kelas
elseif ($_GET['module']=='kelas'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_kelas/kelas.php";
  }
}

// Bagian siswa
elseif ($_GET['module']=='siswa'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_siswa/siswa.php";
  }
}

// Bagian admin
elseif ($_GET['module']=='admin'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_admin/admin.php";
  }
}

// Bagian mapel
elseif ($_GET['module']=='matapelajaran'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_matapelajaran/matapelajaran.php";
  }
}

// Bagian materi
elseif ($_GET['module']=='materi'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_materi/materi.php";
  }
}

// Bagian materi
elseif ($_GET['module']=='quiz'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_quiz/quiz.php";
  }
}

// Bagian materi
elseif ($_GET['module']=='kerjakan_quiz'){
  if ($_SESSION['leveluser']=='siswa'){
      include "administrator/modul/mod_quiz/soal.php";
  }
}

// Bagian materi
elseif ($_GET['module']=='nilai'){
  if ($_SESSION['leveluser']=='siswa'){
      include "daftarnilai.php";
  }
}
?>
