-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.5.16 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             6.0.0.4046
-- Date/time:                    2012-05-18 14:20:52
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table short.ads
CREATE TABLE IF NOT EXISTS `ads` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL DEFAULT '0',
  `url` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `views` int(10) NOT NULL,
  `max` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `inactive` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table short.ads: ~2 rows (approximately)
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` (`ID`, `user_id`, `url`, `title`, `views`, `max`, `inactive`, `date`) VALUES
	(1, 0, 'http://www.persianscript.ir', 'persianscript', 28, '50000', '', '0000-00-00 00:00:00'),
	(2, 0, 'http://forum.persianscript.ir', 'forum persianscript', 38, '80000', '', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;


-- Dumping structure for table short.allowed_domains
CREATE TABLE IF NOT EXISTS `allowed_domains` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table short.allowed_domains: ~10 rows (approximately)
/*!40000 ALTER TABLE `allowed_domains` DISABLE KEYS */;
INSERT INTO `allowed_domains` (`ID`, `host`, `name`, `date`) VALUES
	(1, 'bit.ly', 'Bitly Service', '2012-04-17 12:00:00'),
	(2, 'j.mp', 'Jmp Service', '2012-04-17 12:00:00'),
	(3, 'goo.gl', 'Googl Service', '2012-04-17 12:00:00'),
	(4, 't.co', 'Tco Service', '2012-04-17 12:00:00'),
	(5, 'ow.ly', 'Owly Service', '2012-04-17 12:00:00'),
	(6, 'su.pr', 'Supr Service', '2012-04-17 12:00:00'),
	(7, 'dlvr.it', 'Dlvrit Service', '2012-04-17 12:00:00'),
	(8, 'fb.me', 'Fbme Service', '2012-04-17 12:00:00'),
	(9, 'wp.me', 'Wpme Service', '2012-04-17 12:00:00'),
	(10, 'tinyurl.com', 'Tinyurlcom Service', '2012-04-17 12:00:00');
/*!40000 ALTER TABLE `allowed_domains` ENABLE KEYS */;


-- Dumping structure for table short.banned_domains
CREATE TABLE IF NOT EXISTS `banned_domains` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `host` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table short.banned_domains: ~1 rows (approximately)
/*!40000 ALTER TABLE `banned_domains` DISABLE KEYS */;
INSERT INTO `banned_domains` (`ID`, `host`, `name`, `date`) VALUES
	(1, 'adf.ly', 'Adfly', '2012-04-17 20:00:00');
/*!40000 ALTER TABLE `banned_domains` ENABLE KEYS */;


-- Dumping structure for table short.banned_clients
CREATE TABLE IF NOT EXISTS `banned_clients` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `banned` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table short.banned_clients: ~0 rows (approximately)
/*!40000 ALTER TABLE `banned_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `banned_clients` ENABLE KEYS */;


-- Dumping structure for table short.settings
CREATE TABLE IF NOT EXISTS `settings` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `site_name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `base_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `multi_max` text COLLATE utf8_unicode_ci NOT NULL,
  `use_ads` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `default_ad` text COLLATE utf8_unicode_ci NOT NULL,
  `spam` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `spam_max` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `spam_time` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pattern` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `google_tracking` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `timezone` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table short.settings: ~1 rows (approximately)
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` (`ID`, `username`, `password`, `site_name`, `base_url`, `multi_max`, `use_ads`, `default_ad`, `spam`, `spam_max`, `spam_time`, `token`, `pattern`, `google_tracking`, `timezone`) VALUES
	(1, 'admin', 'a696afe9672394399d0997321a6f1cd5', 'PersianScript Short URL', '', '10', '1', 'http://www.persianscript.ir', '1', '20', '60', '', '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', 'UA-29744714-1', 'America/Los_Angeles');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;


-- Dumping structure for table short.urls
CREATE TABLE IF NOT EXISTS `urls` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `url` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `short` varchar(60) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `custom` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `via` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `private` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `uses` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hits` int(12) NOT NULL,
  `inactive` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `ads` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `expire` datetime NOT NULL,
  `last` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `short` (`short`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;