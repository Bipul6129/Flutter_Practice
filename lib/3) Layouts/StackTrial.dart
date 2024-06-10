import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StacktrialScaffold extends StatelessWidget {
  const StacktrialScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stacks'),
      ),
      body: const StackDisplay(),
    );
  }
}

class StackDisplay extends StatelessWidget {
  const StackDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 300,
      width: 500,
      color: Colors.amber,
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
                fit: BoxFit.fitWidth,
                'https://static.wixstatic.com/media/8a8033_a738085f564f4d43aa34edebaebae5b5~mv2_d_1600_1600_s_2.jpg/v1/fit/w_1000%2Ch_1000%2Cal_c%2Cq_80/file.jpg'),
            const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Text(
                  'welcome',
                  style: TextStyle(color: Colors.white, fontSize: 40),
                )),
            const Positioned(
                right: 0,
                bottom: 0,
                child: Icon(
                  Icons.heart_broken,
                  color: Colors.white,
                  size: 30,
                )),
          ],
        ),
      ),
    );
  }
}
