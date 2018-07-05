-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2018 a las 18:34:56
-- Versión del servidor: 10.1.31-MariaDB
-- Versión de PHP: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ischool`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courses`
--

CREATE TABLE `courses` (
  `id` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `day` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `hour` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_teacher` varchar(12) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `courses`
--

INSERT INTO `courses` (`id`, `name`, `day`, `hour`, `id_teacher`) VALUES
('C00001', 'Aritmetica', 'lunes', '8:00am - 9:30am', 'T001'),
('C00002', 'Algebra', 'lunes', '9:30am - 11:00 am', 'T001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grades`
--

CREATE TABLE `grades` (
  `id` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `grade` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `section` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `school_level` varchar(25) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `grades`
--

INSERT INTO `grades` (`id`, `grade`, `section`, `school_level`) VALUES
('A1001', 'primero', 'A', 'primaria'),
('A1002', 'primero', 'B', 'primaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(12) NOT NULL,
  `role` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `date_created` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `date_modified` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `role`, `date_created`, `date_modified`) VALUES
(1, 'admin', '04/07/2018', '04/07/2018'),
(2, 'student', '04/07/2018', '04/07/2018'),
(3, 'teacher', '04/07/2018', '04/07/2018');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `scores`
--

CREATE TABLE `scores` (
  `id` int(12) NOT NULL,
  `id_student` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `id_course` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `s1` int(2) DEFAULT NULL,
  `s2` int(2) DEFAULT NULL,
  `s4` int(2) DEFAULT NULL,
  `s3` int(2) DEFAULT NULL,
  `final_score` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `scores`
--

INSERT INTO `scores` (`id`, `id_student`, `id_course`, `s1`, `s2`, `s4`, `s3`, `final_score`) VALUES
(1, 'S00000000001', 'C00001', 15, NULL, NULL, NULL, NULL),
(2, 'S00000000001', 'C00002', 18, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `students`
--

CREATE TABLE `students` (
  `id` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `birth_date` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `dni` int(8) DEFAULT NULL,
  `phone_number` int(9) NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `parent` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_grade` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `id_user` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `students`
--

INSERT INTO `students` (`id`, `name`, `lastname`, `sex`, `birth_date`, `dni`, `phone_number`, `address`, `photo`, `parent`, `id_grade`, `id_user`) VALUES
('S00000000001', 'Luis', 'Ñapauri', 'Masculino', '01/07/2012', 41257849, 998451256, 'Direccion', 'ruta/photo', 'Nombre padre', 'A1001', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachers`
--

CREATE TABLE `teachers` (
  `id` varchar(12) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `sex` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `birth_date` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `dni` int(8) NOT NULL,
  `phone_number` int(9) NOT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `photo` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cv` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `id_user` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `lastname`, `sex`, `birth_date`, `dni`, `phone_number`, `address`, `photo`, `cv`, `id_user`) VALUES
('T001', 'Miguel', 'Arevalo', 'Masculino', '05/07/1968', 58712458, 998741254, 'Direccion', 'ruta/photo', 'ruta/cv', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `user` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_role` int(12) NOT NULL,
  `date_created` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `date_modified` varchar(10) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `user`, `password`, `email`, `id_role`, `date_created`, `date_modified`) VALUES
(1, 'profesor1', 'profesor1', 'profesor1@domain.com', 3, '04/07/2018', '04/07/2018'),
(2, 'alumno1', 'alumno1', 'alumno1@domain.com', 2, '04/07/2018', '04/07/2018'),
(3, 'admin', 'admin', 'admin@admin.com', 1, '04/07/2018', '04/07/2018');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_teacher` (`id_teacher`);

--
-- Indices de la tabla `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `scores`
--
ALTER TABLE `scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_student` (`id_student`),
  ADD KEY `id_course` (`id_course`);

--
-- Indices de la tabla `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_grade` (`id_grade`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `scores`
--
ALTER TABLE `scores`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id`);

--
-- Filtros para la tabla `scores`
--
ALTER TABLE `scores`
  ADD CONSTRAINT `scores_ibfk_1` FOREIGN KEY (`id_student`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `scores_ibfk_2` FOREIGN KEY (`id_course`) REFERENCES `courses` (`id`);

--
-- Filtros para la tabla `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`id_grade`) REFERENCES `grades` (`id`);

--
-- Filtros para la tabla `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
