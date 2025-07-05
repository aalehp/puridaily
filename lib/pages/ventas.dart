import 'package:flutter/material.dart';
import 'package:counter_button/counter_button.dart';
import 'package:intl/intl.dart';
import 'package:puridaily/consumos.dart';
//clase cosumos api

class Ventas extends StatefulWidget {
  const Ventas({super.key});

  @override
  State<Ventas> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Ventas> {
  int _counter15L = 0;
  int _counter10L = 0;
  int _counter1L = 0;
  int _counterGarrafonRosa = 0;
  int _counterBot1L = 0;
  int _counterBot500ml = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: ListView(children: [
        SafeArea(
          minimum: EdgeInsets.fromLTRB(17, 30, 15, 35),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Text(
                    'R E G I S T R O  V E N T A',
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900]),
                  ),
                ),
              ),
              Row(children: [
                //Fila rellenos 20L y 15L
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(
                            children: [
                              Text('Relleno 20L',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Precio: \$15.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    if (val < 0) {
                                      val = 0; // Prevent negative values
                                    }
                                    _counter15L = val;
                                  });
                                },
                                count: _counter15L,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              )
                            ],
                          )))
                ]),
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(children: [
                            Text('Relleno 10L',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Precio: \$9.00',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            CounterButton(
                              loading: false,
                              onChange: (int val) {
                                setState(() {
                                  if (val < 0) {
                                    val = 0; // Prevent negative values
                                  }
                                  _counter10L = val;
                                });
                              },
                              count: _counter10L,
                              countColor: Colors.purple,
                              buttonColor: Colors.purpleAccent,
                              progressColor: Colors.purpleAccent,
                            )
                          ])))
                ])
              ]),
              Row(children: [
                //Fila relleno 1L y Garrafon rosa
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(
                            children: [
                              Text('Relleno 1L',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Precio: \$3.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    if (val < 0) {
                                      val = 0; // Prevent negative values
                                    }
                                    _counter1L = val;
                                  });
                                },
                                count: _counter1L,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              )
                            ],
                          )))
                ]),
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(children: [
                            Text('Garrafon Rosa',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Precio: \$90.00',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            CounterButton(
                              loading: false,
                              onChange: (int val) {
                                setState(() {
                                  if (val < 0) {
                                    val = 0; // Prevent negative values
                                  }
                                  _counterGarrafonRosa = val;
                                });
                              },
                              count: _counterGarrafonRosa,
                              countColor: Colors.purple,
                              buttonColor: Colors.purpleAccent,
                              progressColor: Colors.purpleAccent,
                            )
                          ])))
                ])
              ]),
              Row(children: [
                //Fila relleno botellas 1L y 500ml
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(
                            children: [
                              Text('Botella 1L',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              Text('Precio: \$12.00',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                              CounterButton(
                                loading: false,
                                onChange: (int val) {
                                  setState(() {
                                    if (val < 0) {
                                      val = 0; // Prevent negative values
                                    }
                                    _counterBot1L = val;
                                  });
                                },
                                count: _counterBot1L,
                                countColor: Colors.purple,
                                buttonColor: Colors.purpleAccent,
                                progressColor: Colors.purpleAccent,
                              )
                            ],
                          )))
                ]),
                Column(children: [
                  Card(
                      child: SizedBox(
                          width: 170,
                          height: 150,
                          child: Column(children: [
                            Text('Botella 500ml',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Text('Precio: \$8.00',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal)),
                            CounterButton(
                              loading: false,
                              onChange: (int val) {
                                setState(() {
                                  if (val < 0) {
                                    val = 0; // Prevent negative values
                                  }
                                  _counterBot500ml = val;
                                });
                              },
                              count: _counterBot500ml,
                              countColor: Colors.purple,
                              buttonColor: Colors.purpleAccent,
                              progressColor: Colors.purpleAccent,
                            )
                          ])))
                ])
              ]),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    'Total a pagar: \$${((_counter15L * 15) + (_counter10L * 9) + (_counter1L * 3) + (_counterGarrafonRosa * 90) + (_counterBot1L * 12) + (_counterBot500ml * 8)).toStringAsFixed(2)}',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.purpleAccent),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: ElevatedButton(
                    onPressed: () async {
                      // Formatea la fecha como dd/MM/yyyy
                      final String fechaFormateada =
                          DateFormat('yyyy/MM/dd').format(DateTime.now());
                      double total = ((_counter15L * 15) +
                          (_counter10L * 9) +
                          (_counter1L * 3) +
                          (_counterGarrafonRosa * 90) +
                          (_counterBot1L * 12) +
                          (_counterBot500ml * 8));
                      int resp = await enviarVenta(fechaFormateada, total);
                      if (resp != -1) {
                        int idVenta = resp;
                        if (_counter15L > 0) {
                          enviarDetalleVenta(
                              idVenta, "Relleno 20L", 15, _counter15L);
                        }
                        if (_counter10L > 0) {
                          enviarDetalleVenta(
                              idVenta, "Relleno 10L", 9, _counter10L);
                        }
                        if (_counter1L > 0) {
                          enviarDetalleVenta(
                              idVenta, "Relleno 1L", 3, _counter1L);
                        }
                        if (_counterGarrafonRosa > 0) {
                          enviarDetalleVenta(idVenta, "Garrafon Rosa", 90,
                              _counterGarrafonRosa);
                        }
                        if (_counterBot1L > 0) {
                          enviarDetalleVenta(
                              idVenta, "Botella 1L", 12, _counterBot1L);
                        }
                        if (_counterBot500ml > 0) {
                          enviarDetalleVenta(
                              idVenta, "Botella 500ml", 8, _counterBot500ml);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Error al enviar la venta.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                      // Reinicia los contadores
                      setState(() {
                        _counter15L = 0;
                        _counter10L = 0;
                        _counter1L = 0;
                        _counterGarrafonRosa = 0;
                        _counterBot1L = 0;
                        _counterBot500ml = 0;
                      });
                      // Muestra un mensaje de éxito
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Venta registrada correctamente.'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: Text('Enviar venta'),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
