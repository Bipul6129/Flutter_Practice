import 'package:flutter/material.dart';

class FavoriteChallengeScaffold extends StatelessWidget {
  const FavoriteChallengeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.restore_from_trash_rounded),
        title: const Text('Welcome Favs'),
      ),
      body: const FavoriteStateConfig(
        products: ['mango', 'apple', 'pineapple'],
      ),
    );
  }
}

typedef CallBackFavNot = Function(String productName);

class ListDisplay extends StatelessWidget {
  const ListDisplay(
      {super.key,
      required this.products,
      required this.isFav,
      required this.buttonAction});
  final List<String> products;
  final CallBackFavNot buttonAction;
  final bool isFav;
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: products.map((product) {
      return ProductDisplay(
        productName: product,
        isFav: isFav,
        buttonAction: buttonAction,
      );
    }).toList());
  }
}

class ProductDisplay extends StatelessWidget {
  const ProductDisplay(
      {super.key,
      required this.productName,
      required this.isFav,
      required this.buttonAction});
  final String productName;
  final bool isFav;
  final CallBackFavNot buttonAction;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: isFav ? Colors.green : Colors.amber,
          child: Text(productName[0]),
        ),
        Text(productName),
        ActionButton(
          buttonName: isFav ? 'Remove' : 'Favorite',
          buttonAction: buttonAction,
          productName: productName,
        )
      ],
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton(
      {super.key,
      required this.buttonName,
      required this.buttonAction,
      required this.productName});
  final String buttonName;
  final CallBackFavNot buttonAction;
  final String productName;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => buttonAction(productName), child: Text(buttonName));
  }
}

class FavoriteStateConfig extends StatefulWidget {
  const FavoriteStateConfig({super.key, required this.products});
  final List<String> products;

  @override
  State<FavoriteStateConfig> createState() => _FavoriteStateDisplay();
}

class _FavoriteStateDisplay extends State<FavoriteStateConfig> {
  List<String> favorite = [];
  List<String> notFav = [];

  @override
  void initState() {
    super.initState();
    notFav = List.from(widget.products);
  }

  void makeFav(String productName) {
    setState(() {
      if (notFav.contains(productName)) {
        favorite.add(productName);
        notFav.remove(productName);
      }
    });
  }

  void removeFav(String productName) {
    setState(() {
      if (favorite.contains(productName)) {
        notFav.add(productName);
        favorite.remove(productName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ListDisplay(
          products: notFav,
          isFav: false,
          buttonAction: makeFav,
        )),
        Expanded(
            child: ListDisplay(
          products: favorite,
          isFav: true,
          buttonAction: removeFav,
        )),
      ],
    );
  }
}
