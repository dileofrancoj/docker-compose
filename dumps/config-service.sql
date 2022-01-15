-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: jom.cjr2hqg8bbfi.us-east-2.rds.amazonaws.com
-- Tiempo de generación: 15-01-2022 a las 20:39:26
-- Versión del servidor: 8.0.23
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `config-service`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rooms`
--

CREATE TABLE `rooms` (
  `id` int NOT NULL,
  `id_icon` int NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `devices_on` int NOT NULL DEFAULT '0',
  `enabled` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rooms`
--

INSERT INTO `rooms` (`id`, `id_icon`, `name`, `devices_on`, `enabled`) VALUES
(45, 1, 'Oficina', 0, 1),
(46, 1, 'Comedor', 0, 0),
(47, 1, 'Cuarto principal', 0, 0),
(48, 1, 'Ofi 3', 0, 1),
(49, 1, 'Ofi 4', 0, 1),
(50, 1, 'Oficina 5', 0, 1),
(51, 1, 'Oficina 5', 0, 1),
(52, 1, 'Oficina 5', 0, 1),
(53, 1, 'Oficina 5', 0, 1),
(54, 1, 'Oficina 5', 0, 1),
(55, 1, 'Oficina 5', 0, 1),
(56, 1, 'Oficina 5', 0, 1),
(57, 1, 'Oficina 5', 0, 1),
(58, 1, 'Oficina 5', 0, 1),
(59, 1, 'Oficina 5', 0, 1),
(60, 1, 'Oficina 82', 0, 0),
(61, 1, 'otra room', 0, 0),
(62, 1, 'testttt', 0, 0),
(63, 1, 'testttt 2', 0, 0),
(64, 1, 'Ambiente 123', 0, 0),
(65, 1, 'Ambiente 123', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `room_devices`
--

CREATE TABLE `room_devices` (
  `id` int NOT NULL,
  `id_room` int NOT NULL,
  `id_user_device` int NOT NULL,
  `value` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `enabled` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `room_devices`
--

INSERT INTO `room_devices` (`id`, `id_room`, `id_user_device`, `value`, `enabled`) VALUES
(64, 45, 1, '{\"on\":0}', 1),
(88, 45, 2, '{\"on\":1}', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_devices`
--

CREATE TABLE `user_devices` (
  `id` int NOT NULL,
  `id_device` int NOT NULL,
  `id_user` int NOT NULL,
  `id_type` int NOT NULL,
  `id_icon` int NOT NULL DEFAULT '1',
  `uuid_device` varchar(250) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `enabled` int NOT NULL DEFAULT '0',
  `ts_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ts_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `user_devices`
--

INSERT INTO `user_devices` (`id`, `id_device`, `id_user`, `id_type`, `id_icon`, `uuid_device`, `name`, `enabled`, `ts_create`, `ts_update`) VALUES
(1, 1, 1, 1, 1, 'a950950d-d0bd-4c84-92df-076ad27d0a1a', 'Habitación 1', 1, '2021-12-27 20:57:29', '2022-01-08 18:15:08'),
(2, 2, 1, 1, 1, '52331ed5-ffa4-4565-b181-62451fd02dd5', 'Habitacion 2', 1, '2021-12-30 17:22:44', '2022-01-08 18:15:15'),
(8, 3, 1, 1, 1, '6d36d4f8-a070-431d-904e-9fb727999227', 'Dispositivo n 3', 1, '2022-01-10 14:15:31', '2022-01-10 14:15:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_rooms`
--

CREATE TABLE `user_rooms` (
  `id` int NOT NULL,
  `id_room` int NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `user_rooms`
--

INSERT INTO `user_rooms` (`id`, `id_room`, `id_user`) VALUES
(45, 45, 1),
(48, 46, 1),
(49, 48, 1),
(50, 49, 1),
(51, 50, 1),
(52, 51, 1),
(53, 52, 1),
(54, 53, 1),
(55, 54, 1),
(56, 55, 1),
(57, 56, 1),
(58, 57, 1),
(59, 58, 1),
(60, 59, 1),
(61, 60, 1),
(62, 61, 1),
(63, 62, 1),
(64, 63, 1),
(65, 64, 1),
(66, 65, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `room_devices`
--
ALTER TABLE `room_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_devices`
--
ALTER TABLE `user_devices`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_rooms`
--
ALTER TABLE `user_rooms`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `room_devices`
--
ALTER TABLE `room_devices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT de la tabla `user_devices`
--
ALTER TABLE `user_devices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `user_rooms`
--
ALTER TABLE `user_rooms`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
