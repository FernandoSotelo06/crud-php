-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2024 a las 06:37:28
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_grupo02`
--
CREATE DATABASE bd_grupo02;
USE bd_grupo02;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `ID` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `mensaje` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`ID`, `nombre_completo`, `telefono`, `correo_electronico`, `mensaje`) VALUES
(1, 'Juan Perez', '123456789', 'juan.perez@example.com', 'Quiero hacer una reservación.'),
(2, 'Ana Martinez', '987654321', 'ana.martinez@example.com', '¿Tienen opciones vegetarianas?'),
(3, 'Luis Garcia', '456789123', 'luis.garcia@example.com', 'Me gustaría conocer los precios de los menús.'),
(4, 'Carlos Sanchez', '321654987', 'carlos.sanchez@example.com', '¿Aceptan tarjetas de crédito?'),
(5, 'Laura Torres', '654321789', 'laura.torres@example.com', 'Necesito información sobre el evento de la próxima semana.'),
(6, 'Marta Gomez', '789123456', 'marta.gomez@example.com', '¿Tienen área de juegos para niños?'),
(7, 'Jorge Diaz', '123987456', 'jorge.diaz@example.com', '¿Cuál es el horario de atención?'),
(8, 'Sofia Romero', '987321654', 'sofia.romero@example.com', 'Me gustaría hacer una reservación para 4 personas.'),
(9, 'Ricardo Fernandez', '456123789', 'ricardo.fernandez@example.com', '¿Ofrecen servicio de catering?'),
(10, 'Elena Morales', '321789654', 'elena.morales@example.com', '¿Puedo llevar mi propio vino?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

CREATE TABLE `reservaciones` (
  `ID` int(11) NOT NULL,
  `nombre_cliente` varchar(100) NOT NULL,
  `fecha_reservacion` date NOT NULL,
  `hora_reservacion` time NOT NULL,
  `numero_personas` int(11) NOT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservaciones`
--

INSERT INTO `reservaciones` (`ID`, `nombre_cliente`, `fecha_reservacion`, `hora_reservacion`, `numero_personas`, `telefono`, `correo_electronico`) VALUES
(1, 'Juan Perez', '2024-07-01', '19:00:00', 4, '123456789', 'juan.perez@example.com'),
(2, 'Ana Martinez', '2024-07-02', '20:00:00', 2, '987654321', 'ana.martinez@example.com'),
(3, 'Luis Garcia', '2024-07-03', '18:30:00', 3, '456789123', 'luis.garcia@example.com'),
(4, 'Carlos Sanchez', '2024-07-04', '19:30:00', 5, '321654987', 'carlos.sanchez@example.com'),
(5, 'Laura Torres', '2024-07-05', '20:30:00', 2, '654321789', 'laura.torres@example.com'),
(6, 'Marta Gomez', '2024-07-06', '18:00:00', 4, '789123456', 'marta.gomez@example.com'),
(7, 'Jorge Diaz', '2024-07-07', '21:00:00', 6, '123987456', 'jorge.diaz@example.com'),
(8, 'Sofia Romero', '2024-07-08', '19:00:00', 3, '987321654', 'sofia.romero@example.com'),
(9, 'Ricardo Fernandez', '2024-07-09', '18:30:00', 2, '456123789', 'ricardo.fernandez@example.com'),
(10, 'Elena Morales', '2024-07-10', '20:00:00', 5, '321789654', 'elena.morales@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `rol` enum('cliente','administrador') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `nombre_usuario`, `contrasena`, `correo_electronico`, `rol`) VALUES
(1, 'admin', 'admin123', 'admin@restaurant.com', 'administrador'),
(2, 'johndoe', 'password1', 'john.doe@example.com', 'cliente'),
(3, 'janedoe', 'password2', 'jane.doe@example.com', 'cliente'),
(4, 'mariaperez', 'password3', 'maria.perez@example.com', 'cliente'),
(5, 'carloslopez', 'password4', 'carlos.lopez@example.com', 'cliente'),
(6, 'laurasanchez', 'password5', 'laura.sanchez@example.com', 'cliente'),
(7, 'juangomez', 'password6', 'juan.gomez@example.com', 'cliente'),
(8, 'susanafernandez', 'password7', 'susana.fernandez@example.com', 'cliente'),
(9, 'martingarcia', 'password8', 'martin.garcia@example.com', 'cliente'),
(10, 'alejandroramirez', 'password9', 'alejandro.ramirez@example.com', 'cliente');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
