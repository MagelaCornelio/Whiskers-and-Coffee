import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Usaremos un AppBar por simplicidad ahora
    return AppBar(
      title: InkWell(
        onTap: () => context.go('/'), // Navega a Inicio al tocar el título/logo
        child: const Text('Mi Cafetería'), // O tu logo aquí
      ),
      actions: <Widget>[
        _navButton(context, 'Inicio', '/'),
        _navButton(context, 'Menú', '/menu'),
        _navButton(context, 'Nosotros', '/nosotros'),
        _navButton(context, 'Ubicación', '/ubicacion'),
        _navButton(context, 'Contacto', '/contacto'),
        // Añade aquí botones para Galería, Blog, etc.
        const SizedBox(width: 20), // Un poco de espacio al final
      ],
    );
  }

  // Helper para crear botones de navegación
  Widget _navButton(BuildContext context, String title, String route) {
    // Obtenemos la ruta actual para resaltar el botón activo (opcional)
    final currentLocation = GoRouterState.of(context).uri.toString();
    final bool isActive = currentLocation == route;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          context.go(route); // Navega a la ruta especificada
        },
        style: TextButton.styleFrom(
          foregroundColor:
              isActive ? Colors.amber[300] : Colors.white, // Resaltar activo
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        child: Text(title),
      ),
    );
  }

  // Necesario para implementar PreferredSizeWidget (para usar en AppBar)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
