import 'dart:math';

import 'package:flutter/material.dart';

// Packages
import 'package:card_swiper/card_swiper.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(title: const Text('Swiper')),
        body: _swiperWidget(),
      ),
    );
  }

  Widget _swiperWidget() {
    String _url_image =
        'https://via.assets.so/game.png?id=:id&q=95&w=360&h=360&fit=fill';

    Random random = new Random();
    return Container(
      width: double.infinity,
      height: 250,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _url_image.replaceAll(':id', (index + 1).toString()),
            fit: BoxFit.fill,
          );
        },
        itemCount: 10,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}
