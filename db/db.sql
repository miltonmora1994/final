-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para db
CREATE DATABASE IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `db`;

-- Volcando estructura para tabla db.asistencias
CREATE TABLE IF NOT EXISTS `asistencias` (
  `id_asistencia` int(11) NOT NULL AUTO_INCREMENT,
  `estudiante_id` int(11) NOT NULL,
  `sesion_id` int(11) NOT NULL,
  `estudiante_asistencia` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id_asistencia`),
  KEY `estudiante_id_idx` (`estudiante_id`),
  KEY `asistencia_id_idx` (`sesion_id`),
  CONSTRAINT `estudiante_id` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sesion_id` FOREIGN KEY (`sesion_id`) REFERENCES `sesiones` (`id_sesion`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db.asistencias: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `asistencias` DISABLE KEYS */;
REPLACE INTO `asistencias` (`id_asistencia`, `estudiante_id`, `sesion_id`, `estudiante_asistencia`) VALUES
	(11, 9, 2, 1),
	(18, 14, 4, 1),
	(19, 1, 1, 1),
	(20, 6, 1, 1);
/*!40000 ALTER TABLE `asistencias` ENABLE KEYS */;

-- Volcando estructura para tabla db.espacios
CREATE TABLE IF NOT EXISTS `espacios` (
  `id_espacio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_espacio` varchar(45) NOT NULL,
  `semestre_espacio` int(11) NOT NULL,
  PRIMARY KEY (`id_espacio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db.espacios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `espacios` DISABLE KEYS */;
REPLACE INTO `espacios` (`id_espacio`, `nombre_espacio`, `semestre_espacio`) VALUES
	(1, 'bases de datos 2', 4),
	(3, 'inteligencias artificial', 1),
	(5, 'ia', 3),
	(7, 'test', 6);
/*!40000 ALTER TABLE `espacios` ENABLE KEYS */;

-- Volcando estructura para tabla db.estudiantes
CREATE TABLE IF NOT EXISTS `estudiantes` (
  `id_estudiante` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion_estudiante` varchar(45) NOT NULL,
  `nombres_estudiante` varchar(45) NOT NULL,
  `apellidos_estudiante` varchar(45) NOT NULL,
  `telefono_estudiante` int(11) NOT NULL,
  `email_estudiante` varchar(45) NOT NULL,
  `semestre_estudiante` int(11) NOT NULL,
  PRIMARY KEY (`id_estudiante`),
  UNIQUE KEY `identificacion_estudiante_UNIQUE` (`identificacion_estudiante`),
  UNIQUE KEY `email_estudiante_UNIQUE` (`email_estudiante`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db.estudiantes: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
REPLACE INTO `estudiantes` (`id_estudiante`, `identificacion_estudiante`, `nombres_estudiante`, `apellidos_estudiante`, `telefono_estudiante`, `email_estudiante`, `semestre_estudiante`) VALUES
	(1, '123', 'pepito', 'perez', 1213123890, 'pepe@gmail', 4),
	(6, '1234', 'luis', 'guzman', 1234567890, 'luis@mail.com', 4),
	(8, '1', 'adriana', 'lopez', 1000000001, 'adriana@mail.com', 1),
	(9, '2', 'amelia', 'ortiz', 1000000002, 'amelia@mail.com', 1),
	(13, 'hexa', 'pepito', 'hexagonal', 1213123899, 'hexagonal@gmail', 4),
	(14, 'nuevo', 'nuevo', 'nuevo', 1213123844, 'nuevo@gmail', 3),
	(15, '12356', 'prueba', 'prueba', 1000000020, 'preuba@gmail.com', 2);
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;

-- Volcando estructura para tabla db.sesiones
CREATE TABLE IF NOT EXISTS `sesiones` (
  `id_sesion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_sesion` date NOT NULL,
  `hora_inicio_sesion` time NOT NULL,
  `hora_fin_sesion` time NOT NULL,
  `espacio_id` int(11) NOT NULL,
  PRIMARY KEY (`id_sesion`),
  KEY `espacio_id_idx` (`espacio_id`),
  CONSTRAINT `espacio_id` FOREIGN KEY (`espacio_id`) REFERENCES `espacios` (`id_espacio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla db.sesiones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `sesiones` DISABLE KEYS */;
REPLACE INTO `sesiones` (`id_sesion`, `fecha_sesion`, `hora_inicio_sesion`, `hora_fin_sesion`, `espacio_id`) VALUES
	(1, '2021-04-29', '03:20:00', '04:20:00', 1),
	(2, '2021-04-30', '13:57:00', '14:57:00', 3),
	(4, '2021-05-01', '11:34:00', '11:35:00', 5);
/*!40000 ALTER TABLE `sesiones` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
