import 'package:flutter/material.dart';
import 'package:lybrary/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lybrary'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Buscar'),
            onTap: () {
              Navigator.pushNamed(context, '/search');
            },
          ),
          ListTile(
            title: Text('Agregar Libro'),
            onTap: () {
              Navigator.pushNamed(context, '/addBook');
            },
          ),
          ListTile(
            title: Text('Favoritos'),
            onTap: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
          ListTile(
            title: Text('Cuenta'),
            onTap: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
          ListTile(
            title: Text('Cerrar Sesión'),
            onTap: () async {
              var Provider;
              await Provider.of<AuthService>(context, listen: false).signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
