# API Fake Store CLI

Esta es una aplicación de línea de comandos (CLI) construida con Dart que interactúa con la Fake Store API. Permite a los usuarios realizar operaciones básicas como iniciar sesión, explorar productos y ver un carrito de compras directamente desde la terminal.

### Prerrequisitos

Asegúrate de tener el SDK de Dart instalado en tu sistema.

### Instalación

1.  **Clona el repositorio:**
    ```sh
    git clone https://github.com/mmaurogg/dart_api_fake_store_cli.git
    cd api_fake_store
    ```

2.  **Obtén las dependencias:**
    ```sh
    dart pub get
    ```

3.  **Genera los archivos de código:**
    El proyecto utiliza `freezed` para la generación de modelos inmutables. Ejecuta el siguiente comando para generar los archivos necesarios:
    ```sh
    dart run build_runner build
    ```

## Uso

Para iniciar la aplicación, ejecuta el siguiente comando desde la raíz del proyecto:

```sh
dart run bin/api_fake_store.dart
```

## Estructura del Proyecto

```
api_fake_store/
├── bin/
│   └── api_fake_store.dart   # Punto de entrada de la aplicación
├── lib/
│   ├── api_fake_store.dart   # Lógica principal y orquestación de funciones
│   ├── src/
│   │   ├── api/              # Clases de fuente de datos para la API (auth, product, cart)
│   │   ├── exceptions/       # Excepciones personalizadas de la API
│   │   └── models/           # Modelos de datos (Product, Cart, etc.)
│   └── utils/
│       └── loading_indicator.dart # Utilidad para la animación de carga
├── test/
└── pubspec.yaml
```
