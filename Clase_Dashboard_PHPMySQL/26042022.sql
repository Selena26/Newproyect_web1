-- --------------------------------------------------------
-- Host:                         127.0.0.1
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


-- Volcando estructura de base de datos para newplast_web
CREATE DATABASE IF NOT EXISTS `newplast_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `newplast_web`;

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
  CONSTRAINT `FK_cont_registro_usuario` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_cont_registro_puntoacopio` FOREIGN KEY (`pto_acopio`) REFERENCES `punto_acopio` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.cont_registro: ~4 rows (aproximadamente)
DELETE FROM `cont_registro`;
/*!40000 ALTER TABLE `cont_registro` DISABLE KEYS */;
INSERT INTO `cont_registro` (`id`, `usuario`, `pto_acopio`, `fecha`, `control`) VALUES
	(8, 2, 10, '2022-04-01', 'Verificado'),
	(9, 2, 11, '2022-04-08', 'Verificado'),
	(11, 2, 9, '2022-04-21', 'Verificado'),
	(12, 2, 11, '2022-03-11', 'Verificado');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla newplast_web.punto_acopio: ~3 rows (aproximadamente)
DELETE FROM `punto_acopio`;
/*!40000 ALTER TABLE `punto_acopio` DISABLE KEYS */;
INSERT INTO `punto_acopio` (`id`, `Nombre`, `Representante`, `Contacto_email`, `Contacto_telefono`, `Latitud`, `Longitud`) VALUES
	(9, 'Colegio Luz de America', 'Hector', 'hc@gmail.com', '5615615', '-0.40376034325026555', '-79.30039995631406'),
	(10, 'Estadio Luz de America', 'Selena', 'selena@gmail.com', '0968175780', '-0.403368750448007', '-79.29701500853727'),
	(11, 'Comercial', 'Joan', 'joan@gmail.com', '515541', '-0.40570489626941675', '-79.30230968913267');
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
	(2, 'usuario', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Usuario Estandar', 2);
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

CREATE TABLE `marca_botellas` (
  `id` int(11) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL,
  `representacion_fisica` int(11) NOT NULL,
  `foto` longblob NOT NULL,
  `puntos_promocion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_botellas`
--

INSERT INTO `marca_botellas` (`id`, `nombre_marca`, `representacion_fisica`, `foto`, `puntos_promocion`) VALUES
(2, 'Guiti', 12, 0xffd8ffe000104a46494600010100000100010000ffdb0084000a0708151515181616161819181a1a18191c1a181818181a19191c191a1c18181a1a1c212e251c1e2b1f19182638262b2f313535351a243b403b343f2e343531010c0c0c100f101e12121f352c24243434343434343434353434343434313434343434343431343134343434343434343434343434343435343434313434343434ffc0001108017f008403012200021101031101ffc4001b00000105010100000000000000000000000003040506070102ffc4004a1000010302030406060509060505000000010002110321041231054151610622718191a107133272b1c14262b2d1f0142324337392a2c2e13452748283f1356393c3d21516254353ffc400190101010101010100000000000000000000000102030405ffc4002911010100020103030206030000000000000001021103122141043151618113227191a1f032b1e1ffda000c03010002110311003f00d9908420108420108420e2144748b6cb70b4f39199c4c35b312609b9e100aa2d6e99629c6ce6b0706b47f34ae3c9cd8e1dab58e36b5142cef676dbc43a66ab8d9c6e06b13c1294fa5b5da7ad95e378220f88d3c1719eb30be2b5f859340428dd8db59b8866668208b39a771edde1492f5e394ca6e31669d4210aa042108042108042108042108042108289e929fd5a23eb38f8363e6a8546a367daf00ae9e93312dcd4d8002e01ce33a00600ed9836e4a80dc6102274bd9823ed4af0f371dcb2b63b6394916ed954c38d8bbd971b3647b3266e9a5412e81f77c5466036954198b33886126e475743f1d17966d07b88bfef32de21d3e4bcd7d367e2c6e671a1740cfeb3fcbf3572543e8062c173e99b3b28238380b12381b89078abe2fa3c18dc7092b8657776ea1085d99084210084210084210084210084210557a65b2d8f61a8402440d2faeef13e2aa14763b4827246edc0c1d7f1cd681d2377e6c378b8795d57982cb364ab29860f63087820de9ba222fd6698f22983362e52619aea4dc8dfdba81a2b4537c77b63c51c54e886e95e86ecf67ab6d603ac644c412418320e9a68ad6a2760598e6f0713e3752cb5102108540842100842100842100842100842e20af7486a4b837809f1516d164bed1a99dee3ce3c124f31946f2d9f1263e4a557a8d3b92b0b983a80bc8fa8ff00261fb9749d11123b15d0e2388054e2ae605d95ed3dcac6a8108420108420108420108420108420135da15b2b1c795bb53a505d22af66b3bcfc90413cc94be2dc3d60faad60f06b67ce5214b527700bc059aa7580bd5238b5e07ee392a527b25bf9d1eebfec14b35aac47aa6eb03c2eacb45f99a0f10ab5486e533b26a4b4b7815448a10840210840210840210840210841c255276c6333547469a0ec0ad5b5711929b8ef881deb3eaef92a5a1f36a1c862093331b80feb0122e7bb92569b32e1dee24cb9cc637bbacef83531f5eee3e414d899d9354fe50d077b88f8ae1c4384c7984cb665677aea77fa6df884962c90f70249873879a6c48b71aefabdf64ff65ed101e018136b1917f82ad113094a0fcae078157634a426bb3eb676029d2a042108042108042108042179718082b1d2bc55dac1bae55677a90da154d4a8e77136ec1a245b873aacdaaf3897f518ce00b8f6b8fdc026a4274f6584ea9b90a05304e8a8c3c1edf884aed06fe79fefbfed14d458ca738dae1f51ef160e7123c510942f4e6af29576e5a163e8be2a4169ee564548d995323d8edc4c1f157506551e908420108420108420131daf5b25279df103b4d827ca176dbb316b777b47e5f8e482170985b25cd184edadb4208534213134ac98382b056a4a17134e0a9629b1086af4425f194323801a16b1dfbcc07e25408a59cdeaa45285dd5f05a42d9ac15d765d6cf4da77c42a3b7d907b47788f910acdd19af2d2ce174827d0842a042108042108050958e6a8e770b0ee52d59d95a4f00543d116f341d2174b57a5d4433737728ac6d3b299aac4cb10c952aa00a7db57da61ff00974fec04d2a360c275b54da97ecdbf170522a3dc57b1ecf8245ce5e9aeea95439a26c47ba7bae0ff002f8297e8fd5cb500e3650545c330e6d3e3048f3013dc0d4caf69e61488d010bc30c80792f6b4042108042108196d3775238903eff24cd812bb49fd668e009f924420f52b80ae4ae4aa8eb8261575214838a655daa2a0b1d6bae6d2a9d4a278b34ec7bc04e368d3ea9f14cb689ea513f51c3bc547c8f3f358531a8e435fd53dc90a850d7f57c103c6be031dc0a70c7414d186693b8b5c0f73847c40f15ca55343f89de98d5ad2b6655cd4da79278a17a335b3528e04a9a5b642108402108410f8abd477280878b2f2e3d671fac576541e5a105abd35abde68542445d2555a9402e4aeb8084443e2592d2a0714e74341d1b205b74927b6e559aa8d544ed56014d9ef3fe2d3f32b362a0aaa4de21b096a81275b5014f0a5f047aaf6f16798208f9a4b0a6c7b7f1f04eb02592d04438103de0e3067b014de988711f8d56676abe173e86d4b3dbd855a552fa24f8a84710ae8ba4642108540b8575797685043b343da7e2bad0b941bd5ef3f12bdb58aa3d06af2f0976b578a81022058f72f0966e8eee48a063505d466d56f51bef3e7f86fe6a55e2ea236abfaad1f59ff00cbf72cd588670ba49b48b8936ef29623ce7c9264000ef9859aae384385f9d92957db3dfe1aa406a9c3d9d61cc03e4163cc5f09ce8cbe2ab7bd5ed50ba38dfceb7f1b95f5758c84210a8170aea1055311b7a8507bd951e416bb40d79b1123411bd34abd37c033daaae1fe9d43f06aacf4d6a35b8a7cb87d037207d10a9f8dc63002dca1c0c890466b88b18e72bcd79b3995c7c3a744d6da78f48fb387ff006bff00e954ff00c579a9e917679d2a3cff00a4f1f10165236c33752027707757d92d2608bba235b5b4d5719b55b9f37abb64c844b6e3387e53d58c9032444e5deba7e2567a6357a7d3fc010eebbf4b7e6df75e5bd38c1ff79ffb8ef92cce96358e76673091969da77b3517061aee013fa3b45803e69039ded7ea3aa6c5e05b4378e13bf7f3bcd94be098c68143a4987aa6185e4ee9611f1462708f80e81bc992081a4402ab7b036830b9ad0c0d0d8009201232e593689d0dbced176c43c060399bde46bd6e7cc5b92f0fa8f57c98e52637f8aeb8f1cd2b4e690ebc089b8ece1e4a3ea3c09d548d4c5344e9a9d1c240208807c0cf24cdfb419af575bf5db701c5d06da1cd7ec1a2ce3eaf96cefafdaba4e2c7fb48b5f364e6a55008b920002fad804953da6c9d58dd74781a99b4f024c2f18cc6d32673b3b9edb40ed4beab97aa6bbfdab538b0d7fd59ba2551afab69b0255e967bd03aad756765735dd4dc41de382d097d4e2b96584b97bbc99c92ea3a8421756421084181fa50fedb53fc9f61aa86fc23dcd2f0c79609978638b446b2ed2caf7e940ce32ac7d51fc0d53987c532954a3860d3d6a672c680301d78cc1fc14192e0e8073da723ded0e697b58d2496c8cc241b48982ae34719b34635ce38671a46906e4f5766d4992e34c9b4b604ee37df2ac1d1bc1b2963f16d600d696517002c0669240e0267c536d95ff1bac7fe5bbe14c2a338c4d119dc18d706973b235cd39b2c9ca349365cfc9ded8963849812c7093b809172b59db97dad81f75df0aa9ef4ff00162953c3d570cc29e269be26272cbac6f06daa8322a78379bfab7f6e477dc976e09da0a6e9e0187ee5b2744fa5cdc73dec630b0536b5d25e5d3989111947029cf48ba52dc1b807b03810d20e778324bed0d63b40cd491aa5ba830c1827ba4b69bdc01896b1ce008d4481af2497a96ce521f9a7296e4139a632c66999b444adbbd1dd50fc3d57b4d9d5c9de2e28d169d40ded29af43f6731d8bc6624805e2b3a9b0903a83da791c0bb3b44f01cd4def5f55d323c46cda94db99f46b31a6d99f49ec693b802444f7af1485d6ef84da1471edc4d02c30c3eade1f041cc0e5223b2795b7ac57139df58b5c44839262006b2d27940953715a5fa221f9ca9ee0f8ad65657e89a886d4a90e0e1918410089049dc74b82b535aded97508420108420c0bd258fd32af6b3c7204ff1fb3ea54c4b1f4ea0a6fa74c9cc599e43cb9b104c714c3d2593f96549dc5a47ee3549e22bb9b8fa0d0486be9bf30117cb98b67949dc839d1ba4e663b14d7bcd470a7425e5ad6492091d56d8403090d963ff009aab1ffe4e9fe04ef62b87fea58c1372ca07b83003f11e29c6ccd8b559b4aae25c1beadcc2d69cd2497167d1dd01a75e4839b6bfe2b81e395fe192aaf5e94bfb233f683ec3d34da78b6bf6c615ad20e4058e8dce2caa48ee0f6a79e945bfa237f68dfb2e4bed4437a1efd6e27dca7f6de9e7a55f699d94ff00efcfc07826be87ff005b89fd9d3fb4ff00bd3bf4a62ec3fb3f3f5ff71f1533f1fa9129e8a09fc8dffe21f1d9eae97ce53ee867b78dff0014ff00b23e51e09a7a2bfec6efdb3fec313be865aa6386f18a77865007d92997f9459ed51db1367e36955c457c3fa8732b5524d379787834dcf65a21a26fbf82cdaab89af52d9492fb5ad6322dca56b5d0fc7bdf5b1945decd1aa32580f6cd473a78f59a75e2b29aac697d7797c3daf96016cc4bccf3b0e0b9fc6fe1af9695e88875ea7b8dfb4f5a9acb3d123897d52664b5b73c8b87e3b16a6bab0108420108420c0fd253a7155b93991dec13e6027f5fa4186631b5a5af7e48686c178cd04b49fa024099e1bec98fa463fa557ed60fe007e4a855e05a6795e07dfe4903ba7b72b3710712c710f24931a104dd841d5ba58f01c14b633a678da8d8cf90411d48613fe63d6fdd2156339dc63b2c80b5226cf29557b5e1ed7e478321cd7e57099982d33793e278a755f68d6a8dc8faf9dbc1efa8e13c466b03cd34753199e2346c8e47abf7a18c0d01ce124e83410379fb967b5549ec8c5d5a0e2ea5572388821af7341034cd9489fea549ed5c762312d1eb0d37416996d4639d60e0041a84c75ddbb7a85c2e29a0c3a931cdde20b5ddcf0641f14eb68d1631cd2c76663d81ed98ced049696540347b5cd70e620ef59d5ea92fdbe17c2636074a7118061a7eac161717f5dae04120031a4e837af5b0ba5e68632a552d26957702f6fd2699243db78b173846f05565b5dcdf65ce6fba48f82e3b153ed35aee7194f8b63ce56ee377b371b7e1f68e098c7e2293e94d48738b480fa8f0dea02dd4bafa46f58c3581f58dece7992384dc8ee4935e08218f2de2c7189e203858f780bdece7f5dbdb1de4103ccac5df7bf116356f4555cbdf549d219946e68bc01cac169cb2cf4463af57dd67c5cb525ad49eccba84210084210605e920fe9754731e6c6aa1576906e089b8ecdc5681e905c462eb585dc01900d831b6e533e4a898ca85c44fd101a3b068ae3b0d617a5c017a0174910f1fedd4f70ff2af1584863b7650def6d88f81ef5ea935ef790d66673c658682758f0d37a917ec9ad4e585ac78b17341d0f19205f982b330b3ec5ca7933c2d568896cc199b77833a88f352b8a69a6d6e605a5f4daf0ceab890e195ae793769ea97817b381b125234699a673368b4906ce71351a08bce5b03de1235def7b9cf7b8b9ee25ce738dc9e29d195bde6a7f29329aed4df14f0e71709bdefaf34dc94abc24885d3a75d8db8149e130a0b5ae73c3331860827341824c7b2d9b4f6f051a0293aad934e3434d80768243bf8f378ae59ef724ba74c74d3fd13bdc5f5675cad9b45e5d33cd6a2b2ff0044ee05f5b9869f372d4165908421008421060dd3f138bad71ed0d7dd6cfc9522ad2971579e9eb3f4cabef0fb21565b8592ba633cb195f8457e4dc93ed9db1df55d02cddee22c3ef3c94ae0f0acb6604b78e80f66f2ac54c000068803945be4b57293d924be51b4f673e931dea5cd60024b8b33d47c6f3b98358d624d9473316f221c649225ce1d6306624400accf01c6d631ed696eddea3ea6ce63c934dc0fbb113aeeb45c2d71e537f998e4c72b3b13c3163fe8e5e44cf7a6f89d923e8db803a1ef4e68e1dcc370a469304104799f8aed6fc3963b52f15832d304426cfa10ad989a0778b73833dffd54762703ae51e29a957af2880f569ce1eabc0ca0db5881626c609b89e49cbb0c46a214a6cbc0b5cd6c31a5d9bda73cc0d4e62d132006dc1035e76e59e13cbb619ed76f4483ad57dd67c5cb5159cfa3afd7d6bb0f55bfabf637d9bc6345a32f3e5eee9021085142e2eae20c33a70e0317567fbc3cda21565f5b38ca06875dfdbc95a3a738073f1355cc22735c1b6800b1548c41aec91948ec6831d85a98f2636eb7ec5c6a4b15b418c89739ef03d90440e6ee1f8b2ed2dbaf8cce80d11d5b837880249cc753a8f8aac972eb9e4ea49ed33daba444bd5dbf59cfcc1e5ac91d510465074d2ff34df0fb4aa530030e4037344dcea4e699379f842612ba15d2a6b0fb5eab206773ac7349cfac11132247f311b9483f6bbcc65ca1ed37cb25af1ce0db4dcab94ca5c95a974cdc655b70db47d7435ae6cc5c5b383c729d7ba468a3f1bb60d3aa58ea7d5117b871fac26c41dcabe5e41cc0c1e22df04ae2f683ea001ee0e2dd1d003a0fd1b448ed1297249848b351da387a8d80f14cee150401da6623b1c993718d9c8f05907e8b83d93fde1cbb2541e1f0af7fb0c73bdd693f052f85d8188312c0c1c5ce1f012572cbd46187be527dda9c3bf68d37d18c07d4020f55ba19e2b4859dfa34c10a4ea826496b64e9c740b445899ccff34f2bd3d3d9d4210a8170aeaf0fd0f620c93a503f49a93fdef11c940d665271b90dbf3040df7d0ebbb82d0b15458fcc1ed0e198ea262fbb8280c6f46293cf55ce61e4411e0ebf9af265c39755ca6aedd66735aaac3700c735dd7048cc6203a40780083d93e4947746981c41c844800e46de5ef6c993bb219e07c53eabd10a83d9a8d3ef34b7cc12916f47316d16ca4706bc89f1038acf4673c7ed4dcf932a9d1a6005d91900d41304039264f7e5747ba524ce8fd270072b04b4be0978218265e6044754d85f4b298a7b231edb863e74b5461e3f5beb3bc4af0ed9f8da6002c780248199840999d1c6c64db9958d724f9378fd0aecce89d1d5f4dae1ef3cd8c653ae843a4761561abd14c186cb70cc900ea1ced35b13c547ec5f5a1d35330e398f39f8c2b3e3aa3320875c89113cc4f2b82bc1cf972f5f699ebe9b74c7a75e157ffdbb87cd02851360e1d461064810246b263b442f6766d36010d6b445831ad6c7580bc6821cd29c3a49d795c9d3726efa24ad4c396fbe36feb6b52e33cc2ccc3d368199c6731060836cb6200e646f4db1204db4ddae8bacc39fc5be29734c02244fc3bb8f6adcf4bc99d9da4ff6bf8b8c97bed35d06690f798b103e2af2aa3d17273f72b72fadc78746323cb95dddba8421746424ea687b0a51275343d8505198feb3c6fcd3dc7fd9772caf18d058f6be5a5b25ae03db6e6bb4bb913befb93ea14c112aa1ab69984b31a52c42f6c64a071846d8f6287da2eeb1b9f153d53a8c1c4aafd7324a9486ac094c76e1c1a05bf1aaf4c092ae64a29b86ae0b7e2571ef831bcaf52a04de09d57a6b6c2fc6dc3f1294644dc5b96abdb29026c7c75534a9fe8bb4672792b5aae74629fb47942b1ad204210805e4e8bd21066fb7302e7d478617671b80919740081d896d89b45ed6faba80b5e3889ccde37d637a9bc7d2c988cd1ed8209ecb8fe65018d690e20ea0d8ef046f444db714d3ac03cb45df5cd1cd43b2a97300b4b67cfe5fd50dac79a6d52db56a39a435c47b2341c5449a80a52bd773face249e26e9b86a816160917b6538a2d2eb7894f9f4dad61204983737ff00654571f4ce7077007c4e9f35ef9a5721332baea480a4d0446f5d636e9202138a773db0a0b7747294539e254c26d81a7958d1c93954084210084210446dfc3973039bab0cf68de3c155768ddf2347007c75f357f226c55776b6c426eced038711d882af46a65772d13d7531323c387f45c3b26b033912156ad5a70c349ce3c790f895207a0f532c6f9949062654b6b3661e329e04e523b9ca42862586093d5f19e565438651ca037e91b93b804d6b6243a00d1d103eafd19ed327b253d65375776561ea9f68f107776715eaaf47aa31d9daecc778b788b58c591093f0b95bc49067993751e5d16252f5ea912dc97fac4b8f7c98f24d293fac24037d377822bc54e4a536161b3540234b9263c00dc9a62de5e61a2d686db7767356bd8782c8c922e47fb9f1412cba8420108420108420108420e26b8dc132a0870ef1623bd3b420a46dad8552006b43c0de63311c15759b2f145c1ada6d6e978f982b595e720e010466c1c01a4c19aee3a952a84208ec76cb654be878a674fa3ed1abbc829d4208ec36c9a6c32049e6a450840210840210841fffd9, 12),
(15, 'guiti3', 16, 0xffd8ffe000104a46494600010100000100010000ffdb0084000a0708151515181616161819181a1a18191c1a181818181a19191c191a1c18181a1a1c212e251c1e2b1f19182638262b2f313535351a243b403b343f2e343531010c0c0c100f101e12121f352c24243434343434343434353434343434313434343434343431343134343434343434343434343434343435343434313434343434ffc0001108017f008403012200021101031101ffc4001b00000105010100000000000000000000000003040506070102ffc4004a1000010302030406060509060505000000010002110321041231054151610622718191a107133272b1c14262b2d1f0142324337392a2c2e13452748283f1356393c3d21516254353ffc400190101010101010100000000000000000000000102030405ffc4002911010100020103030206030000000000000001021103122141043151618113227191a1f032b1e1ffda000c03010002110311003f00d9908420108420108420e2144748b6cb70b4f39199c4c35b312609b9e100aa2d6e99629c6ce6b0706b47f34ae3c9cd8e1dab58e36b5142cef676dbc43a66ab8d9c6e06b13c1294fa5b5da7ad95e378220f88d3c1719eb30be2b5f859340428dd8db59b8866668208b39a771edde1492f5e394ca6e31669d4210aa042108042108042108042108042108289e929fd5a23eb38f8363e6a8546a367daf00ae9e93312dcd4d8002e01ce33a00600ed9836e4a80dc6102274bd9823ed4af0f371dcb2b63b6394916ed954c38d8bbd971b3647b3266e9a5412e81f77c5466036954198b33886126e475743f1d17966d07b88bfef32de21d3e4bcd7d367e2c6e671a1740cfeb3fcbf3572543e8062c173e99b3b28238380b12381b89078abe2fa3c18dc7092b8657776ea1085d99084210084210084210084210084210557a65b2d8f61a8402440d2faeef13e2aa14763b4827246edc0c1d7f1cd681d2377e6c378b8795d57982cb364ab29860f63087820de9ba222fd6698f22983362e52619aea4dc8dfdba81a2b4537c77b63c51c54e886e95e86ecf67ab6d603ac644c412418320e9a68ad6a2760598e6f0713e3752cb5102108540842100842100842100842100842e20af7486a4b837809f1516d164bed1a99dee3ce3c124f31946f2d9f1263e4a557a8d3b92b0b983a80bc8fa8ff00261fb9749d11123b15d0e2388054e2ae605d95ed3dcac6a8108420108420108420108420108420135da15b2b1c795bb53a505d22af66b3bcfc90413cc94be2dc3d60faad60f06b67ce5214b527700bc059aa7580bd5238b5e07ee392a527b25bf9d1eebfec14b35aac47aa6eb03c2eacb45f99a0f10ab5486e533b26a4b4b7815448a10840210840210840210840210841c255276c6333547469a0ec0ad5b5711929b8ef881deb3eaef92a5a1f36a1c862093331b80feb0122e7bb92569b32e1dee24cb9cc637bbacef83531f5eee3e414d899d9354fe50d077b88f8ae1c4384c7984cb665677aea77fa6df884962c90f70249873879a6c48b71aefabdf64ff65ed101e018136b1917f82ad113094a0fcae078157634a426bb3eb676029d2a042108042108042108042179718082b1d2bc55dac1bae55677a90da154d4a8e77136ec1a245b873aacdaaf3897f518ce00b8f6b8fdc026a4274f6584ea9b90a05304e8a8c3c1edf884aed06fe79fefbfed14d458ca738dae1f51ef160e7123c510942f4e6af29576e5a163e8be2a4169ee564548d995323d8edc4c1f157506551e908420108420108420131daf5b25279df103b4d827ca176dbb316b777b47e5f8e482170985b25cd184edadb4208534213134ac98382b056a4a17134e0a9629b1086af4425f194323801a16b1dfbcc07e25408a59cdeaa45285dd5f05a42d9ac15d765d6cf4da77c42a3b7d907b47788f910acdd19af2d2ce174827d0842a042108042108050958e6a8e770b0ee52d59d95a4f00543d116f341d2174b57a5d4433737728ac6d3b299aac4cb10c952aa00a7db57da61ff00974fec04d2a360c275b54da97ecdbf170522a3dc57b1ecf8245ce5e9aeea95439a26c47ba7bae0ff002f8297e8fd5cb500e3650545c330e6d3e3048f3013dc0d4caf69e61488d010bc30c80792f6b4042108042108196d3775238903eff24cd812bb49fd668e009f924420f52b80ae4ae4aa8eb8261575214838a655daa2a0b1d6bae6d2a9d4a278b34ec7bc04e368d3ea9f14cb689ea513f51c3bc547c8f3f358531a8e435fd53dc90a850d7f57c103c6be031dc0a70c7414d186693b8b5c0f73847c40f15ca55343f89de98d5ad2b6655cd4da79278a17a335b3528e04a9a5b642108402108410f8abd477280878b2f2e3d671fac576541e5a105abd35abde68542445d2555a9402e4aeb8084443e2592d2a0714e74341d1b205b74927b6e559aa8d544ed56014d9ef3fe2d3f32b362a0aaa4de21b096a81275b5014f0a5f047aaf6f16798208f9a4b0a6c7b7f1f04eb02592d04438103de0e3067b014de988711f8d56676abe173e86d4b3dbd855a552fa24f8a84710ae8ba4642108540b8575797685043b343da7e2bad0b941bd5ef3f12bdb58aa3d06af2f0976b578a81022058f72f0966e8eee48a063505d466d56f51bef3e7f86fe6a55e2ea236abfaad1f59ff00cbf72cd588670ba49b48b8936ef29623ce7c9264000ef9859aae384385f9d92957db3dfe1aa406a9c3d9d61cc03e4163cc5f09ce8cbe2ab7bd5ed50ba38dfceb7f1b95f5758c84210a8170aea1055311b7a8507bd951e416bb40d79b1123411bd34abd37c033daaae1fe9d43f06aacf4d6a35b8a7cb87d037207d10a9f8dc63002dca1c0c890466b88b18e72bcd79b3995c7c3a744d6da78f48fb387ff006bff00e954ff00c579a9e917679d2a3cff00a4f1f10165236c33752027707757d92d2608bba235b5b4d5719b55b9f37abb64c844b6e3387e53d58c9032444e5deba7e2567a6357a7d3fc010eebbf4b7e6df75e5bd38c1ff79ffb8ef92cce96358e76673091969da77b3517061aee013fa3b45803e69039ded7ea3aa6c5e05b4378e13bf7f3bcd94be098c68143a4987aa6185e4ee9611f1462708f80e81bc992081a4402ab7b036830b9ad0c0d0d8009201232e593689d0dbced176c43c060399bde46bd6e7cc5b92f0fa8f57c98e52637f8aeb8f1cd2b4e690ebc089b8ece1e4a3ea3c09d548d4c5344e9a9d1c240208807c0cf24cdfb419af575bf5db701c5d06da1cd7ec1a2ce3eaf96cefafdaba4e2c7fb48b5f364e6a55008b920002fad804953da6c9d58dd74781a99b4f024c2f18cc6d32673b3b9edb40ed4beab97aa6bbfdab538b0d7fd59ba2551afab69b0255e967bd03aad756765735dd4dc41de382d097d4e2b96584b97bbc99c92ea3a8421756421084181fa50fedb53fc9f61aa86fc23dcd2f0c79609978638b446b2ed2caf7e940ce32ac7d51fc0d53987c532954a3860d3d6a672c680301d78cc1fc14192e0e8073da723ded0e697b58d2496c8cc241b48982ae34719b34635ce38671a46906e4f5766d4992e34c9b4b604ee37df2ac1d1bc1b2963f16d600d696517002c0669240e0267c536d95ff1bac7fe5bbe14c2a338c4d119dc18d706973b235cd39b2c9ca349365cfc9ded8963849812c7093b809172b59db97dad81f75df0aa9ef4ff00162953c3d570cc29e269be26272cbac6f06daa8322a78379bfab7f6e477dc976e09da0a6e9e0187ee5b2744fa5cdc73dec630b0536b5d25e5d3989111947029cf48ba52dc1b807b03810d20e778324bed0d63b40cd491aa5ba830c1827ba4b69bdc01896b1ce008d4481af2497a96ce521f9a7296e4139a632c66999b444adbbd1dd50fc3d57b4d9d5c9de2e28d169d40ded29af43f6731d8bc6624805e2b3a9b0903a83da791c0bb3b44f01cd4def5f55d323c46cda94db99f46b31a6d99f49ec693b802444f7af1485d6ef84da1471edc4d02c30c3eade1f041cc0e5223b2795b7ac57139df58b5c44839262006b2d27940953715a5fa221f9ca9ee0f8ad65657e89a886d4a90e0e1918410089049dc74b82b535aded97508420108420c0bd258fd32af6b3c7204ff1fb3ea54c4b1f4ea0a6fa74c9cc599e43cb9b104c714c3d2593f96549dc5a47ee3549e22bb9b8fa0d0486be9bf30117cb98b67949dc839d1ba4e663b14d7bcd470a7425e5ad6492091d56d8403090d963ff009aab1ffe4e9fe04ef62b87fea58c1372ca07b83003f11e29c6ccd8b559b4aae25c1beadcc2d69cd2497167d1dd01a75e4839b6bfe2b81e395fe192aaf5e94bfb233f683ec3d34da78b6bf6c615ad20e4058e8dce2caa48ee0f6a79e945bfa237f68dfb2e4bed4437a1efd6e27dca7f6de9e7a55f699d94ff00efcfc07826be87ff005b89fd9d3fb4ff00bd3bf4a62ec3fb3f3f5ff71f1533f1fa9129e8a09fc8dffe21f1d9eae97ce53ee867b78dff0014ff00b23e51e09a7a2bfec6efdb3fec313be865aa6386f18a77865007d92997f9459ed51db1367e36955c457c3fa8732b5524d379787834dcf65a21a26fbf82cdaab89af52d9492fb5ad6322dca56b5d0fc7bdf5b1945decd1aa32580f6cd473a78f59a75e2b29aac697d7797c3daf96016cc4bccf3b0e0b9fc6fe1af9695e88875ea7b8dfb4f5a9acb3d123897d52664b5b73c8b87e3b16a6bab0108420108420c0fd253a7155b93991dec13e6027f5fa4186631b5a5af7e48686c178cd04b49fa024099e1bec98fa463fa557ed60fe007e4a855e05a6795e07dfe4903ba7b72b3710712c710f24931a104dd841d5ba58f01c14b633a678da8d8cf90411d48613fe63d6fdd2156339dc63b2c80b5226cf29557b5e1ed7e478321cd7e57099982d33793e278a755f68d6a8dc8faf9dbc1efa8e13c466b03cd34753199e2346c8e47abf7a18c0d01ce124e83410379fb967b5549ec8c5d5a0e2ea5572388821af7341034cd9489fea549ed5c762312d1eb0d37416996d4639d60e0041a84c75ddbb7a85c2e29a0c3a931cdde20b5ddcf0641f14eb68d1631cd2c76663d81ed98ced049696540347b5cd70e620ef59d5ea92fdbe17c2636074a7118061a7eac161717f5dae04120031a4e837af5b0ba5e68632a552d26957702f6fd2699243db78b173846f05565b5dcdf65ce6fba48f82e3b153ed35aee7194f8b63ce56ee377b371b7e1f68e098c7e2293e94d48738b480fa8f0dea02dd4bafa46f58c3581f58dece7992384dc8ee4935e08218f2de2c7189e203858f780bdece7f5dbdb1de4103ccac5df7bf116356f4555cbdf549d219946e68bc01cac169cb2cf4463af57dd67c5cb525ad49eccba84210084210605e920fe9754731e6c6aa1576906e089b8ecdc5681e905c462eb585dc01900d831b6e533e4a898ca85c44fd101a3b068ae3b0d617a5c017a0174910f1fedd4f70ff2af1584863b7650def6d88f81ef5ea935ef790d66673c658682758f0d37a917ec9ad4e585ac78b17341d0f19205f982b330b3ec5ca7933c2d568896cc199b77833a88f352b8a69a6d6e605a5f4daf0ceab890e195ae793769ea97817b381b125234699a673368b4906ce71351a08bce5b03de1235def7b9cf7b8b9ee25ce738dc9e29d195bde6a7f29329aed4df14f0e71709bdefaf34dc94abc24885d3a75d8db8149e130a0b5ae73c3331860827341824c7b2d9b4f6f051a0293aad934e3434d80768243bf8f378ae59ef724ba74c74d3fd13bdc5f5675cad9b45e5d33cd6a2b2ff0044ee05f5b9869f372d4165908421008421060dd3f138bad71ed0d7dd6cfc9522ad2971579e9eb3f4cabef0fb21565b8592ba633cb195f8457e4dc93ed9db1df55d02cddee22c3ef3c94ae0f0acb6604b78e80f66f2ac54c000068803945be4b57293d924be51b4f673e931dea5cd60024b8b33d47c6f3b98358d624d9473316f221c649225ce1d6306624400accf01c6d631ed696eddea3ea6ce63c934dc0fbb113aeeb45c2d71e537f998e4c72b3b13c3163fe8e5e44cf7a6f89d923e8db803a1ef4e68e1dcc370a469304104799f8aed6fc3963b52f15832d304426cfa10ad989a0778b73833dffd54762703ae51e29a957af2880f569ce1eabc0ca0db5881626c609b89e49cbb0c46a214a6cbc0b5cd6c31a5d9bda73cc0d4e62d132006dc1035e76e59e13cbb619ed76f4483ad57dd67c5cb5159cfa3afd7d6bb0f55bfabf637d9bc6345a32f3e5eee9021085142e2eae20c33a70e0317567fbc3cda21565f5b38ca06875dfdbc95a3a738073f1355cc22735c1b6800b1548c41aec91948ec6831d85a98f2636eb7ec5c6a4b15b418c89739ef03d90440e6ee1f8b2ed2dbaf8cce80d11d5b837880249cc753a8f8aac972eb9e4ea49ed33daba444bd5dbf59cfcc1e5ac91d510465074d2ff34df0fb4aa530030e4037344dcea4e699379f842612ba15d2a6b0fb5eab206773ac7349cfac11132247f311b9483f6bbcc65ca1ed37cb25af1ce0db4dcab94ca5c95a974cdc655b70db47d7435ae6cc5c5b383c729d7ba468a3f1bb60d3aa58ea7d5117b871fac26c41dcabe5e41cc0c1e22df04ae2f683ea001ee0e2dd1d003a0fd1b448ed1297249848b351da387a8d80f14cee150401da6623b1c993718d9c8f05907e8b83d93fde1cbb2541e1f0af7fb0c73bdd693f052f85d8188312c0c1c5ce1f012572cbd46187be527dda9c3bf68d37d18c07d4020f55ba19e2b4859dfa34c10a4ea826496b64e9c740b445899ccff34f2bd3d3d9d4210a8170aeaf0fd0f620c93a503f49a93fdef11c940d665271b90dbf3040df7d0ebbb82d0b15458fcc1ed0e198ea262fbb8280c6f46293cf55ce61e4411e0ebf9af265c39755ca6aedd66735aaac3700c735dd7048cc6203a40780083d93e4947746981c41c844800e46de5ef6c993bb219e07c53eabd10a83d9a8d3ef34b7cc12916f47316d16ca4706bc89f1038acf4673c7ed4dcf932a9d1a6005d91900d41304039264f7e5747ba524ce8fd270072b04b4be0978218265e6044754d85f4b298a7b231edb863e74b5461e3f5beb3bc4af0ed9f8da6002c780248199840999d1c6c64db9958d724f9378fd0aecce89d1d5f4dae1ef3cd8c653ae843a4761561abd14c186cb70cc900ea1ced35b13c547ec5f5a1d35330e398f39f8c2b3e3aa3320875c89113cc4f2b82bc1cf972f5f699ebe9b74c7a75e157ffdbb87cd02851360e1d461064810246b263b442f6766d36010d6b445831ad6c7580bc6821cd29c3a49d795c9d3726efa24ad4c396fbe36feb6b52e33cc2ccc3d368199c6731060836cb6200e646f4db1204db4ddae8bacc39fc5be29734c02244fc3bb8f6adcf4bc99d9da4ff6bf8b8c97bed35d06690f798b103e2af2aa3d17273f72b72fadc78746323cb95dddba8421746424ea687b0a51275343d8505198feb3c6fcd3dc7fd9772caf18d058f6be5a5b25ae03db6e6bb4bb913befb93ea14c112aa1ab69984b31a52c42f6c64a071846d8f6287da2eeb1b9f153d53a8c1c4aafd7324a9486ac094c76e1c1a05bf1aaf4c092ae64a29b86ae0b7e2571ef831bcaf52a04de09d57a6b6c2fc6dc3f1294644dc5b96abdb29026c7c75534a9fe8bb4672792b5aae74629fb47942b1ad204210805e4e8bd21066fb7302e7d478617671b80919740081d896d89b45ed6faba80b5e3889ccde37d637a9bc7d2c988cd1ed8209ecb8fe65018d690e20ea0d8ef046f444db714d3ac03cb45df5cd1cd43b2a97300b4b67cfe5fd50dac79a6d52db56a39a435c47b2341c5449a80a52bd773face249e26e9b86a816160917b6538a2d2eb7894f9f4dad61204983737ff00654571f4ce7077007c4e9f35ef9a5721332baea480a4d0446f5d636e9202138a773db0a0b7747294539e254c26d81a7958d1c93954084210084210446dfc3973039bab0cf68de3c155768ddf2347007c75f357f226c55776b6c426eced038711d882af46a65772d13d7531323c387f45c3b26b033912156ad5a70c349ce3c790f895207a0f532c6f9949062654b6b3661e329e04e523b9ca42862586093d5f19e565438651ca037e91b93b804d6b6243a00d1d103eafd19ed327b253d65375776561ea9f68f107776715eaaf47aa31d9daecc778b788b58c591093f0b95bc49067993751e5d16252f5ea912dc97fac4b8f7c98f24d293fac24037d377822bc54e4a536161b3540234b9263c00dc9a62de5e61a2d686db7767356bd8782c8c922e47fb9f1412cba8420108420108420108420e26b8dc132a0870ef1623bd3b420a46dad8552006b43c0de63311c15759b2f145c1ada6d6e978f982b595e720e010466c1c01a4c19aee3a952a84208ec76cb654be878a674fa3ed1abbc829d4208ec36c9a6c32049e6a450840210840210841fffd9, 19);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marca_botellas`
--
ALTER TABLE `marca_botellas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marca_botellas`
--
ALTER TABLE `marca_botellas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
