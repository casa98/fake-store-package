# Fake Store API Package

This package provides an easy way  to interact with a portion of the Fake Store API (`https://fakestoreapi.com`). It includes models (`product_model` and `category_model`), services (`product_service`), and repository implementations (`product_repository_impl`) to fetch data from the API.

## Features

- Fetch list of products
- Fetch a specific product by ID
- Fetch categories
- Error handling using the `dartz` library

## Installation
Add `fake_store_api` to your `pubspec.yaml`:

```yaml
dependencies:
  fake_store_api:
    git:
      url: https://github.com/casa98/fake-store-package.git
      ref: main
```

## Usage
Package currently supports 3 endpoints to obtain data from.
### Fetching Products
To fetch a list of products, use the `ProductRepository.getProducts()`, which returns a list of `ProductModel`
### Fetching Product by ID
To fetch a specific product by its ID, use the `ProductRepository.getProductById(productId)`, which returns a `ProductModel` or the respective error message.
### Fetch categories
To fetch different products categories, use the `ProductRepository.getCategories()`

## Example
An example Flutter app demonstrating how to use this package can be found in the `example` directory. To run the example app:
1. `cd example`
2. `flutter run`

## Version Information
- Flutter 3.19.6 (Channel stable)
- Dart 3.3.4 (stable)