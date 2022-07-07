-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.8.3-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para newplast_web
DROP DATABASE IF EXISTS `newplast_web`;
CREATE DATABASE IF NOT EXISTS `newplast_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `newplast_web`;

-- Volcando estructura para tabla newplast_web.punto_acopio
DROP TABLE IF EXISTS `punto_acopio`;
CREATE TABLE IF NOT EXISTS `punto_acopio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Representante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Contacto_email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Contacto_telefono` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Latitud` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Longitud` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.punto_acopio: ~4 rows (aproximadamente)
INSERT INTO `punto_acopio` (`id`, `Nombre`, `Representante`, `Contacto_email`, `Contacto_telefono`, `Latitud`, `Longitud`) VALUES
	(9, 'Colegio Luz de America', 'Hector', 'hc@gmail.com', '5615615', '-0.40376034325026555', '-79.30039995631406'),
	(10, 'Estadio Luz de America', 'Selena', 'selena@gmail.com', '0968175780', '-0.403368750448007', '-79.29701500853727'),
	(11, 'Comercial', 'Joan', 'joan@gmail.com', '515541', '-0.40570489626941675', '-79.30230968913267'),
	(14, 'Patronato Provincial', 'Juanito Perez', 'jperez@gmail.com', '12966321', '-0.40459717164116216', '-79.29236405810545');

-- Volcando estructura para tabla newplast_web.registro_botellas
DROP TABLE IF EXISTS `registro_botellas`;
CREATE TABLE IF NOT EXISTS `registro_botellas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL DEFAULT 0,
  `pto_acopio` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL,
  `control` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cont_registro_usuario` (`usuario`),
  KEY `FK_cont_registro_puntoacopio` (`pto_acopio`),
  CONSTRAINT `FK_cont_registro_puntoacopio` FOREIGN KEY (`pto_acopio`) REFERENCES `punto_acopio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cont_registro_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.registro_botellas: ~5 rows (aproximadamente)
INSERT INTO `registro_botellas` (`id`, `usuario`, `pto_acopio`, `fecha`, `control`) VALUES
	(8, 2, 10, '2022-04-01', 'Verificado'),
	(9, 2, 11, '2022-04-08', 'Verificado'),
	(11, 4, 9, '2022-04-21', 'Verificado'),
	(12, 3, 11, '2022-03-11', 'Verificado'),
	(14, 4, 9, '2022-06-16', 'No verificado');

-- Volcando estructura para tabla newplast_web.registro_promocion
DROP TABLE IF EXISTS `registro_promocion`;
CREATE TABLE IF NOT EXISTS `registro_promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_promocion` varchar(255) NOT NULL,
  `responsable_promocion` varchar(255) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `puntos_recolectar` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.registro_promocion: ~1 rows (aproximadamente)
INSERT INTO `registro_promocion` (`id`, `nombre_promocion`, `responsable_promocion`, `fecha_inicio`, `fecha_fin`, `puntos_recolectar`) VALUES
	(1, 'Dulces dos por uno', 'Coca Cola', '2022-06-29', '2022-07-01', 5);

-- Volcando estructura para tabla newplast_web.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) COLLATE utf8mb3_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb3_spanish_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8mb3_spanish_ci NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Volcando datos para la tabla newplast_web.usuarios: ~4 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `tipo_usuario`) VALUES
	(2, 'usuario', '0c7540eb7e65b553ec1ba6b20de79608', 'Administrador WEB', 2),
	(3, 'administrador', '91f5167c34c400758115c2a6826ec2e3', 'Jose', 1),
	(4, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Usuario Estandar', 1),
	(5, 'administrador', '91f5167c34c400758115c2a6826ec2e3', 'DBA', 3);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
