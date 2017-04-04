-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.16-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para alquilercoches
CREATE DATABASE IF NOT EXISTS `alquilercoches` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `alquilercoches`;


-- Volcando estructura para tabla alquilercoches.bancos
CREATE TABLE IF NOT EXISTS `bancos` (
  `id_banco` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` int(11) NOT NULL DEFAULT '0',
  `poblacion` int(11) NOT NULL DEFAULT '0',
  `telefono` int(11) DEFAULT '0',
  `nombre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.bancos: ~0 rows (aproximadamente)
DELETE FROM `bancos`;
/*!40000 ALTER TABLE `bancos` DISABLE KEYS */;
/*!40000 ALTER TABLE `bancos` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.categorias: ~0 rows (aproximadamente)
DELETE FROM `categorias`;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL DEFAULT '0',
  `apellidos` varchar(50) NOT NULL DEFAULT '0',
  `poblacion` varchar(50) NOT NULL DEFAULT '0',
  `direccion` varchar(50) NOT NULL DEFAULT '0',
  `provincia` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.clientes: ~0 rows (aproximadamente)
DELETE FROM `clientes`;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.clientes_vehiculos
CREATE TABLE IF NOT EXISTS `clientes_vehiculos` (
  `cliente` int(11) NOT NULL,
  `vehiculo` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `precio` float NOT NULL,
  PRIMARY KEY (`cliente`,`vehiculo`,`fecha`),
  KEY `FK_vehiculo` (`vehiculo`),
  CONSTRAINT `FK_cliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vehiculo` FOREIGN KEY (`vehiculo`) REFERENCES `vehiculos` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.clientes_vehiculos: ~0 rows (aproximadamente)
DELETE FROM `clientes_vehiculos`;
/*!40000 ALTER TABLE `clientes_vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes_vehiculos` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.ficha_tecnica
CREATE TABLE IF NOT EXISTS `ficha_tecnica` (
  `id_ficha_tecnica` int(11) NOT NULL AUTO_INCREMENT,
  `propietario` varchar(50) NOT NULL,
  `fecha_itv` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `observaciones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_ficha_tecnica`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.ficha_tecnica: ~0 rows (aproximadamente)
DELETE FROM `ficha_tecnica`;
/*!40000 ALTER TABLE `ficha_tecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_tecnica` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.tarjetas
CREATE TABLE IF NOT EXISTS `tarjetas` (
  `id_tarjeta` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(50) NOT NULL DEFAULT '0',
  `limite` int(11) NOT NULL DEFAULT '0',
  `idx` int(11) NOT NULL DEFAULT '0',
  `cliente` int(11),
  `banco` int(11),
  PRIMARY KEY (`id_tarjeta`),
  KEY `FK_tarjeta_cliente` (`cliente`),
  KEY `FK_tarjeta_banco` (`banco`),
  CONSTRAINT `FK_tarjeta_banco` FOREIGN KEY (`banco`) REFERENCES `bancos` (`id_banco`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tarjeta_cliente` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.tarjetas: ~0 rows (aproximadamente)
DELETE FROM `tarjetas`;
/*!40000 ALTER TABLE `tarjetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjetas` ENABLE KEYS */;


-- Volcando estructura para tabla alquilercoches.vehiculos
CREATE TABLE IF NOT EXISTS `vehiculos` (
  `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT,
  `bastidor` varchar(50) NOT NULL DEFAULT '0',
  `matricula` varchar(50) NOT NULL DEFAULT '0',
  `marca` varchar(50) NOT NULL DEFAULT '0',
  `kilometros` varchar(50) DEFAULT '0',
  `modelo` varchar(50) NOT NULL DEFAULT '0',
  `categoria` int(11) NOT NULL,
  `ficha_tecnica` int(11),
  PRIMARY KEY (`id_vehiculo`),
  KEY `FK_vehiculo_categoria` (`categoria`),
  KEY `FK_vehiculo_ficha_tecnica` (`ficha_tecnica`),
  CONSTRAINT `FK_vehiculo_categoria` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_vehiculo_ficha_tecnica` FOREIGN KEY (`ficha_tecnica`) REFERENCES `ficha_tecnica` (`id_ficha_tecnica`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla alquilercoches.vehiculos: ~0 rows (aproximadamente)
DELETE FROM `vehiculos`;
/*!40000 ALTER TABLE `vehiculos` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehiculos` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
