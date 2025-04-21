import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// Asumiendo que AppColors estaba definido en main.dart o similar
import '../main.dart'; // Ajusta la ruta si es necesario

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  // Definíamos la lista de items aquí o implícitamente en el map
  final List<Map<String, String>> navItems = const [
    {'title': 'Home', 'route': '/'},
    {'title': 'Menu', 'route': '/menu'},
    {'title': 'About Us', 'route': '/nosotros'},
    // Añadir más si existían en ese momento
  ];

  @override
  Widget build(BuildContext context) {
    // Este widget devolvía directamente un AppBar
    return AppBar(
      // Los estilos (colores, etc.) venían del ThemeData global
      title: InkWell(
        onTap: () => context.go('/'), // Navega a Inicio al tocar el título/logo
        // Asegúrate que el nombre sea el correcto
        child: const Text('Whiskers & Coffee'),
      ),
      actions: <Widget>[
        // Generaba los botones de navegación directamente aquí
        ...navItems.map((item) {
          return _navButton(context, item['title']!, item['route']!);
        }).toList(),
        const SizedBox(width: 20), // Un poco de espacio al final
      ],
    );
  }

  // Helper para crear botones de navegación
  Widget _navButton(BuildContext context, String title, String route) {
    // Obteníamos la ruta actual para resaltar el botón activo (opcional)
    final currentLocation = GoRouterState.of(context).uri.toString();
    final bool isActive = currentLocation == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          context.go(route); // Navega a la ruta especificada
        },
        style: TextButton.styleFrom(
          // Usaba colores del tema o definidos aquí
          foregroundColor:
              isActive ? AppColors.accent : AppColors.white, // Resaltar activo
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        child: Text(title),
      ),
    );
  }

  // Necesario para implementar PreferredSizeWidget (para usar en AppBar)
  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Altura estándar de AppBar
}
