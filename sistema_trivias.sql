-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 20-07-2026 a las 00:04:26
-- Versión del servidor: 8.4.7
-- Versión de PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_trivias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avatar`
--

DROP TABLE IF EXISTS `avatar`;
CREATE TABLE IF NOT EXISTS `avatar` (
  `id_avatar` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` enum('emoji','imagen') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'emoji',
  `valor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_avatar`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `avatar`
--

INSERT INTO `avatar` (`id_avatar`, `nombre`, `tipo`, `valor`, `activo`, `fecha_creacion`) VALUES
(1, 'Superhéroe', 'emoji', '🦸', 1, '2026-07-19 15:42:18'),
(2, 'Mago', 'emoji', '🧙', 1, '2026-07-19 15:42:18'),
(3, 'Robot', 'emoji', '🤖', 1, '2026-07-19 15:42:18'),
(4, 'Gato', 'emoji', '🐱', 1, '2026-07-19 15:42:18'),
(5, 'Zorro', 'emoji', '🦊', 1, '2026-07-19 15:42:18'),
(6, 'Panda', 'emoji', '🐼', 1, '2026-07-19 15:42:18'),
(7, 'Rana', 'emoji', '🐸', 1, '2026-07-19 15:42:18'),
(8, 'Nutria', 'emoji', '🦦', 1, '2026-07-19 15:42:18'),
(9, 'Alien', 'emoji', '👽', 1, '2026-07-19 15:42:18'),
(10, 'Ninja', 'emoji', '🥷', 1, '2026-07-19 15:42:18'),
(11, 'Programador', 'emoji', '🧑‍💻', 1, '2026-07-19 15:42:18'),
(12, 'Joystick', 'emoji', '🕹️', 1, '2026-07-19 15:42:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
CREATE TABLE IF NOT EXISTS `encuesta` (
  `id_encuesta` int NOT NULL AUTO_INCREMENT,
  `pregunta_encuesta` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `intento_login`
--

DROP TABLE IF EXISTS `intento_login`;
CREATE TABLE IF NOT EXISTS `intento_login` (
  `id_intento` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `correo_ingresado` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  `exitoso` tinyint(1) DEFAULT '0',
  `numero_intento` tinyint NOT NULL,
  PRIMARY KEY (`id_intento`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `intento_login`
--

INSERT INTO `intento_login` (`id_intento`, `id_usuario`, `correo_ingresado`, `ip`, `fecha_hora`, `exitoso`, `numero_intento`) VALUES
(1, 1, 'admin@trivias.com', '::1', '2026-07-19 15:59:05', 0, 1),
(2, 1, 'admin@trivias.com', '::1', '2026-07-19 16:00:21', 1, 1),
(3, 2, 'user@trivias.com', '::1', '2026-07-19 16:00:54', 1, 1),
(4, 1, 'admin@trivias.com', '::1', '2026-07-19 17:58:29', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `like_tema`
--

DROP TABLE IF EXISTS `like_tema`;
CREATE TABLE IF NOT EXISTS `like_tema` (
  `id_like` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_tema` int NOT NULL,
  `tipo_reaccion` enum('interesante','aburrido','genial') COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_like`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_tema` (`id_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
CREATE TABLE IF NOT EXISTS `mensaje` (
  `id_mensaje` int NOT NULL AUTO_INCREMENT,
  `id_emisor` int NOT NULL,
  `id_receptor` int DEFAULT NULL,
  `contenido` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_envio` datetime DEFAULT CURRENT_TIMESTAMP,
  `leido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_mensaje`),
  KEY `id_emisor` (`id_emisor`),
  KEY `id_receptor` (`id_receptor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel_conocimiento`
--

DROP TABLE IF EXISTS `nivel_conocimiento`;
CREATE TABLE IF NOT EXISTS `nivel_conocimiento` (
  `id_nivel` int NOT NULL AUTO_INCREMENT,
  `nombre_nivel` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` tinyint NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `nivel_conocimiento`
--

INSERT INTO `nivel_conocimiento` (`id_nivel`, `nombre_nivel`, `orden`) VALUES
(1, 'Novato', 1),
(2, 'Intermedio', 2),
(3, 'Avanzado', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion_respuesta`
--

DROP TABLE IF EXISTS `opcion_respuesta`;
CREATE TABLE IF NOT EXISTS `opcion_respuesta` (
  `id_opcion` int NOT NULL AUTO_INCREMENT,
  `id_pregunta` int NOT NULL,
  `texto_opcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `es_correcta` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_opcion`),
  KEY `id_pregunta` (`id_pregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `opcion_respuesta`
--

INSERT INTO `opcion_respuesta` (`id_opcion`, `id_pregunta`, `texto_opcion`, `es_correcta`) VALUES
(1, 1, '$variable = valor;', 1),
(2, 1, 'var variable = valor;', 0),
(3, 1, 'variable := valor;', 0),
(4, 1, 'let variable = valor;', 0),
(5, 2, '<?php', 1),
(6, 2, '<script>', 0),
(7, 2, '<%', 0),
(8, 2, '#!php', 0),
(9, 3, 'echo', 1),
(10, 3, 'console.log', 0),
(11, 3, 'System.out.println', 0),
(12, 3, 'Debug.Print', 0),
(13, 4, 'Con el operador .', 1),
(14, 4, 'Con el operador +', 0),
(15, 4, 'Con el operador &', 0),
(16, 4, 'Con la función concat()', 0),
(17, 5, '$a = array(\"clave\" => \"valor\");', 1),
(18, 5, '$a = {\"clave\": \"valor\"};', 0),
(19, 5, '$a = [\"clave\" -> \"valor\"];', 0),
(20, 5, '$a = new Map(\"clave\", \"valor\");', 0),
(21, 6, 'isset()', 1),
(22, 6, 'empty()', 0),
(23, 6, 'is_null()', 0),
(24, 6, 'exists()', 0),
(25, 7, '===', 1),
(26, 7, '==', 0),
(27, 7, '=', 0),
(28, 7, '<=>', 0),
(29, 8, 'while', 1),
(30, 8, 'switch', 0),
(31, 8, 'if', 0),
(32, 8, 'function', 0),
(33, 9, 'Verdadero', 1),
(34, 9, 'Falso', 0),
(35, 10, 'strtoupper()', 1),
(36, 10, 'toUpperCase()', 0),
(37, 10, 'upper()', 0),
(38, 10, 'strToUpper()', 0),
(39, 11, 'PDO', 1),
(40, 11, 'mysql_connect', 0),
(41, 11, 'ODBC clásico', 0),
(42, 11, 'curl', 0),
(43, 12, 'Prevenir inyección SQL', 1),
(44, 12, 'Hacer las consultas más lentas', 0),
(45, 12, 'Eliminar la necesidad de una base de datos', 0),
(46, 12, 'Aumentar el tamaño del código', 0),
(47, 13, 'execute()', 1),
(48, 13, 'run()', 0),
(49, 13, 'query()', 0),
(50, 13, 'send()', 0),
(51, 14, 'fetchAll()', 1),
(52, 14, 'getAll()', 0),
(53, 14, 'fetchRow()', 0),
(54, 14, 'selectAll()', 0),
(55, 15, 'Con dos puntos, por ejemplo :nombre', 1),
(56, 15, 'Con un símbolo de arroba @nombre', 0),
(57, 15, 'Con corchetes [nombre]', 0),
(58, 15, 'Con signo de dólar duplicado $$nombre', 0),
(59, 16, 'beginTransaction()', 1),
(60, 16, 'startTransaction()', 0),
(61, 16, 'openTransaction()', 0),
(62, 16, 'initTransaction()', 0),
(63, 17, 'Falso', 1),
(64, 17, 'Verdadero', 0),
(65, 18, 'rollBack()', 1),
(66, 18, 'undo()', 0),
(67, 18, 'cancel()', 0),
(68, 18, 'revert()', 0),
(69, 19, 'lastInsertId()', 1),
(70, 19, 'getLastId()', 0),
(71, 19, 'lastId()', 0),
(72, 19, 'insertId()', 0),
(73, 20, 'INNER JOIN', 1),
(74, 20, 'LEFT JOIN', 0),
(75, 20, 'RIGHT JOIN', 0),
(76, 20, 'CROSS JOIN', 0),
(77, 21, 'interface', 1),
(78, 21, 'abstract', 0),
(79, 21, 'trait', 0),
(80, 21, 'implements', 0),
(81, 22, 'Traits', 1),
(82, 22, 'Interfaces', 0),
(83, 22, 'Namespaces', 0),
(84, 22, 'Constantes', 0),
(85, 23, 'extends', 1),
(86, 23, 'implements', 0),
(87, 23, 'inherits', 0),
(88, 23, 'using', 0),
(89, 24, 'static', 1),
(90, 24, 'public', 0),
(91, 24, 'protected', 0),
(92, 24, 'final', 0),
(93, 25, 'try/catch', 1),
(94, 25, 'if/else', 0),
(95, 25, 'switch/case', 0),
(96, 25, 'foreach', 0),
(97, 26, 'final', 1),
(98, 26, 'static', 0),
(99, 26, 'abstract', 0),
(100, 26, 'const', 0),
(101, 27, 'Falso', 1),
(102, 27, 'Verdadero', 0),
(103, 28, 'Singleton', 1),
(104, 28, 'Factory', 0),
(105, 28, 'Observer', 0),
(106, 28, 'Strategy', 0),
(107, 29, 'spl_autoload_register', 1),
(108, 29, 'include_all()', 0),
(109, 29, 'autoload_classes()', 0),
(110, 29, 'require_all()', 0),
(111, 30, 'protected', 1),
(112, 30, 'public', 0),
(113, 30, 'private', 0),
(114, 30, 'static', 0),
(115, 31, 'const', 1),
(116, 31, 'var', 0),
(117, 31, 'let', 0),
(118, 31, 'static', 0),
(119, 32, 'console.log()', 1),
(120, 32, 'print()', 0),
(121, 32, 'echo()', 0),
(122, 32, 'alert.log()', 0),
(123, 33, '\"string\"', 1),
(124, 33, '\"text\"', 0),
(125, 33, '\"char\"', 0),
(126, 33, '\"str\"', 0),
(127, 34, 'push()', 1),
(128, 34, 'add()', 0),
(129, 34, 'append()', 0),
(130, 34, 'insert()', 0),
(131, 35, '===', 1),
(132, 35, '==', 0),
(133, 35, '=', 0),
(134, 35, '!=', 0),
(135, 36, 'if', 1),
(136, 36, 'for', 0),
(137, 36, 'function', 0),
(138, 36, 'class', 0),
(139, 37, 'Verdadero', 1),
(140, 37, 'Falso', 0),
(141, 38, 'document.getElementById()', 1),
(142, 38, 'document.query()', 0),
(143, 38, 'document.find()', 0),
(144, 38, 'document.selectId()', 0),
(145, 39, 'const suma = (a, b) => a + b;', 1),
(146, 39, 'function => suma(a, b) { a + b }', 0),
(147, 39, 'const suma = function:(a,b) a+b', 0),
(148, 39, 'suma := (a,b) -> a+b', 0),
(149, 40, 'false', 1),
(150, 40, 'true', 0),
(151, 40, 'undefined', 0),
(152, 40, 'NaN', 0),
(153, 41, 'Una función que recuerda el entorno donde fue creada', 1),
(154, 41, 'Un tipo de bucle', 0),
(155, 41, 'Un método para cerrar el navegador', 0),
(156, 41, 'Una forma de eliminar variables', 0),
(157, 42, 'map()', 1),
(158, 42, 'forEach()', 0),
(159, 42, 'filter()', 0),
(160, 42, 'reduce()', 0),
(161, 43, 'filter()', 1),
(162, 43, 'map()', 0),
(163, 43, 'find()', 0),
(164, 43, 'some()', 0),
(165, 44, 'Un objeto que representa la eventual finalización de una operación asíncrona', 1),
(166, 44, 'Una variable global', 0),
(167, 44, 'Un tipo de bucle infinito', 0),
(168, 44, 'Una función síncrona', 0),
(169, 45, 'Destructuring (usando { } o [ ])', 1),
(170, 45, 'Spread', 0),
(171, 45, 'Import', 0),
(172, 45, 'Export', 0),
(173, 46, 'Expande sus elementos individualmente', 1),
(174, 46, 'Los convierte en un string', 0),
(175, 46, 'Elimina los duplicados', 0),
(176, 46, 'Los ordena alfabéticamente', 0),
(177, 47, 'Falso', 1),
(178, 47, 'Verdadero', 0),
(179, 48, 'El mismo \'this\' del contexto donde fue definida', 1),
(180, 48, 'Siempre apunta al objeto global', 0),
(181, 48, 'Siempre es undefined', 0),
(182, 48, 'Cambia dinámicamente según quién la llame', 0),
(183, 49, 'reduce()', 1),
(184, 49, 'map()', 0),
(185, 49, 'concat()', 0),
(186, 49, 'join()', 0),
(187, 50, 'Con comillas invertidas (backticks)', 1),
(188, 50, 'Con comillas dobles \"\"', 0),
(189, 50, 'Con comillas simples \'\'', 0),
(190, 50, 'Con corchetes []', 0),
(191, 51, 'await', 1),
(192, 51, 'then', 0),
(193, 51, 'resolve', 0),
(194, 51, 'yield', 0),
(195, 52, 'El mecanismo que gestiona la ejecución de código asíncrono y la cola de tareas', 1),
(196, 52, 'Un bucle for infinito', 0),
(197, 52, 'Un método del DOM', 0),
(198, 52, 'Una librería externa', 0),
(199, 53, 'Promise.all()', 1),
(200, 53, 'Promise.wait()', 0),
(201, 53, 'Promise.sync()', 0),
(202, 53, 'Promise.chain()', 0),
(203, 54, 'Prototype (prototipo)', 1),
(204, 54, 'Interfaces', 0),
(205, 54, 'Traits', 0),
(206, 54, 'Namespaces', 0),
(207, 55, 'Funciones que reciben o devuelven otras funciones', 1),
(208, 55, 'Funciones que solo trabajan con números', 0),
(209, 55, 'Funciones definidas dentro de una clase', 0),
(210, 55, 'Funciones que no aceptan parámetros', 0),
(211, 56, 'ES Modules', 1),
(212, 56, 'CommonJS', 0),
(213, 56, 'AMD', 0),
(214, 56, 'UMD', 0),
(215, 57, 'Verdadero', 1),
(216, 57, 'Falso', 0),
(217, 58, 'Impide que se modifiquen las propiedades de un objeto', 1),
(218, 58, 'Elimina el objeto de la memoria', 0),
(219, 58, 'Convierte el objeto en un array', 0),
(220, 58, 'Clona el objeto de forma profunda', 0),
(221, 59, 'Una función que puede pausar y reanudar su ejecución usando yield', 1),
(222, 59, 'Una función que genera números aleatorios', 0),
(223, 59, 'Un tipo de bucle for', 0),
(224, 59, 'Una función que siempre retorna una promesa', 0),
(225, 60, '?. (optional chaining)', 1),
(226, 60, '??', 0),
(227, 60, '&&', 0),
(228, 60, '!!', 0),
(229, 61, 'routes/web.php', 1),
(230, 61, 'app/routes.php', 0),
(231, 61, 'config/routes.php', 0),
(232, 61, 'public/routes.php', 0),
(233, 62, 'php artisan make:controller', 1),
(234, 62, 'php artisan create:controller', 0),
(235, 62, 'php artisan new:controller', 0),
(236, 62, 'php artisan generate:controller', 0),
(237, 63, 'Blade', 1),
(238, 63, 'Twig', 0),
(239, 63, 'Smarty', 0),
(240, 63, 'Handlebars', 0),
(241, 64, 'Eloquent', 1),
(242, 64, 'Doctrine', 0),
(243, 64, 'PDO Manager', 0),
(244, 64, 'QueryBuilder Plus', 0),
(245, 65, 'php artisan make:migration', 1),
(246, 65, 'php artisan make:db', 0),
(247, 65, 'php artisan create:table', 0),
(248, 65, 'php artisan db:new', 0),
(249, 66, '{{ $variable }}', 1),
(250, 66, '<?= $variable ?>', 0),
(251, 66, '{% variable %}', 0),
(252, 66, '{$variable}', 0),
(253, 67, 'all()', 1),
(254, 67, 'getAll()', 0),
(255, 67, 'fetchAll()', 0),
(256, 67, 'list()', 0),
(257, 68, 'Verdadero', 1),
(258, 68, 'Falso', 0),
(259, 69, 'php artisan migrate', 1),
(260, 69, 'php artisan db:migrate', 0),
(261, 69, 'php artisan run:migrations', 0),
(262, 69, 'php artisan migrate:run', 0),
(263, 70, '@extends', 1),
(264, 70, '@include', 0),
(265, 70, '@layout', 0),
(266, 70, '@use', 0),
(267, 71, 'Filtros que procesan las peticiones HTTP antes o después de llegar al controlador', 1),
(268, 71, 'Modelos de base de datos', 0),
(269, 71, 'Archivos de configuración', 0),
(270, 71, 'Plantillas de vistas', 0),
(271, 72, 'Service Provider', 1),
(272, 72, 'Facade', 0),
(273, 72, 'Kernel', 0),
(274, 72, 'Middleware', 0),
(275, 73, 'belongsTo()', 1),
(276, 73, 'hasMany()', 0),
(277, 73, 'hasOne()', 0),
(278, 73, 'belongsToMany()', 0),
(279, 74, 'Colas (Queues)', 1),
(280, 74, 'Middleware', 0),
(281, 74, 'Blade Components', 0),
(282, 74, 'Route Model Binding', 0),
(283, 75, 'Proveer una interfaz estática simplificada a servicios del contenedor', 1),
(284, 75, 'Encapsular consultas SQL directamente', 0),
(285, 75, 'Generar automáticamente controladores', 0),
(286, 75, 'Reemplazar el sistema de rutas', 0),
(287, 76, 'Eventos y Listeners', 1),
(288, 76, 'Middleware', 0),
(289, 76, 'Migraciones', 0),
(290, 76, 'Seeders', 0),
(291, 77, 'Verdadero', 1),
(292, 77, 'Falso', 0),
(293, 78, 'php artisan make:job', 1),
(294, 78, 'php artisan make:queue', 0),
(295, 78, 'php artisan make:task', 0),
(296, 78, 'php artisan create:job', 0),
(297, 79, 'belongsToMany()', 1),
(298, 79, 'hasMany()', 0),
(299, 79, 'hasOneThrough()', 0),
(300, 79, 'morphMany()', 0),
(301, 80, 'php artisan db:seed', 1),
(302, 80, 'php artisan seed:run', 0),
(303, 80, 'php artisan db:fill', 0),
(304, 80, 'php artisan populate', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida_jugador`
--

DROP TABLE IF EXISTS `partida_jugador`;
CREATE TABLE IF NOT EXISTS `partida_jugador` (
  `id_partida_jugador` int NOT NULL AUTO_INCREMENT,
  `id_partida` int NOT NULL,
  `id_usuario` int NOT NULL,
  `puntos_obtenidos` int DEFAULT '0',
  `tiempo_respuesta_promedio` decimal(6,2) DEFAULT NULL,
  `posicion_final` tinyint DEFAULT NULL,
  PRIMARY KEY (`id_partida_jugador`),
  KEY `id_partida` (`id_partida`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida_trivia`
--

DROP TABLE IF EXISTS `partida_trivia`;
CREATE TABLE IF NOT EXISTS `partida_trivia` (
  `id_partida` int NOT NULL AUTO_INCREMENT,
  `id_tema_nivel` int NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  `tipo` enum('individual','multijugador') COLLATE utf8mb4_unicode_ci DEFAULT 'individual',
  PRIMARY KEY (`id_partida`),
  KEY `id_tema_nivel` (`id_tema_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
CREATE TABLE IF NOT EXISTS `pregunta` (
  `id_pregunta` int NOT NULL AUTO_INCREMENT,
  `id_tema_nivel` int NOT NULL,
  `enunciado` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pregunta` enum('opcion_multiple','verdadero_falso') COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_usuario_creador` int NOT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pregunta`),
  KEY `id_tema_nivel` (`id_tema_nivel`),
  KEY `id_usuario_creador` (`id_usuario_creador`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id_pregunta`, `id_tema_nivel`, `enunciado`, `tipo_pregunta`, `id_usuario_creador`, `fecha_creacion`) VALUES
(1, 1, '¿Cómo se declara una variable en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(2, 1, '¿Qué símbolo se usa para iniciar un bloque de código PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(3, 1, '¿Cuál es la función más básica para imprimir texto en pantalla en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(4, 1, '¿Cómo se concatenan cadenas de texto en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(5, 1, '¿Cuál de los siguientes es un array asociativo válido en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(6, 1, '¿Qué función determina si una variable está definida y no es null?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(7, 1, '¿Cuál es el operador de comparación estricta en PHP (compara valor y tipo)?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(8, 1, '¿Qué estructura de control se usa para repetir un bloque de código mientras una condición sea verdadera?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(9, 1, 'PHP es un lenguaje de script que se ejecuta principalmente del lado del servidor.', 'verdadero_falso', 1, '2026-07-19 15:55:45'),
(10, 1, '¿Qué función convierte una cadena a mayúsculas en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(11, 2, '¿Qué extensión de PHP se recomienda actualmente para conectarse a bases de datos de forma orientada a objetos y con soporte multi-motor?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(12, 2, '¿Cuál es la principal ventaja de usar sentencias preparadas (prepared statements)?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(13, 2, '¿Qué método de PDO se usa para ejecutar una consulta preparada con parámetros?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(14, 2, '¿Qué método de PDO obtiene todas las filas resultantes de una consulta?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(15, 2, 'En una sentencia preparada con marcadores nombrados, ¿cómo se identifica un parámetro?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(16, 2, '¿Qué método se usa para iniciar una transacción en PDO?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(17, 2, 'Usar concatenación directa de variables dentro de una consulta SQL es una práctica segura.', 'verdadero_falso', 1, '2026-07-19 15:55:45'),
(18, 2, '¿Qué método de PDO revierte los cambios de una transacción si ocurre un error?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(19, 2, '¿Cuál es el método para obtener el último ID insertado en PDO?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(20, 2, '¿Qué tipo de JOIN devuelve solo las filas que tienen coincidencia en ambas tablas?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(21, 3, '¿Qué palabra clave se usa en PHP para definir una interfaz?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(22, 3, '¿Qué permite reutilizar métodos entre clases sin usar herencia múltiple en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(23, 3, '¿Qué palabra clave se usa para que una clase herede de otra en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(24, 3, '¿Qué modificador permite acceder a una propiedad o método sin instanciar la clase?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(25, 3, '¿Qué mecanismo permite capturar y manejar errores en tiempo de ejecución en PHP?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(26, 3, '¿Qué palabra clave evita que una clase pueda ser heredada?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(27, 3, 'Una clase abstracta en PHP puede ser instanciada directamente.', 'verdadero_falso', 1, '2026-07-19 15:55:45'),
(28, 3, '¿Qué patrón de diseño garantiza que una clase tenga una única instancia?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(29, 3, '¿Qué función estándar se usa para registrar un autoloader de clases en PHP (base de PSR-4 con Composer)?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(30, 3, '¿Qué visibilidad permite que un método sea accedido solo desde la misma clase y sus clases hijas?', 'opcion_multiple', 1, '2026-07-19 15:55:45'),
(31, 4, '¿Qué palabra clave se recomienda actualmente para declarar variables cuyo valor no cambiará?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(32, 4, '¿Qué método se usa para mostrar un mensaje en la consola del navegador?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(33, 4, '¿Cuál es el resultado de typeof \"hola\" en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(34, 4, '¿Qué método agrega un elemento al final de un array?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(35, 4, '¿Qué operador se usa para comparar valor y tipo en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(36, 4, '¿Qué estructura se usa para ejecutar código solo si una condición se cumple?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(37, 4, 'En JavaScript, \'let\' tiene alcance de bloque (block scope).', 'verdadero_falso', 1, '2026-07-19 15:55:46'),
(38, 4, '¿Qué método selecciona un elemento del DOM por su id?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(39, 4, '¿Cómo se define correctamente una función flecha (arrow function) en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(40, 4, '¿Cuál es el valor de Boolean(0) en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(41, 5, '¿Qué es una closure (clausura) en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(42, 5, '¿Qué método transforma cada elemento de un array y devuelve un nuevo array?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(43, 5, '¿Qué método filtra los elementos de un array según una condición?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(44, 5, '¿Qué representa una Promise en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(45, 5, '¿Qué técnica permite extraer valores de un array u objeto en variables individuales?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(46, 5, '¿Qué hace el operador spread (...) con un array?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(47, 5, 'El método reduce() de un array siempre devuelve un array.', 'verdadero_falso', 1, '2026-07-19 15:55:46'),
(48, 5, '¿Qué valor de \'this\' tiene una función flecha (arrow function)?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(49, 5, '¿Qué método convierte un array en un solo valor acumulado?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(50, 5, '¿Cómo se declara una plantilla de cadena (template literal) en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(51, 6, '¿Qué palabra clave se usa junto con async para esperar la resolución de una promesa?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(52, 6, '¿Qué es el Event Loop en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(53, 6, '¿Qué método permite ejecutar múltiples promesas en paralelo y esperar a que todas se resuelvan?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(54, 6, '¿Qué mecanismo permite a los objetos de JavaScript heredar propiedades de otros objetos?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(55, 6, '¿Qué son las funciones de orden superior (higher order functions)?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(56, 6, '¿Qué sistema de módulos usa las palabras clave import y export de forma nativa?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(57, 6, 'JavaScript es un lenguaje de un solo hilo (single-threaded) en su ejecución principal.', 'verdadero_falso', 1, '2026-07-19 15:55:46'),
(58, 6, '¿Qué hace el método Object.freeze()?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(59, 6, '¿Qué es un generator (función generadora) en JavaScript?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(60, 6, '¿Qué operador se usa para acceder de forma segura a propiedades anidadas que podrían no existir?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(61, 7, '¿Qué archivo define las rutas web principales de una aplicación Laravel?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(62, 7, '¿Qué comando de Artisan crea un nuevo controlador?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(63, 7, '¿Qué motor de plantillas usa Laravel por defecto?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(64, 7, '¿Qué componente de Laravel se usa para el mapeo objeto-relacional (ORM)?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(65, 7, '¿Qué comando de Artisan genera una nueva migración?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(66, 7, '¿Cuál es la sintaxis correcta de Blade para imprimir una variable escapada?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(67, 7, '¿Qué método de Eloquent obtiene todos los registros de un modelo?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(68, 7, 'En Laravel, el archivo .env se usa para almacenar variables de entorno y configuración sensible.', 'verdadero_falso', 1, '2026-07-19 15:55:46'),
(69, 7, '¿Qué comando ejecuta las migraciones pendientes?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(70, 7, '¿Qué directiva de Blade se usa para extender una plantilla base?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(71, 8, '¿Qué son los Middleware en Laravel?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(72, 8, '¿Qué clase se usa para registrar servicios y enlaces en el contenedor de Laravel?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(73, 8, '¿Qué tipo de relación de Eloquent se usa cuando un modelo pertenece a otro (relación inversa de uno a muchos)?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(74, 8, '¿Qué sistema de Laravel permite ejecutar tareas en segundo plano fuera del ciclo de solicitud-respuesta?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(75, 8, '¿Qué patrón implementan las Facades de Laravel?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(76, 8, '¿Qué mecanismo de Laravel permite reaccionar a acciones del sistema, como el registro de un usuario, de forma desacoplada?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(77, 8, 'El Route Model Binding permite inyectar automáticamente una instancia de modelo en un controlador según el parámetro de la ruta.', 'verdadero_falso', 1, '2026-07-19 15:55:46'),
(78, 8, '¿Qué comando de Artisan crea un nuevo Job para las colas?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(79, 8, '¿Qué relación de Eloquent se usa para una relación muchos a muchos?', 'opcion_multiple', 1, '2026-07-19 15:55:46'),
(80, 8, '¿Qué comando de Artisan sirve para poblar la base de datos con datos de prueba mediante Seeders?', 'opcion_multiple', 1, '2026-07-19 15:55:46');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `premio`
--

DROP TABLE IF EXISTS `premio`;
CREATE TABLE IF NOT EXISTS `premio` (
  `id_premio` int NOT NULL AUTO_INCREMENT,
  `nombre_premio` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ponderacion_puntos` int NOT NULL,
  `id_nivel` int DEFAULT NULL,
  `id_tema` int DEFAULT NULL,
  PRIMARY KEY (`id_premio`),
  KEY `id_nivel` (`id_nivel`),
  KEY `id_tema` (`id_tema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_encuesta`
--

DROP TABLE IF EXISTS `respuesta_encuesta`;
CREATE TABLE IF NOT EXISTS `respuesta_encuesta` (
  `id_respuesta_encuesta` int NOT NULL AUTO_INCREMENT,
  `id_encuesta` int NOT NULL,
  `nombre_contacto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `respuesta_texto` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_respuesta_encuesta`),
  KEY `id_encuesta` (`id_encuesta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta_usuario`
--

DROP TABLE IF EXISTS `respuesta_usuario`;
CREATE TABLE IF NOT EXISTS `respuesta_usuario` (
  `id_respuesta_usuario` int NOT NULL AUTO_INCREMENT,
  `id_partida_jugador` int NOT NULL,
  `id_pregunta` int NOT NULL,
  `id_opcion_seleccionada` int NOT NULL,
  `es_correcta` tinyint(1) DEFAULT '0',
  `tiempo_respuesta` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_respuesta_usuario`),
  KEY `id_partida_jugador` (`id_partida_jugador`),
  KEY `id_pregunta` (`id_pregunta`),
  KEY `id_opcion_seleccionada` (`id_opcion_seleccionada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(3, 'administrador'),
(2, 'armador'),
(1, 'jugador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema`
--

DROP TABLE IF EXISTS `tema`;
CREATE TABLE IF NOT EXISTS `tema` (
  `id_tema` int NOT NULL AUTO_INCREMENT,
  `nombre_tema` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_tema`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tema`
--

INSERT INTO `tema` (`id_tema`, `nombre_tema`, `descripcion`) VALUES
(1, 'PHP', 'Fundamentos y buenas prácticas de PHP'),
(2, 'JavaScript', 'Programación en el navegador y lógica de scripting'),
(3, 'Laravel', 'Framework PHP para desarrollo web moderno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tema_nivel`
--

DROP TABLE IF EXISTS `tema_nivel`;
CREATE TABLE IF NOT EXISTS `tema_nivel` (
  `id_tema_nivel` int NOT NULL AUTO_INCREMENT,
  `id_tema` int NOT NULL,
  `id_nivel` int NOT NULL,
  `nombre_especifico` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tema_nivel`),
  UNIQUE KEY `uq_tema_nivel` (`id_tema`,`id_nivel`),
  KEY `id_nivel` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tema_nivel`
--

INSERT INTO `tema_nivel` (`id_tema_nivel`, `id_tema`, `id_nivel`, `nombre_especifico`) VALUES
(1, 1, 1, 'PHP Básico'),
(2, 1, 2, 'PHP Intermedio (Bases de Datos)'),
(3, 1, 3, 'PHP Avanzado'),
(4, 2, 1, 'JavaScript Básico'),
(5, 2, 2, 'JavaScript Intermedio'),
(6, 2, 3, 'JavaScript Avanzado'),
(7, 3, 2, 'Laravel Intermedio'),
(8, 3, 3, 'Laravel Avanzado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apodo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cedula` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_rol` int NOT NULL,
  `puntos_totales` int DEFAULT '0',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado` enum('activo','inactivo','bloqueado') COLLATE utf8mb4_unicode_ci DEFAULT 'activo',
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `apodo` (`apodo`),
  UNIQUE KEY `cedula` (`cedula`),
  UNIQUE KEY `correo` (`correo`),
  KEY `id_rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `apodo`, `cedula`, `correo`, `password_hash`, `avatar`, `id_rol`, `puntos_totales`, `fecha_registro`, `estado`) VALUES
(1, 'Administrador', 'admin', '8-888-8888', 'admin@trivias.com', '$2y$10$3RlZ/hGJfPKbhm1.RVQVUu0mw.PRIa5nGwk1dmBenk6ggycKlPLni', NULL, 3, 0, '2026-07-19 15:43:27', 'activo'),
(2, 'Usuario Prueba', 'jugador', '8-111-1111', 'user@trivias.com', '$2y$10$UkBUTNznyTdWD8A7qB5vceWLOmntTfe3kouTZe9/TcMoeRIO733r2', NULL, 1, 0, '2026-07-19 15:43:27', 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_premio`
--

DROP TABLE IF EXISTS `usuario_premio`;
CREATE TABLE IF NOT EXISTS `usuario_premio` (
  `id_usuario_premio` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_premio` int NOT NULL,
  `fecha_obtenido` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario_premio`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_premio` (`id_premio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_progreso`
--

DROP TABLE IF EXISTS `usuario_progreso`;
CREATE TABLE IF NOT EXISTS `usuario_progreso` (
  `id_progreso` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `id_tema_nivel` int NOT NULL,
  `estado` enum('bloqueado','en_curso','aprobado') COLLATE utf8mb4_unicode_ci DEFAULT 'bloqueado',
  `mejor_porcentaje` tinyint DEFAULT '0',
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `tiempo_transcurrido` int DEFAULT NULL,
  PRIMARY KEY (`id_progreso`),
  UNIQUE KEY `uq_usuario_tema_nivel` (`id_usuario`,`id_tema_nivel`),
  KEY `id_tema_nivel` (`id_tema_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_avance_usuarios`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_avance_usuarios`;
CREATE TABLE IF NOT EXISTS `vista_avance_usuarios` (
`apodo` varchar(50)
,`estado` enum('bloqueado','en_curso','aprobado')
,`fecha_fin` datetime
,`fecha_inicio` datetime
,`id_usuario` int
,`nombre` varchar(100)
,`nombre_especifico` varchar(120)
,`tiempo_transcurrido` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estadisticas_temas`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `vista_estadisticas_temas`;
CREATE TABLE IF NOT EXISTS `vista_estadisticas_temas` (
`id_tema` int
,`nombre_tema` varchar(80)
,`porcentaje_aciertos` decimal(9,2)
,`veces_jugado` bigint
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_avance_usuarios`
--
DROP TABLE IF EXISTS `vista_avance_usuarios`;

DROP VIEW IF EXISTS `vista_avance_usuarios`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_avance_usuarios`  AS SELECT `u`.`id_usuario` AS `id_usuario`, `u`.`nombre` AS `nombre`, `u`.`apodo` AS `apodo`, `tn`.`nombre_especifico` AS `nombre_especifico`, `up`.`estado` AS `estado`, `up`.`fecha_inicio` AS `fecha_inicio`, `up`.`fecha_fin` AS `fecha_fin`, `up`.`tiempo_transcurrido` AS `tiempo_transcurrido` FROM ((`usuario` `u` join `usuario_progreso` `up` on((`up`.`id_usuario` = `u`.`id_usuario`))) join `tema_nivel` `tn` on((`tn`.`id_tema_nivel` = `up`.`id_tema_nivel`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estadisticas_temas`
--
DROP TABLE IF EXISTS `vista_estadisticas_temas`;

DROP VIEW IF EXISTS `vista_estadisticas_temas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estadisticas_temas`  AS SELECT `t`.`id_tema` AS `id_tema`, `t`.`nombre_tema` AS `nombre_tema`, count(distinct `pt`.`id_partida`) AS `veces_jugado`, round((avg(`ru`.`es_correcta`) * 100),2) AS `porcentaje_aciertos` FROM ((((`tema` `t` join `tema_nivel` `tn` on((`tn`.`id_tema` = `t`.`id_tema`))) join `partida_trivia` `pt` on((`pt`.`id_tema_nivel` = `tn`.`id_tema_nivel`))) join `partida_jugador` `pj` on((`pj`.`id_partida` = `pt`.`id_partida`))) join `respuesta_usuario` `ru` on((`ru`.`id_partida_jugador` = `pj`.`id_partida_jugador`))) GROUP BY `t`.`id_tema`, `t`.`nombre_tema` ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `intento_login`
--
ALTER TABLE `intento_login`
  ADD CONSTRAINT `intento_login_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `like_tema`
--
ALTER TABLE `like_tema`
  ADD CONSTRAINT `like_tema_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `like_tema_ibfk_2` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD CONSTRAINT `mensaje_ibfk_1` FOREIGN KEY (`id_emisor`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `mensaje_ibfk_2` FOREIGN KEY (`id_receptor`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `opcion_respuesta`
--
ALTER TABLE `opcion_respuesta`
  ADD CONSTRAINT `opcion_respuesta_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`);

--
-- Filtros para la tabla `partida_jugador`
--
ALTER TABLE `partida_jugador`
  ADD CONSTRAINT `partida_jugador_ibfk_1` FOREIGN KEY (`id_partida`) REFERENCES `partida_trivia` (`id_partida`),
  ADD CONSTRAINT `partida_jugador_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `partida_trivia`
--
ALTER TABLE `partida_trivia`
  ADD CONSTRAINT `partida_trivia_ibfk_1` FOREIGN KEY (`id_tema_nivel`) REFERENCES `tema_nivel` (`id_tema_nivel`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_tema_nivel`) REFERENCES `tema_nivel` (`id_tema_nivel`),
  ADD CONSTRAINT `pregunta_ibfk_2` FOREIGN KEY (`id_usuario_creador`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `premio`
--
ALTER TABLE `premio`
  ADD CONSTRAINT `premio_ibfk_1` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_conocimiento` (`id_nivel`),
  ADD CONSTRAINT `premio_ibfk_2` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`);

--
-- Filtros para la tabla `respuesta_encuesta`
--
ALTER TABLE `respuesta_encuesta`
  ADD CONSTRAINT `respuesta_encuesta_ibfk_1` FOREIGN KEY (`id_encuesta`) REFERENCES `encuesta` (`id_encuesta`);

--
-- Filtros para la tabla `respuesta_usuario`
--
ALTER TABLE `respuesta_usuario`
  ADD CONSTRAINT `respuesta_usuario_ibfk_1` FOREIGN KEY (`id_partida_jugador`) REFERENCES `partida_jugador` (`id_partida_jugador`),
  ADD CONSTRAINT `respuesta_usuario_ibfk_2` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id_pregunta`),
  ADD CONSTRAINT `respuesta_usuario_ibfk_3` FOREIGN KEY (`id_opcion_seleccionada`) REFERENCES `opcion_respuesta` (`id_opcion`);

--
-- Filtros para la tabla `tema_nivel`
--
ALTER TABLE `tema_nivel`
  ADD CONSTRAINT `tema_nivel_ibfk_1` FOREIGN KEY (`id_tema`) REFERENCES `tema` (`id_tema`),
  ADD CONSTRAINT `tema_nivel_ibfk_2` FOREIGN KEY (`id_nivel`) REFERENCES `nivel_conocimiento` (`id_nivel`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);

--
-- Filtros para la tabla `usuario_premio`
--
ALTER TABLE `usuario_premio`
  ADD CONSTRAINT `usuario_premio_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `usuario_premio_ibfk_2` FOREIGN KEY (`id_premio`) REFERENCES `premio` (`id_premio`);

--
-- Filtros para la tabla `usuario_progreso`
--
ALTER TABLE `usuario_progreso`
  ADD CONSTRAINT `usuario_progreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `usuario_progreso_ibfk_2` FOREIGN KEY (`id_tema_nivel`) REFERENCES `tema_nivel` (`id_tema_nivel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
