# Paquete Fake Store API

Este paquete proporciona una forma fácil de interactuar con una parte de la API *Fake Store* (`https://fakestoreapi.com`).

El paquete incluye los siguientes modelos de datos:
- `ProductModel`: representa un producto y contiene las propiedades `id`, `title`, `price`, `category`, `description` e `image`.
- `CategoryModel`: representa los diferentes tipos de categorías que tienen los productos, y contiene la propiedad `name`.

## Características

- Obtener lista de productos
- Obtener un producto específico por ID
- Obtener categorías
- Manejo de errores usando la biblioteca `dartz`

## Instalación
Agrega `fake_store_api` a tu `pubspec.yaml`:

```yaml
dependencies:
  fake_store_api:
    git:
      url: https://github.com/casa98/fake-store-package.git
      ref: main
```

## Uso
El paquete actualmente soporta 3 endpoints para obtener datos.
Para acceder a los endpoints, primero crea una instancia de la clase `FakeStoreApi`.

## Métodos
### Obtener Productos
Para obtener una lista de productos, llamar el método `getProducts()` de la clase `FakeStoreApi`, el cual devuelve una lista de `ProductModel`.

### Obtener Producto por ID
Para obtener un producto específico por su ID, llamar el método `getProductById(productId)` de la clase `FakeStoreApi`, el cual devuelve un `ProductModel`.

### Obtener categorías
Para obtener diferentes categorías de productos, llamr el método `getCategories()` de la clase `FakeStoreApi`.

### Errores
En caso de presentarse algún error en la solicitud, los detalles de esta serán mostrados en el centro de la pantalla del dispositivo.

## Ejemplo
Un ejemplo de una aplicación Flutter que demuestra cómo usar este paquete se puede encontrar en el directorio `example`. Para ejecutar la aplicación de ejemplo siga estos pasos:

1. `cd example`
2. `flutter run`

## Información adicional
- Flutter 3.19.6 (Canal estable)
- Dart 3.3.4 (estable)
