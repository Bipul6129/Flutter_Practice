import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/1)%20gettingStarted/productAddRemove.dart';

class Product {
  const Product(this.title, this.description, this.price);
  final String title;
  final String description;
  final int price;
}

class Silvercard extends StatelessWidget {
  const Silvercard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SilverCartMain(
        products: [
          Product('Chair', 'very good chair used frequently', 100),
          Product('Table', 'very good table used frequently', 40),
          Product('Smartphone', 'High-end model with advanced features', 899),
          Product('Coffee Maker', 'Espresso machine with milk frother', 299),
          Product(
              'Running Shoes', 'Lightweight and breathable for runners', 129),
          Product('Bluetooth Speaker',
              'Portable with deep bass and long battery life', 149),
          Product('Laptop', 'Thin and powerful for professional use', 1299)
        ],
      ),
    );
  }
}

class SilverCartMain extends StatefulWidget {
  const SilverCartMain({super.key, required this.products});
  final List<Product> products;

  @override
  State<SilverCartMain> createState() => _SilverCartDisplay();
}

typedef CallbackCartButton = Function(Product product);

class _SilverCartDisplay extends State<SilverCartMain> {
  late List<Product> products = List.from(widget.products);
  final List<Product> inCart = [];

  void putInCart(Product product) {
    setState(() {
      if (inCart.contains(product)) {
        print('already in cart');
      } else {
        inCart.add(product);
      }
    });
  }

  void removeFromCart(Product product) {
    setState(() {
      if (inCart.contains(product)) {
        inCart.remove(product);
      } else {
        // inCart.add(product);
      }
    });
  }

  bool checkInCart(Product product) {
    if (inCart.contains(product)) {
      print('its in cart');
      return true;
    } else {
      print('its not in cart');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppBarSilver(
          inCartProducts: inCart,
        ),
        SliverList.builder(
          itemBuilder: (context, index) {
            return ProductViewContainer(
              thisProduct: products[index],
              callPutInCart: putInCart,
              calRemoveFromCart: removeFromCart,
              inCart: checkInCart(products[index]),
            );
          },
          itemCount: widget.products.length,
        )
      ],
    );
  }
}

class ProductViewContainer extends StatelessWidget {
  const ProductViewContainer(
      {super.key,
      required this.thisProduct,
      required this.callPutInCart,
      required this.calRemoveFromCart,
      required this.inCart});
  final Product thisProduct;
  final CallbackCartButton callPutInCart, calRemoveFromCart;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 4, top: 4),
      child: Container(
          height: 90,
          // color: Color.fromARGB(209, 46, 46, 46),
          decoration: const BoxDecoration(
              color: Color.fromARGB(209, 46, 46, 46),
              borderRadius: BorderRadius.all(Radius.circular(3))),
          padding: const EdgeInsets.all(5),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                          padding: EdgeInsets.only(top: 4, bottom: 4),
                          child: Image.network(
                              height: constraints.maxHeight,
                              width: constraints.maxWidth,
                              fit: BoxFit.cover,
                              'https://images.pexels.com/photos/2486168/pexels-photo-2486168.jpeg'))),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 14, top: 4, bottom: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                thisProduct.title,
                                style: const TextStyle(
                                    decoration: TextDecoration.none,
                                    fontSize: 16,
                                    color: Colors.white),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                  thisProduct.description,
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal),
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 4, bottom: 4, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Text(
                                  'Rs: ${thisProduct.price}',
                                  style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 10),
                                )),
                            Expanded(
                                child: GestureDetector(
                                    onTap: () => !inCart
                                        ? callPutInCart(thisProduct)
                                        : calRemoveFromCart(thisProduct),
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4))),
                                      width: constraints.maxWidth,
                                      // color: Colors.white,
                                      child: Center(
                                        child: Text(
                                          !inCart ? 'Add to Cart' : 'Remove',
                                          style: const TextStyle(
                                              decoration: TextDecoration.none,
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                      )),
                ],
              );
            },
          )),
    );
  }
}

class AppBarSilver extends StatelessWidget {
  const AppBarSilver({super.key, required this.inCartProducts});
  final List<Product> inCartProducts;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: const Color.fromARGB(228, 66, 155, 238),
      title: SizedBox(
        height: 120,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: inCartProducts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CircleAvatar(
                child: Text(inCartProducts[index].title[0]),
              ),
            );
          },
        ),
      ),
    );
  }
}
