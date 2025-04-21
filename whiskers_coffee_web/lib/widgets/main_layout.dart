import 'package:flutter/material.dart';
import '../main.dart';
import 'navbar.dart'; // Importaba el widget NavBar completo

class MainLayout extends StatelessWidget {
  final Widget child; // El contenido específico de cada página

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usaba la NavBar reutilizable directamente como AppBar
      // Toda la lógica de la barra estaba dentro del widget NavBar
      appBar: const NavBar(),

      // Muestra el contenido de la página actual que se le pasa
      body: child,

      // Aquí podríamos añadir un Footer en el futuro (estaba comentado):
      // bottomNavigationBar: FooterWidget(),
    );
  }
}

  // Widget privado para construir el Drawer (menú lateral móvil)
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Quita el padding por defecto del ListView
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: AppColors.primaryDark, // Color de fondo del header
                image: DecorationImage(
                    // Imagen opcional para el header
                    // Asegúrate que esta imagen exista en assets/images/
                    image:
                        const AssetImage('assets/images/drawer_header_bg.jpg'),
                    fit: BoxFit.cover,
                    // Filtro para oscurecer un poco la imagen y que el texto resalte
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken))),
            child: Align(
              // Alinea el texto abajo a la izquierda (opcional)
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Whiskers & Coffee', // REEMPLAZA CON EL NOMBRE DE TU CAFETERÍA
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.white,
                      // Sombra opcional para mayor legibilidad sobre imagen
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(1.0, 1.0),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.close, color: AppColors.textLight),
            title: const Text('Cerrar Menú'),
            onTap: () {
              Navigator.pop(context); // Cierra el Drawer
            },
          ),
        ],
      ),
    );
  }

// **Recordatorios:**
// 1. Asegúrate de que la ruta a `navbar_items.dart` y `main.dart` (para `AppColors`) sea correcta.
// 2. Reemplaza 'Whiskers & Coffee' con el nombre real de tu cafetería.
// 3. Si decides usar la imagen `drawer_header_bg.jpg`, asegúrate de crearla, ponerla en `assets/images/` y declararla en `pubspec.yaml`. Si no la quieres, elimina la propiedad `image:` del `BoxDecoration` del `DrawerHeader`.