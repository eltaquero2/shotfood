-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.41 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para shotfood
CREATE DATABASE IF NOT EXISTS `shotfood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `shotfood`;

-- Volcando estructura para tabla shotfood.dietas
CREATE TABLE IF NOT EXISTS `dietas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo` int NOT NULL,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo de dieta` (`id_tipo`),
  CONSTRAINT `tipo de dieta` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.dieta_usuario
CREATE TABLE IF NOT EXISTS `dieta_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dieta` int DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__dietas` (`id_dieta`),
  KEY `FK__usuario` (`id_usuario`),
  CONSTRAINT `FK__dietas` FOREIGN KEY (`id_dieta`) REFERENCES `dietas` (`id`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.like
CREATE TABLE IF NOT EXISTS `like` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_publicacion` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `like publicacion` (`id_publicacion`),
  KEY `like usuario` (`id_usuario`),
  CONSTRAINT `like publicacion` FOREIGN KEY (`id_publicacion`) REFERENCES `publicacion` (`id`),
  CONSTRAINT `like usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.nutrientes
CREATE TABLE IF NOT EXISTS `nutrientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.nutrientes_usuario
CREATE TABLE IF NOT EXISTS `nutrientes_usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuaio` int DEFAULT NULL,
  `id_nutriente` int DEFAULT NULL,
  `objetivo` int DEFAULT NULL,
  `seguimiento` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usr` (`id_usuaio`),
  KEY `FK__nutrientes` (`id_nutriente`),
  CONSTRAINT `FK__nutrientes` FOREIGN KEY (`id_nutriente`) REFERENCES `nutrientes` (`id`),
  CONSTRAINT `usr` FOREIGN KEY (`id_usuaio`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.publicacion
CREATE TABLE IF NOT EXISTS `publicacion` (
  `id` int NOT NULL,
  `id_usuario` int DEFAULT NULL,
  `likes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario que publica` (`id_usuario`),
  CONSTRAINT `usuario que publica` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.receta
CREATE TABLE IF NOT EXISTS `receta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo` int DEFAULT NULL,
  `nombre` int DEFAULT NULL,
  `ingredientes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_receta_tipo` (`id_tipo`),
  CONSTRAINT `FK_receta_tipo` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.receta_dieta
CREATE TABLE IF NOT EXISTS `receta_dieta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dieta` int DEFAULT NULL,
  `id_receta` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dietas` (`id_dieta`),
  KEY `FK_receta_dieta_receta` (`id_receta`),
  CONSTRAINT `dietas` FOREIGN KEY (`id_dieta`) REFERENCES `dietas` (`id`),
  CONSTRAINT `FK_receta_dieta_receta` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.tipo
CREATE TABLE IF NOT EXISTS `tipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla shotfood.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `contraseña` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `correo electronico` varchar(50) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- La exportación de datos fue deseleccionada.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
