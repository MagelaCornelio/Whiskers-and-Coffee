import 'package:flutter/material.dart';
import 'navbar.dart'; // Importa tu NavBar

class MainLayout extends StatelessWidget {
  final Widget child; // El contenido específico de cada página

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(), // Usa la NavBar reutilizable
      body: child, // Muestra el contenido de la página actual
      // Aquí podríamos añadir un Footer en el futuro:
      // bottomNavigationBar: FooterWidget(),
    );
  }
}
