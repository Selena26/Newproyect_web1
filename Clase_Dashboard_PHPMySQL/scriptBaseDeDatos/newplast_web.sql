-- --------------------------------------------------------
-- Host:                         10.3.10.238
-- Versión del servidor:         10.4.21-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Volcando estructura para tabla newplast_web.admin_profile
CREATE TABLE IF NOT EXISTS `admin_profile` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `rol` varchar(10) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.admin_profile: ~3 rows (aproximadamente)
DELETE FROM `admin_profile`;
/*!40000 ALTER TABLE `admin_profile` DISABLE KEYS */;
INSERT INTO `admin_profile` (`id`, `full_name`, `email`, `mobile`, `address`, `password`, `status`, `rol`, `created_at`) VALUES
	(10, 'Super Admin', 'superadmin@gmail.com', '1234567890', 'Noida', '0192023a7bbd73250516f069df18b500', 1, 'Administra', '2020-06-17 13:38:43.432266'),
	(11, 'Test admin', 'testadmin@gmail.com', '1234567890', 'New Delhi', '0192023a7bbd73250516f069df18b500', 1, 'Administra', '2020-06-17 13:39:14.874271'),
	(12, 'temp admin', 'tempadmin@gmail.com', '12', 'Noida', '0192023a7bbd73250516f069df18b500', 1, 'Reciclador', '2020-06-17 13:39:52.830541'),
	(14, 'hector', 'hc@gmail.com', '123456', 'Las maravillas', '0192023a7bbd73250516f069df18b500', 1, 'Administra', '2022-04-13 11:48:13.399596');
/*!40000 ALTER TABLE `admin_profile` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT 0,
  `category_name` varchar(255) NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `header_menu` int(10) NOT NULL,
  `footer_menu` int(10) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.categories: ~6 rows (aproximadamente)
DELETE FROM `categories`;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `parent_id`, `category_name`, `menu_link`, `header_menu`, `footer_menu`, `description`) VALUES
	(63, 64, 'second', '', 1, 0, ' off\r\n   \r\nda'),
	(64, 63, 'first-chid', '', 1, 0, ' \r\n  '),
	(65, 0, 'first', 'first', 1, 0, ''),
	(66, 0, 'first child 1', '', 1, 0, ' \r\n   \r\n   \r\n  '),
	(67, 65, 'first cat', 'first-cat', 1, 1, ' \r\n  '),
	(68, 0, 'k', 'mm', 1, 0, ' \r\n  ');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.color_setting
CREATE TABLE IF NOT EXISTS `color_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `navbar_background` varchar(255) NOT NULL,
  `sidebar_background` varchar(255) NOT NULL,
  `text_color` varchar(255) NOT NULL,
  `save_button_color` varchar(255) NOT NULL,
  `edit_button_color` varchar(255) NOT NULL,
  `delete_button_color` varchar(255) NOT NULL,
  `view_button_color` varchar(255) NOT NULL,
  `label_text_color` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.color_setting: ~0 rows (aproximadamente)
DELETE FROM `color_setting`;
/*!40000 ALTER TABLE `color_setting` DISABLE KEYS */;
INSERT INTO `color_setting` (`id`, `navbar_background`, `sidebar_background`, `text_color`, `save_button_color`, `edit_button_color`, `delete_button_color`, `view_button_color`, `label_text_color`) VALUES
	(1, '#343a40', '#212529 ', '#dad7d7', '#007bff', '#11ac2b', '#c60c0c', '#6c6a6a', '#434242');
/*!40000 ALTER TABLE `color_setting` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.contacts: ~0 rows (aproximadamente)
DELETE FROM `contacts`;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.contact_details
CREATE TABLE IF NOT EXISTS `contact_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `google_map` text NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `google_plus` varchar(255) NOT NULL,
  `twitter` varchar(255) NOT NULL,
  `linkedin` varchar(255) NOT NULL,
  `youtube` varchar(255) NOT NULL,
  `instagram` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.contact_details: ~0 rows (aproximadamente)
DELETE FROM `contact_details`;
/*!40000 ALTER TABLE `contact_details` DISABLE KEYS */;
INSERT INTO `contact_details` (`id`, `email`, `mobile`, `address`, `google_map`, `facebook`, `google_plus`, `twitter`, `linkedin`, `youtube`, `instagram`) VALUES
	(1, 'youremailaddress@gmail.com', '1234567890', 'Noida, Uttar Pradesh, India', 'Enter You Google Map Code', '', '', '', '', '', '');
/*!40000 ALTER TABLE `contact_details` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.contact_email
CREATE TABLE IF NOT EXISTS `contact_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.contact_email: ~1 rows (aproximadamente)
DELETE FROM `contact_email`;
/*!40000 ALTER TABLE `contact_email` DISABLE KEYS */;
INSERT INTO `contact_email` (`id`, `email`) VALUES
	(10, 'superadmin@gmail.com');
/*!40000 ALTER TABLE `contact_email` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.contact_form_email
CREATE TABLE IF NOT EXISTS `contact_form_email` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.contact_form_email: ~0 rows (aproximadamente)
DELETE FROM `contact_form_email`;
/*!40000 ALTER TABLE `contact_form_email` DISABLE KEYS */;
INSERT INTO `contact_form_email` (`id`, `email`) VALUES
	(1, 'youremail@gmail.com');
