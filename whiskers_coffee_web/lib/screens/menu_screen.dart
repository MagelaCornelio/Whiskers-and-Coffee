import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ya no necesitamos Scaffold ni AppBar aquí
    return const Center(
      child: Text('Menu Page (Contenido)'),
    );
  }
}
