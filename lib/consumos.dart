import 'package:http/http.dart' as http;
import 'dart:convert';

String ip = "http://129.146.42.34:3000/"; // Define la IP del servidor


//funcion ventas
Future<int> enviarVenta(String fecha, double importe, String fechaCreacion) async {
  final url = Uri.parse('${ip}ventas');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "fech_venta": fecha,
      "imp_venta": importe,
      "fech_creacion": fechaCreacion,
    }),
  );  

  if (response.statusCode == 200 || response.statusCode == 201) {
    final Map<String, dynamic> data = jsonDecode(response.body);
     String mensaje = data['message'];
    int idVenta = data['id'];
   return idVenta;
  } else {
    return -1; // Retorna null si la solicitud falla
  }
}

//Funcion detalle ventas
Future<void> enviarDetalleVenta(int idVenta, String producto, double precioUni, int cantidad) async {
  final url = Uri.parse('${ip}det-venta');
  double total = cantidad * precioUni;

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "id_venta": idVenta,
      "producto": producto,
      "imp_uni": precioUni,
      "imp_tot": total,
      "cant_prod": cantidad,
    }),
  );
}

Future<List<dynamic>> obtenerVentasHoy() async {
  final url = Uri.parse('${ip}ventas-hoy');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Error al cargar ventas');
  }
}