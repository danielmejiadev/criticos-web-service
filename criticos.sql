-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2016 a las 05:09:33
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `criticos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actor`
--

CREATE TABLE `actor` (
  `useremail` varchar(100) NOT NULL,
  `eventid` int(20) UNSIGNED NOT NULL,
  `rol` text NOT NULL,
  `calification` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actor`
--

INSERT INTO `actor` (`useremail`, `eventid`, `rol`, `calification`) VALUES
('any@gmail.com', 3, 'Creador', 0),
('d@gmail.com', 1, 'Creador', 0),
('d@gmail.com', 2, 'Creador', 0),
('d@gmail.com', 4, 'Creador', 0),
('d@gmail.com', 5, 'Creador', 0),
('sebastian@gmail.com', 1, 'Expositor', 0),
('sebastian@gmail.com', 4, 'Ponente', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentariousuario`
--

CREATE TABLE `comentariousuario` (
  `correoelectronicousuario` varchar(100) NOT NULL,
  `codigocomentario` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comment`
--

CREATE TABLE `comment` (
  `commentid` int(20) UNSIGNED NOT NULL,
  `commentdescription` text NOT NULL,
  `commentdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `comment`
--

INSERT INTO `comment` (`commentid`, `commentdescription`, `commentdate`) VALUES
(1, 'Muy buena exposicion', '2016-10-12 00:00:00'),
(2, 'No me gusto para nada', '2016-10-11 00:00:00'),
(3, 'Hay que tener cuidado con leer demasiado', '2016-10-11 00:00:00'),
(4, 'Mala', '2016-10-20 00:00:00'),
(5, 'Buena', '2016-10-21 00:00:00'),
(6, 'estuvo bien, pero falta mejorar un poco', '2016-10-10 00:00:00'),
(7, 'creo que todo ha salido bien', '2016-10-10 00:00:00'),
(8, 'Mateo, vos sos muy malo parcero', '2016-10-10 00:00:00'),
(9, 'Nis todo bien nena', '2016-10-10 00:00:00'),
(10, 'que cosa mas interesante', '2016-10-10 00:00:00'),
(11, 'estuve chever me parece', '2016-10-10 00:00:00'),
(12, 'genial. buena exposicion', '2016-10-10 00:00:00'),
(13, 're buena parce', '2016-10-10 00:00:00'),
(14, 'genial exposicion', '2016-10-10 00:00:00'),
(15, 'estuvo bien en mi opinion', '2016-10-10 00:00:00'),
(16, 'buu, re paila y mala', '2016-10-10 00:00:00'),
(17, 'genal ', '2016-10-10 00:00:00'),
(18, 'mala', '2016-10-10 00:00:00'),
(19, 'buena', '2016-10-10 00:00:00'),
(20, 're chevere', '2016-10-10 00:00:00'),
(21, 'estuvo super bien', '2016-10-10 00:00:00'),
(22, 'todo ha estado perfecto', '2016-10-10 00:00:00'),
(23, 'ese man de Daniel tan paila', '2016-10-10 00:00:00'),
(24, 'estuvo super', '2016-10-10 00:00:00'),
(25, 'genial', '2016-10-10 00:00:00'),
(26, 'Loco', '2016-10-10 00:00:00'),
(27, 'mala perro', '2016-10-12 00:00:00'),
(28, 'hola todo bien', '2016-10-12 00:00:00'),
(29, 'kdsd', '2016-10-12 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `event`
--

CREATE TABLE `event` (
  `eventid` int(20) UNSIGNED NOT NULL,
  `eventname` text NOT NULL,
  `eventdescription` text NOT NULL,
  `eventdate` date NOT NULL,
  `eventbegintime` time NOT NULL,
  `eventendtime` time NOT NULL,
  `eventplace` text NOT NULL,
  `eventcalification` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `event`
--

INSERT INTO `event` (`eventid`, `eventname`, `eventdescription`, `eventdate`, `eventbegintime`, `eventendtime`, `eventplace`, `eventcalification`) VALUES
(1, 'Relatos de un neufrago', 'Exposicion general del tema', '2016-10-30', '08:00:00', '13:00:00', 'Auditorio 1', 0),
(2, 'La Vida', 'Exposicion general', '2016-10-26', '18:00:00', '20:00:00', 'Salon 3', 0),
(3, 'Vida artificial', 'Exposicion', '2016-10-07', '14:00:00', '17:00:00', 'Salon chquito', 0),
(4, 'El arte de la programacion', 'Breve exposicion sobre la programacion', '2016-10-26', '07:00:00', '10:00:00', 'Salon 4', 0),
(5, 'Exposicion', 'hello', '2016-10-12', '00:00:00', '12:00:00', 'salin1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventcomment`
--

CREATE TABLE `eventcomment` (
  `eventid` int(20) UNSIGNED NOT NULL,
  `commentid` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventcomment`
--

INSERT INTO `eventcomment` (`eventid`, `commentid`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 14),
(1, 15),
(1, 16),
(1, 26),
(1, 28),
(2, 10),
(2, 11),
(2, 12),
(2, 27),
(4, 13),
(4, 17),
(4, 18),
(4, 19),
(4, 20),
(4, 21),
(4, 22),
(4, 23),
(4, 24),
(4, 25),
(5, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `participante`
--

CREATE TABLE `participante` (
  `correoelectronicousuario` varchar(100) NOT NULL,
  `codigoevento` int(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `useremail` varchar(100) NOT NULL,
  `userpassword` text NOT NULL,
  `username` text NOT NULL,
  `userlastname` text NOT NULL,
  `useroccupation` text NOT NULL,
  `userpicture` text NOT NULL,
  `userstate` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`useremail`, `userpassword`, `username`, `userlastname`, `useroccupation`, `userpicture`, `userstate`) VALUES
('a@hello.com', '123', 'Laura', 'Colorado', '', '', 1),
('any@gmail.com', '123', 'Joshua', 'Triana', 'Docente', '', 1),
('d@gmail.com', '12345', 'Daniel', 'Mejia', 'estudiante', '', 1),
('sebastian@gmail.com', '1234', 'Sebastian', 'Mejia', 'Estudiante', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`useremail`,`eventid`),
  ADD KEY `actorevento` (`eventid`);

--
-- Indices de la tabla `comentariousuario`
--
ALTER TABLE `comentariousuario`
  ADD PRIMARY KEY (`correoelectronicousuario`,`codigocomentario`),
  ADD KEY `comentariousuariocomentario` (`codigocomentario`);

--
-- Indices de la tabla `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentid`),
  ADD UNIQUE KEY `codigocomentario` (`commentid`);

--
-- Indices de la tabla `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`eventid`),
  ADD UNIQUE KEY `codigoevento` (`eventid`);

--
-- Indices de la tabla `eventcomment`
--
ALTER TABLE `eventcomment`
  ADD PRIMARY KEY (`eventid`,`commentid`),
  ADD KEY `comentarioeventocomentario` (`commentid`);

--
-- Indices de la tabla `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`correoelectronicousuario`,`codigoevento`),
  ADD KEY `participanteevento` (`codigoevento`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`useremail`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comment`
--
ALTER TABLE `comment`
  MODIFY `commentid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `event`
--
ALTER TABLE `event`
  MODIFY `eventid` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `actor`
--
ALTER TABLE `actor`
  ADD CONSTRAINT `actorevento` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actorusuario` FOREIGN KEY (`useremail`) REFERENCES `user` (`useremail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `comentariousuario`
--
ALTER TABLE `comentariousuario`
  ADD CONSTRAINT `comentariousuariocomentario` FOREIGN KEY (`codigocomentario`) REFERENCES `comment` (`commentid`),
  ADD CONSTRAINT `comentariousuariousuario` FOREIGN KEY (`correoelectronicousuario`) REFERENCES `user` (`useremail`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventcomment`
--
ALTER TABLE `eventcomment`
  ADD CONSTRAINT `comentarioeventocomentario` FOREIGN KEY (`commentid`) REFERENCES `comment` (`commentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comentarioeventoevento` FOREIGN KEY (`eventid`) REFERENCES `event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `participanteevento` FOREIGN KEY (`codigoevento`) REFERENCES `event` (`eventid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participanteusuario` FOREIGN KEY (`correoelectronicousuario`) REFERENCES `user` (`useremail`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
