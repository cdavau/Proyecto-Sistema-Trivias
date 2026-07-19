# Sistema de Trivias

Aplicación web para reforzar y evaluar el aprendizaje mediante trivias organizadas
por temas y niveles de dificultad progresiva, con elementos de gamificación
(puntos, rankings, avatares y premios).

**Grupo:** 1GS132 &nbsp;•&nbsp; **Facilitador:** Ing. Irina Fong

**Integrantes:** 
Carlos Abadia 4-823-2233.
David Cordoba 8-1009-1486.
Ruben Spagnuolo 8-1024-1715.

---

## Enlaces

- **Video explicativo del proyecto:** ⟨URL del video⟩

---

## Tecnologías

- **Backend:** PHP 8.3.28  (orientado a objetos, arquitectura por capas)
- **Base de datos:** MySQL 8.4.7 (motor InnoDB, `utf8mb4`)
- **Acceso a datos:** PDO con sentencias preparadas
- **Frontend:** HTML5, CSS3, JavaScript, jQuery + DataTables, qrcodejs (vía CDN)
- **Servidor:** Apache 2.4.65 WAMP

No requiere Composer ni dependencias de PHP externas.

---

## Requisitos previos

- PHP 8.0 o superior con las extensiones `pdo`, `pdo_mysql` y `mbstring`
- MySQL o MariaDB
- Un servidor Apache local (WAMP, XAMPP o Laragon)

---

## Instalación

1. **Clonar el repositorio** dentro de la carpeta pública del servidor
   (`www` en WAMP o `htdocs` en XAMPP):
```bash
   git clone ⟨URL de GitHub⟩
```

2. **Crear la base de datos.** Desde phpMyAdmin o la consola de MySQL, ejecutar
   los scripts en este orden:
    sistema_trivias_bd.sql  = crea la BD, tablas, vistas y datos base
    preguntas_seed.sql      = carga 80 preguntas de ejemplo (10 por nivel)

3. **Configurar la conexión** en `config/config.php` si sus datos difieren
   (por defecto: host `127.0.0.1`, base `sistema_trivias`, usuario `root`, sin contraseña).

4. **Acceder** desde el navegador a la carpeta del proyecto.
   `http://localhost/sistema_trivias/`

5. **Registrar el primer usuario** desde la página pública. Para obtener un
   usuario administrador, cambia su `id_rol` a `3` directamente en la tabla `usuario`.

> Si se actualiza una base de datos de una versión anterior, ejecutar también
> los scripts de migración: `migracion_cedula.sql`, `migracion_avatares.sql`
> y `migracion_progreso.sql`.

---

## Estructura del proyecto
```
sistema_trivias/
├── config/         → conexión (Database) y configuración de entorno
├── interfaces/     → contratos de los servicios (11 interfaces)
├── utils/          → validación, roles, sesión y manejo de errores
├── exceptions/     → excepciones personalizadas
├── auth/           → autenticación
├── usuarios/       → gestión de usuarios
├── temas/          → gestión de temas y niveles
├── preguntas/      → gestión de preguntas y opciones
├── premios/        → gestión de premios
├── avatares/       → gestión del catálogo de avatares
├── encuestas/      → encuestas de la página pública
├── reportes/       → estadísticas y reportes
├── juego/          → lógica del juego y ranking
├── includes/       → vistas parciales reutilizables
├── assets/         → estilos CSS
└── .php           → páginas (vistas) y controladores (procesar_.php)
```

Arquitectura por capas: **Vistas** (páginas `.php`) → **Controladores**
(`procesar_*.php`) → **Servicios** (lógica de negocio) → **Base de datos**,
aplicando los principios SOLID.

---

## Resumen de requisitos cumplidos

| # | Requisito |
|---|-----------|
| 1 | Login con control de errores, jQuery DataTable y cédula no editable 
| 2 | Módulo de usuarios (CRUD) 
| 3 | CRUD de temas con niveles 
| 4 | Avance secuencial (no pasar de nivel sin aprobar el anterior) 
| 5 | Módulo de premios (con otorgamiento automático) 
| 6 | Tipos de pregunta: opción múltiple y verdadero/falso 
| 7 | CRUD de avatares con campo "Activo" (baja lógica) 
| 8 | Ver puntos, barra de progreso y avance de otros jugadores 
| 9 | Preguntas alineadas al tema y nivel
| 10 | Acceso a las trivias mediante código QR 
| 11 | Conexión a la base de datos mediante una clase (Singleton) 
| 12 | Control de errores centralizado (visible en desarrollo)
| 13 | Clase de validación y sanitización de datos 
| 14 | Uso de interfaces en el proyecto 
| 15 | Reporte de jugadores con exportación a Excel
| 16 | Imágenes animadas según el número de aciertos 
| 17 | Página pública (información, importancia, noticias y contactos)
| 18 | Calificación de temas y sugerencia de nuevos temas
| 19 | Registro público, jugar, selección de tema y acceso por QR 

**Mejoras recomendadas para producción:** tokens anti-CSRF en formularios y
firmas digitales / hash de integridad en tablas críticas.

---

## Seguridad

- Contraseñas cifradas con `bcrypt` (nunca en texto plano)
- Sentencias preparadas (PDO) contra inyección SQL
- Validación y sanitización centralizada de entradas
- Bloqueo temporal tras 3 intentos fallidos de login
- Bitácora de auditoría de accesos (IP, fecha, resultado)
- Mensajes de error genéricos que no exponen detalles internos
