# Sistema de Trivias

Aplicación web para reforzar y evaluar el aprendizaje mediante trivias
organizadas por temas y niveles de dificultad progresiva, con elementos de
gamificación (puntos, rankings, avatares y premios).

---

## 1. Información General y Evidencia Práctica

**1.1. Nombre del Proyecto:** Sistema de Trivias

**1.2. Integrantes del Equipo:**

| Nombre | Cédula | Rol en el desarrollo |
|--------|--------|----------------------|
| Carlos Abadia | 4-823-2233 | Lógica del negocio y módulos |
| David Cordoba | 8-1009-1486 | Backend y bases de datos |
| Ruben Spagnuolo | 8-1024-1715 | Frontend y documentación |

**Grupo:** 1GS132 &nbsp;•&nbsp; **Facilitador:** Ing. Irina Fong

**1.3. Fecha y Versión:** v1.0.0 — Julio 2026

**1.4. Demostración en Video:** ⟨URL del video (YouTube / Drive)⟩

En el video se sustenta el proyecto, ejecuta el sistema y demuestra el
funcionamiento real de las pantallas y las validaciones de seguridad (login,
bloqueo por intentos, protección CSRF y sello de integridad).

---

## 2. Requisitos de Infraestructura

**2.1. Entorno de Ejecución:**

- **PHP** 8.0 o superior (extensiones `pdo`, `pdo_mysql`, `mbstring`)
- **Base de datos:** MySQL 5.7+ / MariaDB 10.4+ (motor InnoDB, `utf8mb4`)
- **Servidor local sugerido:** WAMP (también funciona en XAMPP / Laragon)

No requiere Composer ni dependencias externas de PHP. Las librerías del
frontend (jQuery, DataTables, qrcodejs) se cargan por CDN.

**2.2. Guía de Despliegue Rápido:**

1. Clonar el repositorio dentro de la carpeta pública del servidor
   (`www` en WAMP o `htdocs` en XAMPP):
```bash
   git clone ⟨URL de GitHub⟩
```

2. Crear la base de datos importando los scripts **en este orden**
   (desde phpMyAdmin → Importar):
sistema_trivias_bd.sql   → estructura, vistas y datos base

usuarios_seed.sql        → usuarios de prueba (admin y jugador)

preguntas_seed.sql       → 80 preguntas de ejemplo (10 por nivel)

3. Configurar las credenciales locales en `config/config.php`
   (por defecto: host `127.0.0.1`, base `sistema_trivias`, usuario `root`,
   sin contraseña).

4. Acceder desde el navegador, por ejemplo:
   `http://localhost/sistema_trivias/`

> **Backup de la base de datos:** los scripts `sistema_trivias_bd.sql`,
> `usuarios_seed.sql` y `preguntas_seed.sql` incluidos en el repositorio
> contienen la estructura completa y los datos semilla para pruebas rápidas.

---

## 3. Matriz de Roles y Credenciales de Prueba

| Rol de Usuario | Usuario de Acceso | Contraseña | Permisos / Qué puede hacer |
|----------------|-------------------|------------|-----------------------------|
| **Administrador** | admin@trivias.com | Admin123* | Control total: gestión de usuarios, temas, preguntas, premios y avatares; reportes y auditoría. |
| **Jugador** | user@trivias.com | User123* | Jugar trivias, avanzar por niveles, elegir avatar, calificar temas y ver el ranking. |

---

## 4. Directrices Técnicas y Reglas del Backend

**4.1. Control de Acceso Seguro:**

- **Validación de contraseñas** de 8 a 12 caracteres (con mayúscula, minúscula
  y número) → `utils/Validador.php` (método `validarPassword()`).
- **Bloqueo automático** de la cuenta al 3er intento fallido (15 min) →
  `auth/AuthService.php`.
- **Auditoría** de todos los accesos (IP, fecha, resultado) en la tabla de logs
  `intento_login` → registrada desde `auth/AuthService.php`.

**4.2. Mitigación OWASP y DRY:**

- **Tokens CSRF** en todos los formularios POST, para bloquear peticiones
  forjadas desde herramientas externas como Postman → clase `utils/Csrf.php`
  (genera el token en las vistas y lo valida en los controladores `procesar_*.php`).
- Consultas preparadas con PDO contra inyección SQL, sanitización centralizada
  de entradas (`utils/Validador.php`) y carga única de clases vía `bootstrap.php`
  para evitar código duplicado (DRY).

**4.3. Sello de Integridad (Firma Digital):**

Al finalizar una partida, el backend calcula una firma **HMAC-SHA256** sobre los
datos críticos del resultado (jugador y puntos obtenidos) usando una clave
secreta, y la guarda en la columna `firma` de `partida_jugador`. Si alguien
altera los puntos directamente en la base de datos, la firma deja de coincidir
y la manipulación se detecta.
→ Clase `utils/SelloIntegridad.php`; implementado en `juego/JuegoService.php`
(`finalizarPartida()` firma el registro y `verificarIntegridadPartida()` lo valida).

---

## 5. Manual de Usuario Operativo

**5.1. Guía Visual (flujo básico):**

1. **Regístrate** desde la página pública (nombre, cédula, correo y contraseña),
   o inicia sesión con un usuario de prueba.
2. **Agregar / Buscar / Modificar contenido** (como administrador): desde el
   panel puedes gestionar usuarios, temas, preguntas, premios y avatares.
3. **Jugar:** elige un tema y empieza por el nivel básico; los niveles avanzados
   se desbloquean al aprobar el anterior con 70% o más.
4. **Resultado:** al terminar verás tu puntaje, una imagen según tu desempeño y
   los premios ganados.
5. **Progreso y ranking:** consulta tu avance, tus puntos y tu posición frente a
   otros jugadores; personaliza tu avatar y califica los temas.

>  El **manual de usuario completo con capturas de pantalla** paso a paso se
> encuentra en la documentación formal del proyecto (disponible en Moodle) y en el repositorio como archivo .pdf.

---

## Resumen de requisitos cumplidos

| # | Requisito |
|---|-----------|
| 1 | Login con control de errores, jQuery DataTable y cédula no editable |
| 2 | Módulo de usuarios (CRUD) |
| 3 | CRUD de temas con niveles |
| 4 | Avance secuencial (no pasar de nivel sin aprobar el anterior) | 
| 5 | Módulo de premios con otorgamiento automático | 
| 6 | Tipos de pregunta: opción múltiple y verdadero/falso |
| 7 | CRUD de avatares con campo "Activo" (baja lógica) | 
| 8 | Ver puntos, barra de progreso y avance de otros jugadores | 
| 9 | Preguntas alineadas al tema y nivel | 
| 10 | Acceso a las trivias mediante código QR | 
| 11 | Conexión a la base de datos mediante una clase (Singleton) | 
| 12 | Control de errores centralizado (visible en desarrollo) | 
| 13 | Clase de validación y sanitización de datos | 
| 14 | Uso de interfaces en el proyecto | 
| 15 | Reporte de jugadores con exportación a Excel | 
| 16 | Imágenes animadas según el número de aciertos | 
| 17 | Página pública (información, importancia, noticias y contactos) | 
| 18 | Calificación de temas y sugerencia de nuevos temas | 
| 19 | Registro público, jugar, selección de tema y acceso por QR | 

**Seguridad adicional:** contraseñas cifradas con bcrypt, protección CSRF,
sello de integridad HMAC-SHA256, bloqueo por intentos y bitácora de auditoría.
