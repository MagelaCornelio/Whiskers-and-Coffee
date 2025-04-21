import 'package:flutter/material.dart';
import 'config/router.dart'; // Importa tu configuración de router

void main() {
  runApp(const MyApp());
}

// En lib/main.dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Cafetería El Grano Feliz', // Cambia el título
      theme: ThemeData(
        brightness: Brightness.light, // Modo claro (puedes probar .dark)
        primarySwatch: Colors.brown, // Paleta base
        // Puedes definir colores más específicos:
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
          accentColor: Colors.amber[700], // Color de acento para botones, etc.
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white, // Color de fondo general
        fontFamily:
            'Roboto', // Asegúrate de tener la fuente o usa una por defecto
        // Definir algunos estilos de texto globales puede ser útil
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
          headlineMedium: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
              color: Colors.black87),
          titleLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
          bodyLarge: TextStyle(
              fontSize: 16.0, height: 1.5), // Buen tamaño para lectura
          bodyMedium: TextStyle(fontSize: 14.0),
        ),
        // Estilo global para ElevatedButton (puedes sobreescribirlo localmente)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // Color del texto del botón
            backgroundColor: Colors.brown[700], // Color de fondo del botón
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        // Estilo para TextButton
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.brown[800], // Color del texto
          ),
        ),
        // Estilo para AppBar (nuestra NavBar)
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[800],
          foregroundColor: Colors.white, // Color del título y botones de texto
          elevation: 2.0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
