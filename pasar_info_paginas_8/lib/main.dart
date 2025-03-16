import 'package:flutter/material.dart';
import 'package:pasar_info_paginas_8/pages/pageStatefull.dart';
import 'package:pasar_info_paginas_8/pages/pageStateless.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Envio de Informacion entre Paginas')),
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _text_controller = TextEditingController();
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _text_controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Escribe algo',
              suffixIcon: IconButton(icon: Icon(Icons.clear), onPressed: () {}),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageStateless(_text_controller.text),
              ),
            );
          },
          child: Text('Enviar a Stateless'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PageStatefull(_text_controller.text),
              ),
            );
          },
          child: Text('Enviar a Statefull'),
        ),
      ],
    );
  }
}
