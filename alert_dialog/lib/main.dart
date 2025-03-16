import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Mi App', home: Inicio());
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  bool _bandera = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Alert Dialog', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.blue),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                padding: MaterialStatePropertyAll(EdgeInsets.all(20)),
              ),
              onPressed: () => {_showAlert(context)},
              child: Text('Alert Dialog'),
            ),
            SizedBox(height: 20),
            Text(_bandera ? 'Bandera activada' : 'Bandera desactivada'),
          ],
        ),
      ),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.white,
            shape: Border.all(color: Colors.white, width: 2),
            title: Text('Alert Dialog'),
            content: Text(
              _bandera
                  ? '¿Quieres desactivar la bandera?'
                  : '¿Quieres activar la bandera?',
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.lightGreen),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                ),
                child: Text('Aceptar'),
                onPressed:
                    () => {
                      setState(() => {_bandera = !_bandera}),
                      Navigator.pop(context),
                    },
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                ),
                child: Text('Cancelar'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
    );
  }
}
