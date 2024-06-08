import 'package:flutter/material.dart';

class RemoveScaffold extends StatelessWidget {
  const RemoveScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Remove element'),
      ),
      body: const RemState(
        products: ['COKE', 'banana', 'melons'],
      ),
    );
  }
}

typedef CallBackFunction = Function(String product);

class DisplayItem extends StatelessWidget {
  const DisplayItem({super.key, required this.product, required this.callFunc});
  final String product;
  final CallBackFunction callFunc;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => callFunc(product),
      child: Center(
        child: Text(product),
      ),
    );
  }
}

class RemState extends StatefulWidget {
  const RemState({super.key, required this.products});
  final List<String> products;

  @override
  State<RemState> createState() => _RemDisplay();
}

class _RemDisplay extends State<RemState> {
  late List<String> _products;

  @override
  void initState() {
    super.initState();
    _products = List.from(widget.products);
  }

  void onTappe(product) {
    setState(() {
      _products.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: _products.map((product) {
      return DisplayItem(product: product, callFunc: onTappe);
    }).toList());
  }
}
