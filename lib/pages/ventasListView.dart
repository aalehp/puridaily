import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:puridaily/consumos.dart';

class VentasListView extends StatefulWidget {
  @override
  _VentasListViewState createState() => _VentasListViewState();
}

class _VentasListViewState extends State<VentasListView> {
  late Future<List<dynamic>> _ventas;

  @override
  void initState() {
    super.initState();
    _ventas = obtenerVentasHoy();
  }

  double calcularTotal(List<dynamic> ventas) {
    double total = 0;
    for (var venta in ventas) {
      total += (venta["imp_venta"] as num).toDouble();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas de Hoy',),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: _ventas,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error al cargar ventas'));
          }

          final ventas = snapshot.data!;
          final total = calcularTotal(ventas);

          if (ventas.isEmpty) {
            return Center(child: Text('No hay ventas hoy'));
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Listado de ventas:',
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: ventas.length + 1,
                  itemBuilder: (context, index) {
                    if (index < ventas.length) {
                      final venta = ventas[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 3,
                        child: ListTile(
                          leading: Icon(Icons.receipt_long, color: Colors.teal),
                          title: Text(
                            'Venta #${venta["id_venta"]}',
                          ),
                          subtitle: Text(
                            'Fecha: ${venta["fech_venta"]}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          trailing: Text(
                            '\$${venta["imp_venta"].toStringAsFixed(2)}',
                          ),
                        ),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          color: Colors.teal[50],
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Center(
                              child: Text(
                                'Total del Día: \$${total.toStringAsFixed(2)}',
                                
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
