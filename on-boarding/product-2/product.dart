import 'dart:io';

class Product {
  String name;
  String description;
  double price;

  Product({required this.name, required this.description, required this.price});
}

class ProductManager {
  List<Product> products = [];

  void addProduct(Product product) {
    products.add(product);
  }

  void viewProducts() {
    for (var pdt in products) {
      print(pdt.name + ' ' + pdt.description + ' ' + pdt.price.toString());
    }
  }

  void viewSingleProduct(String name) {
    for (var pdt in products) {
      if (pdt.name == name) {
        print(pdt.name + ' ' + pdt.description + ' ' + pdt.price.toString());
      }
    }
  }

  void editProduct(String name) {
    for (var pdt in products) {
      if (pdt.name == name) {
        //receive values from terminal
        print('Enter new name');
        pdt.name = stdin.readLineSync()!;
        print('Enter new name');
        pdt.name = stdin.readLineSync()!;
        print('Enter new description');
        pdt.description = stdin.readLineSync()!;
        print('Enter new price');
        pdt.price = double.parse(stdin.readLineSync()!);
      }
    }
  }

  void deleteProduct(String name) {
    for (var pdt in products) {
      if (pdt.name == name) {
        products.remove(pdt);
      }
    }
  }
}

class Test {
  void main() {
    ProductManager products = ProductManager();
  }
}