/*!40000 ALTER TABLE `contact_form_email` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.cont_registro
CREATE TABLE IF NOT EXISTS `cont_registro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) NOT NULL DEFAULT 0,
  `pto_acopio` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL,
  `control` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cont_registro_admin_profile` (`usuario`),
  KEY `FK_cont_registro_puntoacopio` (`pto_acopio`),
  CONSTRAINT `FK_cont_registro_admin_profile` FOREIGN KEY (`usuario`) REFERENCES `admin_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cont_registro_puntoacopio` FOREIGN KEY (`pto_acopio`) REFERENCES `punto_acopio` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.cont_registro: ~3 rows (aproximadamente)
DELETE FROM `cont_registro`;
/*!40000 ALTER TABLE `cont_registro` DISABLE KEYS */;
INSERT INTO `cont_registro` (`id`, `usuario`, `pto_acopio`, `fecha`, `control`) VALUES
	(8, 12, 10, '2022-04-01', 'Verificado'),
	(9, 10, 10, '2022-04-08', 'Verificado'),
	(11, 14, 9, '2022-04-21', 'Verificado');
/*!40000 ALTER TABLE `cont_registro` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.home_content
CREATE TABLE IF NOT EXISTS `home_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `content_section` varchar(255) NOT NULL,
  `first_title` varchar(255) NOT NULL,
  `second_title` varchar(255) NOT NULL,
  `description` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.home_content: ~2 rows (aproximadamente)
DELETE FROM `home_content`;
/*!40000 ALTER TABLE `home_content` DISABLE KEYS */;
INSERT INTO `home_content` (`id`, `content_section`, `first_title`, `second_title`, `description`) VALUES
	(2, 'About Downloader', 'sscczxc', 'adsaczxczxc', 'dsnadasnckc aksdjasdklj asdljdls asldjsdl '),
	(3, 'How to Download', 'dsds', 'dsds', '					\r\ndsds'),
	(5, 'Cómo descargar', 'jhh', 'jhgj', '									jhgjjg');
/*!40000 ALTER TABLE `home_content` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.punto_acopio
CREATE TABLE IF NOT EXISTS `punto_acopio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Representante` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Contacto_email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Contacto_telefono` varchar(50) CHARACTER SET latin1 NOT NULL,
  `Latitud` varchar(255) CHARACTER SET latin1 NOT NULL,
  `Longitud` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.punto_acopio: ~3 rows (aproximadamente)
DELETE FROM `punto_acopio`;
/*!40000 ALTER TABLE `punto_acopio` DISABLE KEYS */;
INSERT INTO `punto_acopio` (`id`, `Nombre`, `Representante`, `Contacto_email`, `Contacto_telefono`, `Latitud`, `Longitud`) VALUES
	(9, 'Colegio Luz de America', 'Hector', 'hc@gmail.com', '5615615', '-0.40376034325026555', '-79.30039995631406'),
	(10, 'Estadio Luz de America', 'Selena', 'selena@gmail.com', '0968175780', '-0.403368750448007', '-79.29701500853727'),
	(15, 'Comercial', 'Wilmer', 'idolo@gmail.com', '0954561581', '-0.4057129426947201', '-79.3023150535507');
/*!40000 ALTER TABLE `punto_acopio` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.theme_setting
CREATE TABLE IF NOT EXISTS `theme_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `header_background` varchar(255) NOT NULL,
  `footer_background` varchar(255) NOT NULL,
  `downloader_box_background` varchar(255) NOT NULL,
  `downloader_box_button` varchar(255) NOT NULL,
  `first_title` varchar(255) NOT NULL,
  `second_title` varchar(255) NOT NULL,
  `third_title` varchar(255) NOT NULL,
  `footer_menu_link` varchar(255) NOT NULL,
  `header_menu_link` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `paragraph` varchar(255) NOT NULL,
  `logo_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.theme_setting: ~0 rows (aproximadamente)
DELETE FROM `theme_setting`;
/*!40000 ALTER TABLE `theme_setting` DISABLE KEYS */;
INSERT INTO `theme_setting` (`id`, `header_background`, `footer_background`, `downloader_box_background`, `downloader_box_button`, `first_title`, `second_title`, `third_title`, `footer_menu_link`, `header_menu_link`, `icon`, `paragraph`, `logo_name`) VALUES
	(1, '#0a570d', '#c2c52b', '#a61c1c', '#8a7575', '#d53030', '#4d1f1f', '#1917a6', '#75c5c7', '#6ff316', '#4f24eb', '#ff0000', '#f50000');
/*!40000 ALTER TABLE `theme_setting` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla newplast_web.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `usuario`, `password`, `nombre`, `tipo_usuario`) VALUES
	(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Administrador Web', 1),
	(2, 'usuario', 'b665e217b51994789b02b1838e730d6b93baa30f', 'Usuario Estandar', 2);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

-- Volcando estructura para tabla newplast_web.website_setting
CREATE TABLE IF NOT EXISTS `website_setting` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `website_title` varchar(255) NOT NULL,
  `website_name` varchar(255) NOT NULL,
  `visible_website_name` int(10) NOT NULL DEFAULT 0,
  `website_logo` varchar(255) NOT NULL,
  `website_favicon` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `google_varification_code` text NOT NULL,
  `google_analytics_code` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla newplast_web.website_setting: ~0 rows (aproximadamente)
DELETE FROM `website_setting`;
/*!40000 ALTER TABLE `website_setting` DISABLE KEYS */;
INSERT INTO `website_setting` (`id`, `website_title`, `website_name`, `visible_website_name`, `website_logo`, `website_favicon`, `meta_keyword`, `meta_description`, `google_varification_code`, `google_analytics_code`) VALUES
	(1, 'dd', 'dd', 0, 'codingstatus-logo.jpg', 'codingstatus-icon.jpg', 'dd', 'dd', 'dd', 'dd');
/*!40000 ALTER TABLE `website_setting` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
