-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-04-2024 a las 19:42:41
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `dbdonantes_puntos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos`
--

DROP TABLE IF EXISTS `puntos`;
CREATE TABLE IF NOT EXISTS `puntos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_punto` varchar(100) DEFAULT NULL,
  `nombre_punto` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `puntos`
--

INSERT INTO `puntos` (`id`, `id_punto`, `nombre_punto`, `departamento`, `ciudad`, `direccion`) VALUES
(1, '33', 'punto ABC', 'Antioquia', 'Medellin', 'calle 10 sur');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
