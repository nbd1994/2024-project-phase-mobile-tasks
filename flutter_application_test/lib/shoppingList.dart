import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Center(
      child: ShoppingList(products: [
        Product(name: "Banana"),
        Product(name: "Apple"),
        Product(name: "Cheese"),
      ]),
    ),
  ));
}

class Product {
  Product({required this.name});
  String name;
}

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.products});
  final List<Product> products;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  void handleCartChanged(Product pdt, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(pdt);
      } else {
        _shoppingCart.remove(pdt);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 8),
          children: widget.products.map((pdt) {
            return ShoppingListItem(
              product: pdt,
              inCart: _shoppingCart.contains(pdt),
              onCartChanged: handleCartChanged,
            );
          }).toList()),
    );
  }
}

typedef handleCartChanged = Function(Product pdt, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onCartChanged,
  }) : super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final handleCartChanged onCartChanged;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (inCart)
      return null;
    else {
      return TextStyle(
        color: Colors.black54,
        decoration: TextDecoration.lineThrough,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(
          product.name[0],
        ),
      ),
      title: Text(
        product.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
