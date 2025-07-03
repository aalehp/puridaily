import 'package:flutter/material.dart';
import 'package:puridaily/pages/bitacoraEnvios.dart';
import 'package:puridaily/pages/calendarioRecoleccion.dart';
import 'package:puridaily/pages/cuentasPendientes.dart';
import 'package:puridaily/pages/homeScreen.dart';
import 'package:puridaily/pages/registrolitros.dart';
import 'package:puridaily/pages/ventas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/ventas': (context) => Ventas(),
        '/regLitros': (context) => RegistroLitros(),
        '/bitEnvios': (context) => BitacoraEnvios(),
        '/cuentasPend': (context) => CuentasPendientes(),
        '/calRecolecciones':(context) => CalendarioRecoleccion()
      },
    );
  }
}