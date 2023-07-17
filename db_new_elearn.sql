-- phpMyAdmin SQL Dump
-- version 2.7.0-pl2
-- http://www.phpmyadmin.net
-- 
-- Host: localhost
-- Generation Time: Jul 09, 2023 at 02:24 AM
-- Server version: 5.0.18
-- PHP Version: 5.1.2
-- 
-- Database: `db_new_elearn`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `admin`
-- 

CREATE TABLE `admin` (
  `id_admin` int(2) NOT NULL auto_increment,
  `username` varchar(15) NOT NULL default 'administrator',
  `password` text NOT NULL,
  `nama_lengkap` text NOT NULL,
  `level` varchar(5) NOT NULL default 'admin',
  `alamat` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` text NOT NULL,
  `blokir` enum('Y','N') NOT NULL default 'N',
  `id_session` text NOT NULL,
  PRIMARY KEY  (`id_admin`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- 
-- Dumping data for table `admin`
-- 

INSERT INTO `admin` VALUES (5, 'admin', 'bfd59291e825b5f2bbf1eb76569f8fe7', 'Aldo', 'admin', 'Bekasi', '08229878', 'aldo@gmail.com', 'N', 'ebd531518e772a25bb50d360abab0150');

-- --------------------------------------------------------

-- 
-- Table structure for table `file_materi`
-- 

CREATE TABLE `file_materi` (
  `id_file` int(7) NOT NULL auto_increment,
  `judul` text NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `nama_file` varchar(25) NOT NULL,
  `tgl_posting` date NOT NULL,
  `pembuat` int(2) NOT NULL,
  `hits` int(3) NOT NULL,
  PRIMARY KEY  (`id_file`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- 
-- Dumping data for table `file_materi`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `jawaban`
-- 

CREATE TABLE `jawaban` (
  `id` int(3) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `id_quiz` int(3) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  `jawaban` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- 
-- Dumping data for table `jawaban`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `kelas`
-- 

CREATE TABLE `kelas` (
  `id` int(5) NOT NULL auto_increment,
  `id_kelas` varchar(6) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `id_pengajar` int(3) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

-- 
-- Dumping data for table `kelas`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `mata_pelajaran`
-- 

CREATE TABLE `mata_pelajaran` (
  `id` int(5) NOT NULL auto_increment,
  `id_matapelajaran` varchar(10) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_pengajar` int(3) NOT NULL,
  `deskripsi` text NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `id_kelas` (`id_kelas`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- 
-- Dumping data for table `mata_pelajaran`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nilai`
-- 

CREATE TABLE `nilai` (
  `id` int(5) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  `benar` int(2) NOT NULL,
  `salah` int(2) NOT NULL,
  `tidak_dikerjakan` int(2) NOT NULL,
  `persentase` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Dumping data for table `nilai`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `nilai_soal_esay`
-- 

CREATE TABLE `nilai_soal_esay` (
  `id` int(3) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  `nilai` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `nilai_soal_esay`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `pengajar`
-- 

CREATE TABLE `pengajar` (
  `id_pengajar` int(3) NOT NULL auto_increment,
  `nip` char(12) NOT NULL,
  `nama_lengkap` text NOT NULL,
  `username_login` varchar(20) NOT NULL,
  `password_login` text NOT NULL,
  `level` varchar(8) NOT NULL default 'pengajar',
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `email` text,
  `foto` text NOT NULL,
  `jabatan` varchar(24) NOT NULL,
  `blokir` enum('Y','N') NOT NULL default 'N',
  `id_session` text NOT NULL,
  PRIMARY KEY  (`id_pengajar`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

-- 
-- Dumping data for table `pengajar`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `quiz_esay`
-- 

CREATE TABLE `quiz_esay` (
  `id_quiz` int(3) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(4) NOT NULL default 'esay',
  PRIMARY KEY  (`id_quiz`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=95 ;

-- 
-- Dumping data for table `quiz_esay`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `quiz_pilganda`
-- 

CREATE TABLE `quiz_pilganda` (
  `id_quiz` int(3) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `pertanyaan` text NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `pil_a` text NOT NULL,
  `pil_b` text NOT NULL,
  `pil_c` text NOT NULL,
  `pil_d` text NOT NULL,
  `kunci` varchar(1) NOT NULL,
  `tgl_buat` date NOT NULL,
  `jenis_soal` varchar(8) NOT NULL default 'pilganda',
  PRIMARY KEY  (`id_quiz`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=228 ;

-- 
-- Dumping data for table `quiz_pilganda`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `siswa`
-- 

CREATE TABLE `siswa` (
  `id_siswa` int(9) NOT NULL auto_increment,
  `nis` varchar(20) NOT NULL,
  `nama_lengkap` text NOT NULL,
  `username_login` varchar(20) NOT NULL,
  `password_login` text NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `alamat` text NOT NULL,
  `tempat_lahir` varchar(25) NOT NULL,
  `tgl_lahir` date NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `agama` varchar(20) NOT NULL,
  `nama_ayah` text NOT NULL,
  `nama_ibu` text NOT NULL,
  `th_masuk` int(4) NOT NULL,
  `email` text NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `foto` text NOT NULL,
  `blokir` enum('Y','N') NOT NULL,
  `id_session` varchar(20) NOT NULL,
  `id_session_soal` varchar(20) NOT NULL,
  `level` varchar(5) NOT NULL default 'siswa',
  PRIMARY KEY  (`id_siswa`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- 
-- Dumping data for table `siswa`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `siswa_sudah_mengerjakan`
-- 

CREATE TABLE `siswa_sudah_mengerjakan` (
  `id` int(5) NOT NULL auto_increment,
  `id_tq` int(3) NOT NULL,
  `id_siswa` int(9) NOT NULL,
  `dikoreksi` varchar(1) NOT NULL default 'B',
  `hits` int(3) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- 
-- Dumping data for table `siswa_sudah_mengerjakan`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `topik_quiz`
-- 

CREATE TABLE `topik_quiz` (
  `id_tq` int(3) NOT NULL auto_increment,
  `judul` text NOT NULL,
  `id_kelas` varchar(5) NOT NULL,
  `id_matapelajaran` varchar(10) NOT NULL,
  `tgl_buat` date NOT NULL,
  `pembuat` varchar(100) NOT NULL,
  `waktu_pengerjaan` int(4) NOT NULL,
  `info` text NOT NULL,
  `terbit` enum('Y','N') NOT NULL default 'Y',
  PRIMARY KEY  (`id_tq`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- 
-- Dumping data for table `topik_quiz`
-- 

