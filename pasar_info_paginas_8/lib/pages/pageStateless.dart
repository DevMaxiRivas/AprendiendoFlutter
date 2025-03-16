import 'package:flutter/material.dart';

class PageStateless extends StatelessWidget {
  // Final son datos no mutables
  final String title;

  const PageStateless(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless')),
      body: Center(child: Container(child: Text(title))),
    );
  }
}
