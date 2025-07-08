import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
import 'package:intl/intl.dart';
import 'package:puridaily/consumos.dart';

class Ventas extends StatefulWidget {
  const Ventas({super.key});

  @override
  State<Ventas> createState() => _VentasState();
}

class _VentasState extends State<Ventas> {
  int _counter20L = 0;
  int _counter10L = 0;
  int _counter1L = 0;
  int _counterGarrafonRosa = 0;
  int _counterBot1L = 0;
  int _counterBot500ml = 0;

  double _specialPrice20L = 0;
  double _specialPrice1L = 0;
  double _specialPrice10L = 0;
  double _specialPriceGarrafonRosa = 0;
  double _specialPriceBot1L = 0;
  double _specialPriceBot500ml = 0;

  double calcularTotal() {
  double precio20L = _specialPrice20L > 0 ? _specialPrice20L.toDouble() : 15.0;
  double precio10L = _specialPrice10L > 0 ? _specialPrice10L.toDouble() : 9.0;
  double precio1L = _specialPrice1L > 0 ? _specialPrice1L.toDouble() : 3.0;
  double precioGarrafonRosa = _specialPriceGarrafonRosa > 0
      ? _specialPriceGarrafonRosa.toDouble()
      : 90.0;
  double precioBot1L = _specialPriceBot1L > 0 ? _specialPriceBot1L.toDouble() : 12.0;
  double precioBot500ml = _specialPriceBot500ml > 0
      ? _specialPriceBot500ml.toDouble()
      : 8.0;

    return (_counter20L *  precio20L +
            _counter10L * precio10L +
            _counter1L * precio1L +
            _counterGarrafonRosa * precioGarrafonRosa +
            _counterBot1L * precioBot1L +
            _counterBot500ml * precioBot500ml)
        .toDouble();
  }

  Widget buildProductoCard(
      String nombre, double precio, int contador, Function(int) onChanged) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 150,
          maxHeight: 200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(nombre,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo)),
            Text('Precio: \$${precio.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 14, color: Colors.grey[700])),
            CounterButton(
              loading: false,
              onChange: (int val) {
                if (val >= 0) {
                  setState(() {
                    switch (nombre) {
                      case 'Relleno 20L':
                        _counter20L = val;
                        break;
                      case 'Relleno 10L':
                        _counter10L = val;
                        break;
                      case 'Relleno 1L':
                        _counter1L = val;
                        break;
                      case 'Garrafon Rosa':
                        _counterGarrafonRosa = val;
                        break;
                      case 'Botella 1L':
                        _counterBot1L = val;
                        break;
                      case 'Botella 500ml':
                        _counterBot500ml = val;
                        break;
                    }
                  });
                }
              },
              count: contador,
              countColor: const Color.fromARGB(255, 0, 0, 0),
              buttonColor: Colors.indigo,
              progressColor: Colors.indigoAccent,
            ),
            SizedBox(
                width: 140,
                height: 30,
                child: TextField(
                  maxLines: 1,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIconColor: Colors.indigo,
                    prefixIcon: Icon(Icons.attach_money, size: 15),
                    filled: false,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                    labelText: 'Otro Costo',
                    labelStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.indigo, width: 2),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                  onChanged: (value) {
                    double? precioEspecial = double.tryParse(value);
                    if (precioEspecial != null) {
                      setState(() {
                        switch (nombre) {
                          case 'Relleno 20L':
                            _specialPrice20L = precioEspecial.toDouble();
                            break;
                          case 'Relleno 10L':
                            _specialPrice10L = precioEspecial.toDouble();
                            break;
                          case 'Relleno 1L':
                            _specialPrice1L = precioEspecial.toDouble();
                            break;
                          case 'Garrafon Rosa':
                            _specialPriceGarrafonRosa = precioEspecial.toDouble();
                            break;
                          case 'Botella 1L':
                            _specialPriceBot1L = precioEspecial.toDouble();
                            break;
                          case 'Botella 500ml':
                            _specialPriceBot500ml = precioEspecial.toDouble();
                            break;
                        }
                      });
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }

  Future<void> enviarVentaYDetalles() async {
    final fechaFormateada = DateFormat('yyyy/MM/dd').format(DateTime.now());
    final fechaCreacion = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    double total = calcularTotal();
    int resp = await enviarVenta(fechaFormateada, total, fechaCreacion);
    if (resp != -1) {
      int idVenta = resp;
      if (_counter20L > 0) {
        enviarDetalleVenta(idVenta, "Relleno 20L", _specialPrice20L > 0 ? _specialPrice20L.toDouble() : 15.0, _counter20L);
      }
      if (_counter10L > 0) {
        enviarDetalleVenta(idVenta, "Relleno 10L", _specialPrice10L > 0 ? _specialPrice20L.toDouble(): 9.0, _counter10L);
      }
      if (_counter1L > 0) {
        enviarDetalleVenta(idVenta, "Relleno 1L", _specialPrice1L > 0 ? _specialPrice1L.toDouble(): 3.0, _counter1L);
      }
      if (_counterGarrafonRosa > 0) {
        enviarDetalleVenta(idVenta, "Garrafon Rosa", _specialPriceGarrafonRosa > 0 ? _specialPriceGarrafonRosa.toDouble() : 90.0, _counterGarrafonRosa);
      }
      if (_counterBot1L > 0) {
        enviarDetalleVenta(idVenta, "Botella 1L", _specialPriceBot1L > 0 ? _specialPriceBot1L.toDouble() : 12.0, _counterBot1L);
      }
      if (_counterBot500ml > 0) {
        enviarDetalleVenta(idVenta, "Botella 500ml", _specialPriceBot500ml > 0 ? _specialPriceBot500ml.toDouble() : 8.0, _counterBot500ml);
      }
      // Reiniciar contadores
      setState(() {
        _counter20L = 0;
        _counter10L = 0;
        _counter1L = 0;
        _counterGarrafonRosa = 0;
        _counterBot1L = 0;
        _counterBot500ml = 0;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Venta registrada correctamente'),
            backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Error al registrar venta'),
            backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              Text('Registro de Venta',
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo)),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: [
                    buildProductoCard('Relleno 20L', 15.0, _counter20L,
                        (val) => setState(() => _counter20L = val)),
                    buildProductoCard('Relleno 10L', 9.0, _counter10L,
                        (val) => setState(() => _counter10L = val)),
                    buildProductoCard('Relleno 1L', 3.0, _counter1L,
                        (val) => setState(() => _counter1L = val)),
                    buildProductoCard(
                        'Garrafon Rosa',
                        90.0,
                        _counterGarrafonRosa,
                        (val) => setState(() => _counterGarrafonRosa = val)),
                    buildProductoCard('Botella 1L', 12.0, _counterBot1L,
                        (val) => setState(() => _counterBot1L = val)),
                    buildProductoCard('Botella 500ml', 8.0, _counterBot500ml,
                        (val) => setState(() => _counterBot500ml = val)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Total a pagar: \$${calcularTotal().toStringAsFixed(2)}',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700])),
              SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: enviarVentaYDetalles,
                icon: Icon(Icons.send, size: 26),
                label: Text('Enviar Venta', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
