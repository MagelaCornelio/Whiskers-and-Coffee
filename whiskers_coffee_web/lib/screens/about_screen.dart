import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Ya no necesitamos Scaffold ni AppBar aquí
    return const Center(
      child: Text('Info Page (Contenido)'),
    );
  }
}
