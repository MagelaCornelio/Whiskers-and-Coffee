import 'package:flutter/material.dart';
import '../main.dart'; // Para acceder a AppColors si es necesario

// Modelo simple para un item del menú (SIN CAMBIOS)
class MenuItem {
  final String name;
  final String description;
  final String price;
  final String? imagePath;

  MenuItem(
      {required this.name,
      required this.description,
      required this.price,
      this.imagePath});
}

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  
  final List<MenuItem> cafes = [
     MenuItem(
        name: 'Affogato',
        description: 'Espresso served over a scoop of vanilla ice cream.',
        price: '3.80€',
        imagePath: 'assets/images/affogato.jpg'),
    MenuItem(
        name: 'Americano',
        description: 'Espresso diluted with hot water.',
        price: '2.00€',
        imagePath: 'assets/images/american.jpg'),
    MenuItem(
        name: 'Bombon',
        description: 'Espresso with layered condensed milk.',
        price: '2.50€',
        imagePath: 'assets/images/bombon.jpg'),
     MenuItem(
        name: 'Coffe with milk',
        description: 'Equal parts hot milk filter coffee.',
        price: '2.00€',
        imagePath: 'assets/images/cafe con leche.jpg'),
    MenuItem(
        name: 'Cappuccino',
        description: 'Espresso, steamed milk and foam.',
        price: '2.80€',
        imagePath: 'assets/images/cappuccino.jpg'),
    MenuItem(
        name: 'Cinnamon Sugar Latte',
        description: 'homemade cinnamon brown sugar syrup, silky smooth steamed milk, and a strong-tasting espresso as the basis for this coffee drink.',
        price: '3.00€',
        imagePath: 'assets/images/cinnamon sugar latte.jpg'),
    MenuItem(
        name: 'Cinnamon Sugar Mocha',
        description:
            'Steamed milk, espresso, chocolate sauce, cinnamon syrup, and whipped cream.',
        price: '3.00€',
        imagePath: 'assets/images/cinnamon sugar mocha.jpg'),
    MenuItem(
        name: 'Cold Brew',
        description: 'Cold infusion, soft and refreshing.',
        price: '3.80€',
        imagePath: 'assets/images/cold brew.jpg'),
    MenuItem(
        name: 'Espresso', 
        description: 'Concentrated coffee, served in a small cup, the basis of many other preparations.',
        price: '1.80€',
        imagePath: 'assets/images/espresso.jpg'),
     MenuItem(
        name: 'Flat White',
        description: 'Similar to latte but with less foam and more concentrate.',
        price: '3.80€',
        imagePath: 'assets/images/flat white.jpg'),   
    MenuItem(
        name: 'Iced Americano',
        description: 'Latte served with ice.',
        price: '2.30€',
        imagePath: 'assets/images/iced americano.jpg'), 
    MenuItem(
        name: 'Iced Latte',
        description: 'American served with ice',
        price: '2.30€',
        imagePath: 'assets/images/iced latte.jpg'),   
    MenuItem(
        name: 'Irish Coffee',
        description: 'Coffee with Irish whiskey, sugar and whipped cream.',
        price: '2.30€',
        imagePath: 'assets/images/irish.jpg'),  
    MenuItem(
        name: 'Latte',
        description: 'Espresso to which abundant steamed milk and a light layer of foam are added.',
        price: '1.50€',
        imagePath: 'assets/images/latte.jpg'),
    MenuItem(
        name: 'Lungo',
        description:'It is prepared using a larger amount of water during the extraction process.',
        price: '1.50€',
        imagePath: 'assets/images/lungo.jpg'),
    MenuItem(
        name: 'Macchiato',
        description: 'Espresso stained with a little milk foam',
        price: '3.00€',
        imagePath: 'assets/images/macchiato.jpg'),
    MenuItem(
        name: 'Mocha',
        description: 'Espresso with chocolate, steamed milk and whipped cream.',
        price: '2.00€',
        imagePath: 'assets/images/mocha.jpg'),
    MenuItem(
        name: 'Ristretto',
        description: 'Shorter, more concentrated espresso, with less water.',
        price: '1.50€',
        imagePath: 'assets/images/ristretto.jpg'),
    MenuItem(
        name: 'Vienes',
        description: 'Coffee with whipped cream.',
        price: '2.00€',
        imagePath: 'assets/images/vienes.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    // --- El método build() NO CAMBIA ---
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Menu',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 15),
          Text(
            'Coffees, caresses and purrs.',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 40),
          _buildCategorySection(context, 'Cafés', cafes),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              "* Ask our staff about gluten-free, vegan, and potential allergen options.",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildCategorySection(
      BuildContext context, String title, List<MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Divider(thickness: 1.5, height: 20),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return _buildMenuItemTile(context, items[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        ),
      ],
    );
  }

  // --- MODIFICACIÓN AQUÍ ---
  // --- Helper para construir la vista de un item del menú (con imagen) ---
  Widget _buildMenuItemTile(BuildContext context, MenuItem item) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      leading: item.imagePath != null
          ? SizedBox(
              // Usamos SizedBox para controlar el tamaño exacto
              width: 70, // Ancho de la imagen
              height: 70, // Alto de la imagen (para que sea cuadrada)
              child: ClipRRect(
                // Para aplicar bordes redondeados
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  item.imagePath!, // Usamos la ruta de la imagen del item
                  fit: BoxFit.cover, // Escala la imagen para cubrir el SizedBox
                  // Placeholder mientras carga (opcional pero bueno)
                  frameBuilder:
                      (context, child, frame, wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded) return child;
                    return AnimatedOpacity(
                      opacity: frame == null ? 0 : 1,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOut,
                      child: child,
                    );
                  },
                  // Widget a mostrar si la imagen falla al cargar
                  errorBuilder: (context, error, stackTrace) {
                    // Muestra un icono genérico si la imagen no se encuentra
                    return Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.local_cafe, // Icono representativo
                        size: 30,
                        color: AppColors.textLight,
                      ),
                    );
                  },
                ),
              ),
            )
          : null, // Si imagePath es null, no mostramos nada en 'leading'

      // --- El resto del ListTile (título, subtítulo) no necesita cambios ---
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Alinea arriba si el texto hace wrap
        children: [
          // Flexible en lugar de Expanded para que se ajuste mejor con el leading
          Flexible(
            child: Padding(
              // Añadimos un pequeño padding derecho por si el precio es largo
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(item.name,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
            ),
          ),
          // El precio se mantiene a la derecha
          Text(item.price,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold, color: AppColors.primaryDark)),
        ],
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(item.description,
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      dense: item.imagePath != null
          ? false
          : true, // Hacemos el tile un poco menos denso si tiene imagen para que quepa mejor
      minLeadingWidth:
          75, // Asegura espacio suficiente para el leading (imagen)
    );
  }
}
