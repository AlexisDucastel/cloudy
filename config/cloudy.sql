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
  `cdate` datetime NOT NULL COMMENT 'Creation date',
  `mdate` datetime NOT NULL COMMENT 'Modification date',
  `active` tinyint(4) NOT NULL COMMENT 'Active host',
  PRIMARY KEY (`pid`,`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Export de données de la table cloudy.inventory: ~0 rows (environ)
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
