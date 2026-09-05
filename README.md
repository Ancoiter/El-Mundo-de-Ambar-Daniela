# El Mundo de Ámbar Daniela

Base inicial para un videojuego de Roblox desarrollado con **Luau** y sincronizado con Roblox Studio mediante [Rojo](https://rojo.space/). La estructura separa claramente el código de cliente, servidor y recursos compartidos para que nuevas mecánicas (mundos, misiones, inventario y minijuegos) puedan crecer sin acoplarse.

## Estructura

```text
src/
├── client/                 # Presentación, interfaz y controladores locales
│   ├── Controllers/
│   └── Bootstrap.client.lua
├── server/                 # Autoridad del juego y servicios del servidor
│   ├── Services/
│   └── Bootstrap.server.lua
└── shared/                 # Contratos seguros para cliente y servidor
    ├── Config/
    ├── Networking/
    └── Types/
```

Consulta [la guía de arquitectura](docs/architecture.md) para conocer responsabilidades, flujo de inicio y criterios para añadir módulos.

## Puesta en marcha

1. Instala [Rojo](https://rojo.space/docs/v7/getting-started/installation/).
2. Desde la raíz del repositorio ejecuta:

   ```bash
   rojo serve
   ```

3. En Roblox Studio, instala el plugin de Rojo y conéctalo a `default.project.json`.
4. Pulsa **Play**. El servidor prepara los remotos y el cliente muestra el HUD inicial.

> El proyecto no incorpora dependencias todavía. Cuando se añadan, se deben declarar mediante un gestor de paquetes y documentar su uso aquí.

## Convenciones

- Usa `--!strict` en módulos y scripts nuevos.
- El cliente solo solicita acciones; el servidor valida y conserva el estado que afecta al juego.
- Añade nombres de remotos en `src/shared/Networking/RemoteNames.lua`; no los escribas como literales en varios archivos.
- Organiza cada sistema nuevo como un servicio (servidor) y/o controlador (cliente), con contratos compartidos cuando sea necesario.
