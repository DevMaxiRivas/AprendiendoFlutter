import 'dart:convert';

import 'package:consumir_api/models/Gift.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Consumir API', home: Inicio());
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Gift>> _listGifts = Future.value([]);

  Future<List<Gift>> _getGifts() async {
    final response = await http.get(
      Uri.parse(
        'https://api.giphy.com/v1/gifs/trending?api_key=szP31XHHgxWfzRfNWlDHE6kRY9AbUaTu&limit=10&offset=0&rating=g&bundle=messaging_non_clips',
      ),
    );

    List<Gift> gifts = [];

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final jsonData = jsonDecode(body);
      // print(jsonData);

      for (var item in jsonData['data']) {
        print(item['title']);
        gifts.add(Gift(item['title'], item['images']['original']['url']));
      }
    } else {
      throw Exception('Failed to load gifts');
    }

    for (var gift in gifts) {
      print(gift.toString());
    }

    return gifts;
  }

  void initState() {
    super.initState();
    _listGifts = _getGifts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Consumir API'),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: _listGifts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 2,
              children: _listGiftsWidget(snapshot.data as List<Gift>),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          return Center(child: CircularProgressIndicator(color: Colors.red));
        },
      ),
    );
  }

  List<Widget> _listGiftsWidget(List<Gift> gifts) {
    List<Widget> widgets = [];
    for (var gift in gifts) {
      widgets.add(
        Card(
          child: Column(
            children: [Expanded(child: Image.network(gift.imageUrl))],
          ),
        ),
      );
    }
    return widgets;
  }
}
