import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(10.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Animated Container')),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: Random().nextInt(500)),
                  curve: Curves.fastOutSlowIn,
                  width: _width,
                  height: _height,
                  decoration: BoxDecoration(
                    borderRadius: _borderRadius,
                    color: _color,
                  ),
                  child: Center(
                    child: Text("Hola", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ),
            // Boton para cambiar de manera aleatoria el tamaño
            IconButton(onPressed: _changeParams, icon: Icon(Icons.shuffle)),
          ],
        ),
      ),
    );
  }

  void _changeParams() {
    final random = Random();

    setState(() {
      _width = 50 + random.nextInt(300).toDouble();
      _height = 50 + random.nextInt(300).toDouble();
      _color = Color.fromARGB(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
