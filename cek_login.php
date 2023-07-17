<?php
include "configurasi/koneksi.php";
function anti_injection($data){
  $filter = mysql_real_escape_string(stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES))));
  return $filter;
}

$username = anti_injection($_POST['username']);
$pass     = anti_injection(md5($_POST['password']));

// pastikan username dan password adalah berupa huruf atau angka.
if (!ctype_alnum($username) OR !ctype_alnum($pass)){
  echo "Access not allowed";
}
else{
$login=mysql_query("SELECT * FROM siswa WHERE username_login='$username' AND password_login='$pass' AND blokir='N'");
$ketemu=mysql_num_rows($login);
$r=mysql_fetch_array($login);

// Apabila username dan password ditemukan
if ($ketemu > 0){
  session_start();
  include "timeout.php";

  $_SESSION[namauser]     = $r[username_login];
  $_SESSION[namalengkap]  = $r[nama_lengkap];
  $_SESSION[passuser]     = $r[password_login];
  $_SESSION[leveluser]    = $r[level];
  $_SESSION[idsiswa]      = $r[id_siswa];

  // session timeout
  $_SESSION[login] = 1;
  timer();

	$sid_lama = session_id();

	session_regenerate_id();

	$sid_baru = session_id();

 
  header('location:home');
}
else{  
  echo "<script>window.alert('LOGIN GAGAL! Username atau Password tidak benar. Atau account anda sedang di blokir!');
            window.location=(href='index.php')</script>";
}
}
?>
