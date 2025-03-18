import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void _onItemTapped(int index) {
    print("Click item $index");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Drawer Demo',
      home: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Mi Perfil', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.car_rental),
                title: Text('Car'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.flight),
                title: Text('Flight'),
                trailing: Icon(Icons.more_vert),
              ),
              ListTile(
                leading: Icon(Icons.train),
                title: Text('Train'),
                trailing: Icon(Icons.more_vert),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text(
            'Material App Bar',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
