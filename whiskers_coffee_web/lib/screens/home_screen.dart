import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos SingleChildScrollView para permitir el scroll si el contenido es muy largo
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Estira los hijos horizontalmente
        children: [
          // --- 1. Hero Section ---
          _buildHeroSection(context),

          // Espaciador
          const SizedBox(height: 40),

          // --- 2. Resumen Sobre Nosotros ---
          _buildAboutSummary(context),

          // Espaciador
          const SizedBox(height: 40),

          // --- 3. Destacados del Menú ---
          _buildMenuHighlights(context),

          // Espaciador
          const SizedBox(height: 40),

          // --- 4. Resumen Ubicación y Horario ---
          _buildLocationSummary(context),

          // Espaciador al final antes del footer (si lo hubiera)
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  // --- Widget para la Sección Hero ---
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      height: 400, // Altura del banner
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/banner.jpg'),
          fit: BoxFit.cover, // Cubre todo el contenedor
          // Añadir un filtro oscuro para que el texto resalte más
          colorFilter: ColorFilter.mode(
            Colors.black38,
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'The art of specialty Coffee and its Whiskers',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Text(
              'Discover unique flavors alongside your favorite kitties', // Personaliza
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: const Color.fromARGB(255, 250, 250, 250),
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () =>
                  context.go('/menu'), // Navega a la página de menú
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber[700], // Color del botón
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              child: const Text('Our Menu'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 50.0, vertical: 20.0), // Padding lateral
      child: Row(
        // Usamos Row para poner texto e imagen lado a lado (en pantallas grandes)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Columna para el texto
          Expanded(
            // Toma el espacio disponible
            flex: 2, // Toma más espacio que la imagen
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Our Passion',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.brown[800],
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 15),
                Text(
                  'Every cup tells a story at Whiskers & Coffee, enhanced by the soothing presence of our feline residents. We passionately source unique single-origin beans, roast them with precision, and prepare your coffee with the focused care it deserves. We are more than just a café; we are a welcoming community united by a shared love for exceptional coffee and the comforting charm of kittens.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(height: 1.5), // Altura de línea
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () => context.go('/nosotros'),
                  child: const Text('Learn more about us →'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 40), 
          Expanded(
            flex: 1,
            child: ClipRRect(
              // Para bordes redondeados
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/interior.jpg', // Asegúrate que exista
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- Widget para los Destacados del Menú ---
  Widget _buildMenuHighlights(BuildContext context) {
    return Column(
      children: [
        Text(
          'Featured',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.brown[800],
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 30),
        // Usaremos Wrap para que los elementos se ajusten si no caben en una fila
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Wrap(
            spacing: 30.0, // Espacio horizontal entre tarjetas
            runSpacing: 30.0, // Espacio vertical entre filas de tarjetas
            alignment: WrapAlignment.center,
            children: [
              _buildHighlightCard(
                context,
                'Espresso',
                'Intense and aromatic, the perfect base.',
                'assets/images/espresso.jpg',
              ),
              _buildHighlightCard(
                context,
                'Affogato',
                'A perfect combination of hot and cold',
                'assets/images/affogato.jpg',
              ),
              _buildHighlightCard(
                context,
                'Iced Latte',
                'Delicious and refreshing, perfect for a hot day',
                'assets/images/iced latte.jpg',
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => context.go('/menu'),
          child: const Text('See our full menu'),
        ),
      ],
    );
  }

  // Helper para crear las tarjetas de destacados
  Widget _buildHighlightCard(BuildContext context, String title,
      String description, String imagePath) {
    return Container(
      width: 280, // Ancho fijo para las tarjetas (ajustar según necesidad)
      child: Card(
        clipBehavior:
            Clip.antiAlias, // Para que la imagen respete los bordes de la Card
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 180,
              width: double.infinity, // Ocupa todo el ancho de la Card
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget para el Resumen de Ubicación y Horario ---
  Widget _buildLocationSummary(BuildContext context) {
    return Container(
      color: Colors.brown[50], // Un fondo suave para diferenciar la sección
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Espacio entre elementos
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Columna Ubicación
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.brown[600], size: 30),
              const SizedBox(height: 10),
              Text(
                'Find us',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Calle Falsa 123, Piso 4\n Villa Catlandia', // Personaliza
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

            ],
          ),

          // Columna Horario
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.access_time, color: Colors.brown[600], size: 30),
              const SizedBox(height: 10),
              Text(
                'Our Schedule',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Monday to Friday: 8:00 - 20:00\nSaturdays: 9:00 - 18:00\nSundays: Closed', // Personaliza
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              // Podrías añadir aquí un link a contacto o repetir el horario completo en su página
            ],
          ),
        ],
      ),
      // NOTA: Este Row también necesitaría ajustes para pantallas pequeñas (apilar las columnas).
    );
  }
}
