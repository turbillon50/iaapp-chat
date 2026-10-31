# IA.app CHAT — contrato maestro de producción
Fecha: 2026-10-31. Coordinación: revisión central de los cinco frentes. Producto: mensajero real para humanos e IAs.

## Decisión de producto
IA.app CHAT es un **chat**. La primera pantalla real tras autenticar es la bandeja de conversaciones. Personas y agentes se distinguen por tipo y permisos, pero aparecen como participantes en chats directos y grupos. El cliente puede invitar a amigos, colaboradores y, con aislamiento, grupos corporativos.

## Decisiones cerradas
- Splash visual aprobado: negro absoluto, triángulo blanco invertido pequeño, "IA.app", microtexto "CHAT", "TOCA PARA COMENZAR"; sin fondos planetarios, degradados, brillos, relieves, mosaicos ni exceso de texto.
- Dos personas reales (Luis y Acevedo) deben poder enviarse mensajes desde teléfonos distintos y desde servidores federados autorizados.
- Usar FluffyChat **real** (Flutter, licencia AGPL-3.0-or-later) como base del cliente; Matrix como red de mensajería; no recrear un chat con mocks ni Open WebUI.
- Respetar avisos de terceros y ofrecer código fuente correspondiente AGPL para el cliente distribuido/modificado.
- Mantener `turbillon50/IA` y `https://iaapp.live/mcp` sin cambios destructivos; conservar identidad Better Auth, número personal persistente (primera cuenta 100000) y el logro de `get_my_profile`.
- Integración de login con proveedor: **OAuth de IAapp desde ChatGPT a MCP no es Sign in with ChatGPT oficial**, ni brinda el historial. Si se desarrolla acceso mediante challenge MCP, etiquetarlo con honestidad. Gemini/Google requieren validación propia y feature flag; no inventar cuentas ni permisos.
- No afirmar cifrado de extremo a extremo en el producto hasta probarlo de extremo a extremo en clientes reales incluyendo bots y restauración de claves. Las IAs participantes son destinatarios autorizados, no lectores de salas ajenas.
- En producción no almacenar tokens o cookies en repositorio/logs, no usar contraseñas reales como fixtures, no copiar datos de clientes para pruebas.

## Frentes, propiedad y límites
1. **Cliente Flutter / FluffyChat**: incorporar código upstream fijado a commit o tag, preservando LICENSE/NOTICE; crear PR propio, sin force-push. Conservar funciones, no editar backend IAapp.
2. **Diseño Craft**: tema, componentes, splash y login de IA.app CHAT siguiendo `design/VISUAL_CONTRACT.md`, sin botones falsos ni cambios en criptografía. PR independiente después del baseline.
3. **Identidad / accesos**: investigar/implementar puente seguro Better Auth ↔ Matrix, numeración/links, autorización de cuentas, challenge ChatGPT MCP como mecanismo distinguible del login oficial; no tocar cuentas Luis ni despliegues reales. PR aislada en repo adecuado.
4. **Infraestructura / federación**: auditar solo lectura Hetzner, Matrix Synapse y DNS, proxy TLS, recursos, backups, federación con Casa Acevedo. No instalar, recargar, borrar ni cambiar rutas de producción sin inventario y plan de rollback aprobado.
5. **QA / integración y release**: pruebas de dos personas, mensajes en ambos sentidos, histórico tras reinicio, revocación, navegación a 390px/iPhone, errores, cifrado verificado, regresión `get_my_profile`, matriz de versiones y despliegue reversible. No calificar éxito con una sola cuenta.

## Forma de entrega
Cada frente registra SHA exacto, URL de PR, pruebas realmente ejecutadas, bloqueos y evidencia. Trabajar en ramas separadas; coordinar dependencias; nada de merges sin CI ni tests; hacer merge a main tras revisión, sin ramas abandonadas. Se despliega sobre dominio productivo solo después de respaldo, smoke tests y rollback disponibles. El cliente no debe verse "listo" si el backend no responde.

## Hito 1 (criterio comercial)
Una instalación real, con marca IA.app, permite que Luis y Acevedo entren con identidades distintas, inicien un chat privado, envíen/reciban sin actualizar manualmente, consulten mensajes persistentes tras reconectar y mantengan permisos correctos. Las IAs son participantes posteriores, habilitados conforme se conecten; no fingir que están activas.

## Fuente de verdad
- Cliente: https://github.com/turbillon50/iaapp-chat
- Núcleo: https://github.com/turbillon50/IA
- Upstream: https://github.com/krille-chan/fluffychat
- Producto existente: https://iaapp.live
- Nota: PR #4 de `turbillon50/IA` es un experimento distinto (astro-chat) que permanece en revisión; no mezclarlo ni reemplazarlo silenciosamente con el cliente Flutter.
