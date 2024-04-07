-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 07-04-2024 a las 19:42:20
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
-- Base de datos: `dbdonantes_colombia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles`
--

DROP TABLE IF EXISTS `detalles`;
CREATE TABLE IF NOT EXISTS `detalles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_donacion` varchar(100) DEFAULT NULL,
  `id_punto` varchar(100) DEFAULT NULL,
  `nombre_producto` varchar(100) DEFAULT NULL,
  `codigo_producto` varchar(100) DEFAULT NULL,
  `cantidad` varchar(100) DEFAULT NULL,
  `kg_unitario` decimal(10,2) DEFAULT NULL,
  `costo_unitario` decimal(10,2) DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `detalles`
--

INSERT INTO `detalles` (`id`, `codigo_donacion`, `id_punto`, `nombre_producto`, `codigo_producto`, `cantidad`, `kg_unitario`, `costo_unitario`, `fecha_publicacion`) VALUES
(1, 'dona 123', '33', 'galletas', '768', '3', 2.00, 3000.00, '2024-04-03 15:55:55'),
(2, 'dona 123', '33', 'frutas', '344', '2', 2.00, 3000.00, '2024-04-03 15:55:55'),
(5, 'dona123', '33', 'Producto A', 'prod001', '100', 1.50, 100.00, '2024-04-06 18:54:26'),
(6, 'dona123', '33', 'Producto B', 'prod002', '200', 0.50, 50.00, '2024-04-06 18:54:26'),
(7, 'dona124', '33', 'Producto A', 'prod001', '100', 1.50, 100.00, '2024-04-06 18:57:22'),
(8, 'dona125', '33', 'Producto B', 'prod002', '200', 0.50, 50.00, '2024-04-06 18:57:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encabezados`
--

DROP TABLE IF EXISTS `encabezados`;
CREATE TABLE IF NOT EXISTS `encabezados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_donacion` varchar(100) DEFAULT NULL,
  `fecha_publicacion` datetime DEFAULT NULL,
  `kg_total` decimal(10,2) DEFAULT NULL,
  `costo_total` decimal(10,2) DEFAULT NULL,
  `nombre_punto` text,
  `id_punto` varchar(100) DEFAULT NULL,
  `departamento` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `direccion` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `encabezados`
--

INSERT INTO `encabezados` (`id`, `codigo_donacion`, `fecha_publicacion`, `kg_total`, `costo_total`, `nombre_punto`, `id_punto`, `departamento`, `ciudad`, `direccion`) VALUES
(1, 'dona123', '2024-04-03 15:55:55', 14.00, 13000.00, 'punto ABC', '33', 'ANTIOQUIA', 'MEDELLIN', 'CALLE 10 SUR');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
