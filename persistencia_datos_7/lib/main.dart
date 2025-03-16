import 'package:flutter/material.dart';

// Packages
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _ip_server = '192.168.0.100';
  final TextEditingController _ip_server_controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _ip_server_controller.dispose();
    super.dispose();
  }

  void _change_ip_server(String value) async {
    // print(value);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _ip_server = value;
      prefs.setString('ip_server', _ip_server);
    });
  }

  void _upload_preferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _ip_server = prefs.getString('ip_server') ?? '192.168.0.100';
      _ip_server_controller.text = _ip_server;
    });
  }

  @override
  void initState() {
    super.initState();
    _upload_preferences();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences',
      home: Scaffold(
        appBar: AppBar(title: const Text('Shared Preferences')),
        body: Column(
          children: [
            Text('IP Server: $_ip_server'),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: _ip_server_controller,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Ip del Servidor',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Valor en Ip Server',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                cursorColor: Colors.deepPurple,
                autofocus: true,

                onChanged: (value) => _change_ip_server(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
