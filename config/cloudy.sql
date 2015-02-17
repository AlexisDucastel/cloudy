-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           5.5.37-0ubuntu0.12.04.1 - (Ubuntu)
-- Serveur OS:                   debian-linux-gnu
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la base pour cloudy
CREATE DATABASE IF NOT EXISTS `cloudy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cloudy`;


-- Export de la structure de table cloudy. inventory
CREATE TABLE IF NOT EXISTS `inventory` (
  `pid` varchar(30) NOT NULL COMMENT 'Provider ID',
  `hid` varchar(50) NOT NULL COMMENT 'Host ID',
  `name` varchar(255) NOT NULL COMMENT 'Host common name',
  `env` varchar(10) NOT NULL DEFAULT '',
  `ssh` varchar(200) NOT NULL DEFAULT '',
  `ipList` varchar(200) NOT NULL DEFAULT '',
  `cdate` datetime NOT NULL COMMENT 'Creation date',
  `mdate` datetime NOT NULL COMMENT 'Modification date',
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Active host',
  PRIMARY KEY (`pid`,`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table cloudy.inventory: ~93 rows (environ)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT IGNORE INTO `inventory` (`pid`, `hid`, `name`, `env`, `ssh`, `ipList`, `cdate`, `mdate`, `active`) VALUES
	('fr-mrs01-proxmox', '1001', 'store01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1002', 'krb.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '101101', 'safe.eld.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '101102', 'talend01.eld.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '101103', 'dwh01.eld.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '101104', 'dmn01.eld.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '103101', 'safe.cof.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '103102', 'talend01.cof.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '103103', 'dwh01.cof.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '104101', 'safe.gdf.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '1063', 'api03.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1064', 'ftp.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1150', 'Ubuntu-template', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1151', 'talend01.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1152', 'dwh01.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1153', 'dmn01.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1155', 'safe.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1156', 'jasper.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1228', 'webide.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1229', 'git.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1243', 'rt03.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1249', 'ldap.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1250', 'dns-proxy.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1251', 'git-infra.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '1253', 'netboot.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '2100', 'htmp-cdm.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '2101', 'htmp-svc.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '2110', 'prod-cdm.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '2120', 'comput-cdm.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '2121', 'comput-svc.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3001', 'omattei.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3002', 'ftoumikian.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3003', 'hhassani.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3004', 'prondon.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3005', 'varcher.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3006', 'ssalerno.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3007', 'aducastel.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3008', 'jmarcopoulos.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3009', 'mmeziane.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3010', 'sjobard.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3011', 'mcolson.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3012', 'dgarcia.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3013', 'ctruong.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3014', 'benoit-u1204.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3015', 'rkoch.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3016', 'fnguyen.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3017', 'hwerner.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3018', 'hroche.dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '3019', 'jkhaldi.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3020', 'bmellier.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3059', 'myqa51.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3065', 'makadmin.dev.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3066', 'cas-dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3067', 'jasper-dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3068', 'neo4j-dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3069', 'lifecycle-lb01.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3070', 'lifecycle01.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3071', 'lifecycle02.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3072', 'pilot01.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3074', 'mysql.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3075', 'capistrano.dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3076', 'apericube.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3077', 'api.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3078', 'redir.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3079', 'tools.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3080', 'adminer.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3081', 'cdm-dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3082', 'dev-svc.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3083', 'trk-dev.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3086', 'trackor.qa.rm-rf.io.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3087', 'ads-lb01.qa.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '3088', 'rstudio.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '4008', 'capi01.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '4009', 'capi02.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '4010', 'prondon-nodejs.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '4020', 'chefsrv.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '5101', 'safe.obb.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '5111', 'dm.obb.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '9702', 'prod-gw.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0),
	('fr-mrs01-proxmox', '971', 'api.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '973', 'vpn.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '974', 'mkz.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '975', 'sla.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '979', 'gate.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '980', 'gate.obb.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '981', 'gate.eld.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '983', 'gate.cof.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '984', 'gate.gdf.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '989', 'test-gw.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:50', '2015-02-17 09:49:50', 0),
	('fr-mrs01-proxmox', '990', 'deploy.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '991', 'zabbix.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '993', 'mta.fr-mrs01.rm-rf.io', '', '', '', '2015-02-17 09:49:51', '2015-02-17 09:49:51', 0),
	('fr-mrs01-proxmox', '9999', 'tplU12.04', '', '', '', '2015-02-17 09:49:52', '2015-02-17 09:49:52', 0);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
