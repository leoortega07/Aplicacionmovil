import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cuenta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Nombre Completo'),
              subtitle: Text(user?.displayName ?? 'N/A'),
            ),
            ListTile(
              title: Text('Correo Electrónico'),
              subtitle: Text(user?.email ?? 'N/A'),
            ),
            ListTile(
              title: Text('Fecha de Nacimiento'),
              subtitle: Text('No disponible'), // Tendrías que gestionar este dato
            ),
          ],
        ),
      ),
    );
  }
}

