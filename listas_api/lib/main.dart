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
  List<Person> _persons = [
    Person(name: 'Nombre 1', lastName: 'Apellido 1', phone: 'Telefono 1'),
    Person(name: 'Nombre 2', lastName: 'Apellido 2', phone: 'Telefono 2'),
    Person(name: 'Nombre 3', lastName: 'Apellido 3', phone: 'Telefono 3 '),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Lista'), backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_persons[index].name + ' ' + _persons[index].lastName),
            subtitle: Text(_persons[index].phone),
            leading: CircleAvatar(
              child: Text(_persons[index].name.substring(0, 1)),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => _deletePerson(context, _persons[index]),
            ),
          );
        },
      ),
    );
  }

  _deletePerson(BuildContext context, Person person) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: ShapeBorder.lerp(
            null,
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            0.5,
          ),
          title: Text('Eliminar'),
          content: Text('Desea eliminar a ${person.name}'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('No'),
            ),
            TextButton(
              onPressed:
                  () => {
                    this.setState(() {
                      this._persons.remove(person);
                    }),
                    Navigator.pop(context),
                  },
              child: Text('Si'),
            ),
          ],
        );
      },
    );
  }
}

class Person {
  String name;
  String lastName;
  String phone;

  Person({required this.name, required this.lastName, required this.phone});
}
