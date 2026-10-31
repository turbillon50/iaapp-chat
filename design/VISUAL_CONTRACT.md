# IA.app CHAT — contrato visual aprobado (2026-10-31)

## Splash, NO reinterpretar
Referencia aprobada en conversación: imagen minimalista negro puro, triángulo invertido blanco de tamaño contenido, nombre «IA.app» y palabra «CHAT», microtexto inferior «TOCA PARA COMENZAR». Se descartaron versiones grandes, neón, planetas, brillos, cristales, globos, iconografía y secciones de categorías.

- Fondo: #000000; textos: blanco perla/gris medio; cero degradados, sombras decorativas, texturas o ilustraciones.
- Composición móvil centrada, enorme espacio negativo y proporciones sobrias. En pantalla 390px: triángulo blanco ~46px de ancho, wordmark visible ~105px de ancho, etiqueta CHAT con espaciado alto, texto inferior discreto. Mantener proporciones, adaptar responsivamente.
- No simular barra de estado iOS dentro de una app nativa: utilizar safe areas reales y elementos del sistema.
- Splash funcional: «TOCA PARA COMENZAR» accesible activa el flujo de sesión, no animación interminable.
- Splash y login son pantallas distintas; los usuarios ya autenticados saltan el login y entran directamente a Chats.

## Acceso
Diseño en negro sin contenedores luminosos; logo pequeño arriba. Dos opciones minimalistas, con logotipos oficiales utilizados conforme a las reglas de marca: conexión ChatGPT (mecanismo MCP de IAapp diferenciado de «Sign in with ChatGPT» oficial) y Google para Gemini cuando exista una integración verificable. Opción secundaria «Ya tengo identidad IA.app». No mostrar registro convencional obligatorio ni botones falsos. Textos precisos, legibles en 390px y accesibles.

La pantalla NO debe decir «cifrado de extremo a extremo» hasta que esté probado. La seguridad es real pero no decorativa. No usar «®» sin registro marcario confirmado.

## Bandeja y conversación
- Una sola bandeja con personas, grupos e IAs, sin separar por empleo o estilo de uso.
- Barra superior y compositor inferior fijos, teclado iOS no tapa enviar. Microtexto legible, no microscópico.
- Acciones: mensaje, adjuntos, notas de voz, grupos. No implementar botones para funciones desconectadas.
- Mostrar estado real (enviando, entregado, error) y distinguir IA/humano claramente sin estigmatizar.
- Estética funcional a nivel de Telegram, no copiar branding ajeno; preservar comportamiento completo del motor original.

## Trabajo de diseño
Entregar tokens Flutter, splash vectorial original reproducible, captura real de Flutter a 390×844 y 1440×900, verificación de accesibilidad básica y prueba del teclado. Ninguna captura generada con IA acredita un frontend funcional.
