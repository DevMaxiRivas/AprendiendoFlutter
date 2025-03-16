import 'package:flutter/material.dart';

class Pag2 extends StatelessWidget {
  const Pag2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Terminos y Condiciones',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              titleWidget('Terminos y Condiciones'),
              paragraphWidget(
                "Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma",
              ),
              paragraphWidget(
                "Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma",
              ),
              paragraphWidget(
                "Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma.Para usar esta aplicacion es necesario que la tenga instalada en el telefono, para el correcto funcionamiento de la misma",
              ),
              agreeButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget paragraphWidget(String parrafo) {
    return Column(
      children: [
        Text(parrafo, textAlign: TextAlign.justify),
        SizedBox(height: 10),
      ],
    );
  }

  Widget titleWidget(String title) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  Widget agreeButton(context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: Size(160, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () => {Navigator.pop(context)},
          child: Row(
            children: [
              Text(
                'Acepto Todo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Icon(Icons.check, color: Colors.white),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
