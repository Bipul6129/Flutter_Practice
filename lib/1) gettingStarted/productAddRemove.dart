import 'package:flutter/material.dart';

class CartScaffold extends StatelessWidget {
  const CartScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const ProductStateConfig(
        products: [Product('cheeseball'), Product('lays')],
      ),
    );
  }
}

class Product {
  const Product(this.name);
  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);

class ProductDisplay extends StatelessWidget {
  const ProductDisplay(
      {super.key,
      required this.product,
      required this.onChangeCart,
      required this.inCart});
  final Product product;
  final CartChangedCallback onChangeCart;
  final bool inCart;

  Color getColor() {
    return inCart ? Colors.black : Colors.yellow;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () => {onChangeCart(product, inCart)},
        leading: CircleAvatar(
          backgroundColor: getColor(),
          child: Text(product.name[0]),
        ),
        title: Text(product.name));
  }
}

class ProductStateConfig extends StatefulWidget {
  const ProductStateConfig({super.key, required this.products});
  final List<Product> products;
  @override
  State<ProductStateConfig> createState() => _ProductState();
}

class _ProductState extends State<ProductStateConfig> {
  final shoppingCart = <Product>{};
  void _changeCart(Product product, bool inCart) {
    setState(() {
      if (inCart) {
        shoppingCart.remove(product);
      } else {
        shoppingCart.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: widget.products.map((product) {
      final bool inCart = shoppingCart.contains(product);
      return ProductDisplay(
          product: product, onChangeCart: _changeCart, inCart: inCart);
    }).toList());
  }
}
