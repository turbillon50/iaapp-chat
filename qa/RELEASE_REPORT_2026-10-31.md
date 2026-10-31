# IA.app CHAT — publicación técnica verificable (31-oct-2026)

**Producto:** mensajero real FluffyChat/Matrix con licencia AGPL-3.0-or-later, marca IA.app.
**URL del cliente:** https://vchat.vforge.site/iaapp/
**API Matrix:** https://vchat.vforge.site/_matrix/client/versions
**Revisión Flutter publicada:** `434b47a7c9415537044513ee0115c90f435e77fc`.
**CI exitoso:** https://github.com/turbillon50/iaapp-chat/actions/runs/41236751529

## Comprobado directamente

- 689 archivos FluffyChat importados y mantenidos como motor funcional, sin recrear mensajes a partir de mockups.
- Flutter Web compilado en GitHub Actions con runtime JS/WASM de Vodozemac e imágenes incluido, hashes de recursos en `client/RUNTIME_ASSETS.sha256`.
- HTTPS de IA.app, Flutter bootstrap, recursos criptográficos y servicio Matrix devuelven HTTP 200 con tipos MIME correctos.
- En Playwright/Chrome móvil 390×844: splash aprobado, acceso oscuro «Entrar a mi cuenta» y llamadas reales al homeserver Matrix.
- Al no existir cuentas de usuario vinculadas, la pantalla de login no equivale a una conversación entre personas.
- La aplicación preexistente en la raíz de `vchat.vforge.site/` conserva HTTP 200. `iaapp.live` y su MCP no se alteraron.

## Evidencia visual

- [Bienvenida 390×844](evidence/2026-10-31-welcome-mobile-390x844.png)
- [Acceso 390×844](evidence/2026-10-31-login-mobile-390x844.png)

## Infraestructura y rollback

- Continuwuity ejecutándose en Hetzner como `iaapp-chat-homeserver-1`, servicio aislado `127.0.0.1:4955`.
- Web publicada mediante enlace `/var/www/iaapp-chat` al artefacto `/var/www/iaapp-chat-release-434b47a`.
- Artefacto anterior preservado en `/var/www/iaapp-chat-release-ab3ac2f`; existe respaldo de configuración Nginx.
- `chat.iaapp.live` es el server_name Matrix pero **no tiene DNS** todavía; la API actual utiliza el host operativo `vchat.vforge.site`.
- Registro público desactivado. Discos de Hetzner al 97%: se requiere espacio y backup externo antes de escalar.

## No aprobado

Identidad Better Auth ↔ Matrix, login oficial ChatGPT/Gemini, alta de Luis o Acevedo, dos usuarios intercambiando mensajes, federación con segundo servidor, backups probados, notificaciones, push, cifrado de extremo a extremo certificado y aceptación comercial.

La primera cuenta administrativa debe activarse por el operador con el procedimiento oficial; no se imprimen ni manipulan credenciales existentes. Concluir solo después de probar dos usuarios, persistencia tras reconectar, permisos y restauración.

El estado de esta entrega es **cliente real publicado, acceso técnico operativo; sistema multiusuario integrado aún pendiente**. No debe anunciarse como completo.
