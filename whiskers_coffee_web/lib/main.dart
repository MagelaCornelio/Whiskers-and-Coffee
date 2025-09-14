import 'package:flutter/material.dart';
import 'config/router.dart'; // Importa tu configuración de router

// Define tus colores personalizados para fácil acceso
abstract class AppColors {
  static const Color primaryDark =
      Color.fromARGB(255, 107, 100, 94); // Marrón Oscuro
  static const Color primaryLight = Color(0xFFFFF8E1); // Crema / Beige Claro
  static const Color accent = Color.fromARGB(255, 151, 120, 78); // Ámbar
  static const Color textDark = Color(0xFF333333); // Gris Oscuro (casi negro)
  static const Color textLight = Color(0xFF757575); // Gris Medio
  static const Color white = Color(0xFFFFFFFF);
  static const Color background =
      Color(0xFFFAFAFA); // Un blanco ligeramente roto para el fondo general
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Whiskers & Coffee', // Asegúrate que este sea tu nombre
      theme: ThemeData(
        brightness: Brightness.light,
        // Usar nuestros colores personalizados
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(
              255, 110, 88, 83), // El color base para generar la paleta
          primary: const Color.fromARGB(255, 107, 88, 88),
          secondary: const Color.fromARGB(255, 99, 84, 66),
          background: const Color.fromARGB(
              255, 219, 164, 127), // Fondo general de la app
          surface: AppColors.white, // Fondo de elementos como Cards
          onPrimary: AppColors.white, // Texto/iconos sobre primaryDark
          onSecondary: AppColors.textDark, // Texto/iconos sobre accent
          onBackground: AppColors.textDark, // Texto principal sobre background
          onSurface:
              AppColors.textDark, // Texto principal sobre surface (cards, etc)
          error: Colors.redAccent, // Color para errores
        ),
        scaffoldBackgroundColor: AppColors.background, // Fondo de los Scaffold

        // Definir fuentes (Asegúrate de tenerlas o usa las de Google Fonts)
        fontFamily:
            'Roboto', // Puedes cambiarla si añades una fuente personalizada

        // Estilos de Texto
        textTheme: const TextTheme(
          // Para títulos muy grandes (como el Hero)
          headlineLarge: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryDark,
              fontFamily: 'RobotoSlab'), // Ejemplo con otra fuente
          // Para títulos de sección
          headlineMedium: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryDark,
              fontFamily: 'RobotoSlab'),
          // Para títulos de tarjetas o elementos importantes
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppColors.textDark),
          // Para subtítulos o texto un poco menos importante
          titleMedium: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark),
          // Texto principal del cuerpo
          bodyLarge:
              TextStyle(fontSize: 16.0, color: AppColors.textDark, height: 1.5),
          // Texto secundario o descripciones
          bodyMedium: TextStyle(
              fontSize: 14.0, color: AppColors.textLight, height: 1.4),
          // Texto para botones
          labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),

        // Estilos de Botones
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  AppColors.accent, // Color de fondo del botón principal
              foregroundColor:
                  AppColors.textDark, // Color del texto del botón principal
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryDark, // Color del texto
              textStyle: const TextStyle(fontWeight: FontWeight.w600)),
        ),

        // Estilo de AppBar (NavBar)
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors
                .white, // Color del título y botones de texto en AppBar
            elevation: 3.0,
            titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
                fontFamily: 'Roboto')),

        // Estilo de Cards
        cardTheme: CardThemeData(
          color: AppColors.white, // Fondo de las tarjetas
          elevation: 2.0,
          margin:
              const EdgeInsets.symmetric(vertical: 8.0), // Margen por defecto
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          clipBehavior:
              Clip.antiAlias, // Importante para que imágenes respeten bordes
        ),

        // Estilo para InputFields (útil para el formulario de contacto)
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.grey[400]!)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide:
                  const BorderSide(color: AppColors.primaryDark, width: 2.0)),
          labelStyle: const TextStyle(color: AppColors.textLight),
          hintStyle: const TextStyle(color: AppColors.textLight),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        ),

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
