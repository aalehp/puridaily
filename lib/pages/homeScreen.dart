import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
            backgroundColor: Colors.blueGrey[200],
            title: const Text('Home Screen')),
        body: Column(children: [
          Card(
            margin: EdgeInsets.all(15.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              title: Text('V E N T A',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.shopping_cart,
                  size: 48, color: Colors.blueGrey[900]),
              trailing: Icon(Icons.arrow_forward,
                  size: 32, color: Colors.blueGrey[900]),
              onTap: () => Navigator.pushNamed(context, '/ventas'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(15.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              title: Text('R E G I S T R O  L I T R O S',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.book_rounded,
                  size: 48, color: Colors.blueGrey[900]),
              trailing: Icon(Icons.arrow_forward,
                  size: 32, color: Colors.blueGrey[900]),
              onTap: () => Navigator.pushNamed(context, '/regLitros'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(15.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              title: Text('R E G I S T R O  E N V I O S',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.delivery_dining,
                  size: 48, color: Colors.blueGrey[900]),
              trailing: Icon(Icons.arrow_forward,
                  size: 32, color: Colors.blueGrey[900]),
              onTap: () => Navigator.pushNamed(context, '/bitEnvios'),
            ),
          ),
          Card(
            margin: EdgeInsets.all(15.0),
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: ListTile(
              title: Text('R E C O L E C C I O N E S',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              leading: Icon(Icons.calendar_month,
                  size: 48, color: Colors.blueGrey[900]),
              trailing: Icon(Icons.arrow_forward,
                  size: 32, color: Colors.blueGrey[900]),
              onTap: () => Navigator.pushNamed(context, '/calRecolecciones'),
            ),
          ),
        ]));
  }
}
