# Fake Store API Package

This package provides an easy way  to interact with a portion of the Fake Store API (`https://fakestoreapi.com`). It includes models, services, and repository implementations to fetch data from the API.

## Features

- Fetch list of products
- Fetch a specific product by ID
- Fetch categories
- Error handling using the `dartz` library

## Important
Ensure you inject a `ProductRepository` instance at a high level in your widget tree, before trying to access available features.

## Installation
Add `fake_store_api` to your `pubspec.yaml`:

```yaml
dependencies:
  fake_store_api: ^1.0.0
```

## Usage
Package currently supports 3 endpoints to obtain data from.
### Fetching Products
To fetch a list of products, use the `ProductRepository.getProducts()`
### Fetching Product by ID
To fetch a specific product by its ID, use the `ProductRepository.getProductById(productId)`
### Fetch categories
To fetch different products categories, use the `ProductRepository.getCategories()`

## Example
An example Flutter app demonstrating how to use this package can be found in the `example` directory. To run the example app:
1. `cd example`
2. `flutter run`

## Version Information
- Flutter 3.19.6 (Channel stable)
- Dart 3.3.4 (stable)