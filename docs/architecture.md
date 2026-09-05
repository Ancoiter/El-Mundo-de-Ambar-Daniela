# Arquitectura inicial

## Capas

| Capa | Ubicación | Responsabilidad |
| --- | --- | --- |
| Cliente | `src/client` | Interfaz, cámara, entrada y efectos locales. |
| Servidor | `src/server` | Estado autoritativo, validación y reglas del juego. |
| Compartida | `src/shared` | Configuración, tipos y contratos que usan ambas capas. |

El árbol de `default.project.json` publica `shared` en `ReplicatedStorage`, coloca el código autoritativo en `ServerScriptService` y el código local en `StarterPlayerScripts`.

## Inicio del juego

1. `Bootstrap.server.lua` crea los remotos declarados y arranca los servicios.
2. `PlayerService` atiende entradas y salidas de jugadores.
3. `Bootstrap.client.lua` arranca los controladores locales.
4. `HudController` construye el HUD mínimo al entrar el jugador.

## Cómo ampliar el proyecto

- **Nueva mecánica de servidor:** crea `src/server/Services/<Mecanica>Service.lua` y regístrala en `Bootstrap.server.lua`.
- **Nueva experiencia local:** crea `src/client/Controllers/<Mecanica>Controller.lua` y regístrala en `Bootstrap.client.lua`.
- **Nueva comunicación:** declara el nombre en `shared/Networking/RemoteNames.lua`; el servidor debe crear y validar el remoto.
- **Datos persistentes:** incorpora un servicio dedicado que encapsule `DataStoreService`; no accedas al almacén directamente desde controladores ni desde módulos compartidos.

## Reglas de dependencia

- Los controladores pueden requerir módulos compartidos, pero nunca módulos de servidor.
- Los servicios pueden requerir módulos compartidos, pero nunca módulos de cliente.
- Los módulos compartidos no deben depender de servicios de Roblox que solo existan en una de las dos capas.
- Toda acción iniciada por el cliente debe validarse de nuevo en el servidor.
