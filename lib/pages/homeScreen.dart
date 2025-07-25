import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Text('Bienvenido a PuriDaily'),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildOptionCard(
                context,
                title: 'V E N T A',
                icon: Icons.shopping_cart,
                route: '/ventas',
              ),
              _buildOptionCard(
                context,
                title: 'R E G I S T R O  L I T R O S',
                icon: Icons.water_drop,
                route: '/regLitros',
              ),
              _buildOptionCard(
                context,
                title: 'R E G I S T R O  E N V Í O S',
                icon: Icons.delivery_dining,
                route: '/bitEnvios',
              ),
              _buildOptionCard(
                context,
                title: 'R E C O L E C C I O N E S',
                icon: Icons.calendar_today,
                route: '/calRecolecciones',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(BuildContext context,
      {required String title, required IconData icon, required String route}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        leading: Icon(icon, size: 40, color: Colors.teal[800]),
        title: Text(
          title,
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal[800]),
        onTap: () => Navigator.pushNamed(context, route),
      ),
    );
  }
}
