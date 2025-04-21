import 'package:flutter/material.dart';
import '../main.dart'; // Para AppColors

// Estructura simple para datos de los gatos (opcional pero útil)
class CatInfo {
  final String name;
  final String imagePath;

  CatInfo({required this.name, required this.imagePath});
}

class AboutScreen extends StatelessWidget {
  AboutScreen(
      {super.key}); // Corregido: Se quita 'const' si la lista no es const

  // Lista de ejemplo de gatos (¡Reemplaza con los tuyos!)
  final List<CatInfo> nuestrosGatos = [
    CatInfo(name: 'Luna', imagePath: 'assets/images/luna.jpg'),
    CatInfo(name: 'Simba', imagePath: 'assets/images/simba.jpg'),
    CatInfo(name: 'Cleo', imagePath: 'assets/images/cleo.jpg'),
    CatInfo(name: 'Oliver', imagePath: 'assets/images/oliver.jpg'),
    CatInfo(name: 'Together', imagePath: 'assets/images/todos.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // Usamos un Stack para superponer el fondo y el contenido
    return Stack(
      children: [
        // --- Capa 1: Imagen de Fondo ---
        Positioned.fill(
          // Hace que la imagen llene todo el espacio del Stack
          child: Image.asset(
            'assets/images/fondo.jpg', // TU IMAGEN DE FONDO
            fit: BoxFit.cover, // Cubre todo el área, puede recortar la imagen
            // fit: BoxFit.fill, // Estira la imagen para llenar, puede distorsionarla
            // fit: BoxFit.contain, // Muestra la imagen completa, puede dejar barras
            errorBuilder: (context, error, stackTrace) {
              // Fallback si la imagen no carga: usa el color de fondo del tema
              print(
                  "Error loading background image: $error"); // Log para depuración
              return Container(color: AppColors.background);
            },
          ),
        ),

        // --- Capa 2: Overlay para Legibilidad (¡MUY IMPORTANTE!) ---
        Positioned.fill(
          child: Container(
            // Elige un color y opacidad que permita leer el texto encima
            // Puedes usar el color de fondo base con opacidad o un color oscuro
            color: AppColors.background
                .withOpacity(0.50), // Ejemplo: Beige claro semi-transparente
            // color: Colors.black.withOpacity(0.5), // Ejemplo: Negro semi-transparente
          ),
        ),

        // --- Capa 3: Contenido Scrollable ---
        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where coffee and cats make you purr',
                // Quizás necesites ajustar el color del texto para mejor contraste
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color:
                          AppColors.primaryDark, // Asegúrate que contraste bien
                      // Opcional: Añadir sombra para destacar
                      // shadows: [
                      //   Shadow(
                      //     blurRadius: 3.0,
                      //     color: Colors.black.withOpacity(0.6),
                      //     offset: Offset(1.0, 1.0),
                      //   ),
                      // ]
                    ),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/local.jpg', // Imagen principal del local
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                      height: 350,
                      color: Colors.grey[300]
                          ?.withOpacity(0.7), // Un poco transparente
                      child: const Center(
                          child: Icon(Icons.pets,
                              size: 50, color: AppColors.textLight))),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Our History: Coffee, Cats, and Community',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryDark // Ajusta color si es necesario
                    // Añadir sombra opcionalmente
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                'The idea for Whiskers & Coffee was born from two great passions: the comforting aroma of good coffee and the unconditional love for cats. We dreamed of creating a unique haven in CatLandia, a place where people could disconnect from daily stress, enjoy a cup of specialty coffee, and at the same time experience the joy and calm that only feline companionship can offer.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textDark, // Ajusta color si es necesario
                      // backgroundColor: Colors.white.withOpacity(0.1) // Fondo sutil opcional para texto
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                'We are not just a coffee shop, we are a temporary home for rescued cats in partnership with RescuedKittens. Our main objective is to promote animal welfare and facilitate responsible adoptions. Every visit to our cafeteria helps to keep our feline residents and give them the opportunity to find a forever home.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: 30),

              Text(
                'Meet the Michis',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              const SizedBox(height: 15),
              Text(
                'The true protagonists of Whiskers & Coffee are our cats. They live in a space designed for their comfort and safety, with areas for resting, playing, and exploring. All of our cats are healthy, socialized, and ready to interact (if they want to, of course!). You can observe them, play with them (following our rules of coexistence) and, who knows, maybe find your new best friend.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: 25),
              _buildCatGallery(context), // Widget para mostrar las fotos
              const SizedBox(height: 25),
              Text(
                'Remember that the well-being of our cats is a priority. We ask that you always follow the directions of our staff for a respectful and safe interaction for all.',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: AppColors.textLight), // Texto sutil
              ),
              const SizedBox(height: 30),

              Text(
                'Quality in every cup',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.primaryDark),
              ),
              const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    'assets/images/cafe.jpg',
                    height: 250,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                        height: 250,
                        width: 250,
                        color: Colors.grey[300]?.withOpacity(0.7),
                        child: const Center(
                            child: Icon(Icons.local_cafe,
                                size: 50, color: AppColors.textLight))),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'And of course, we do not forget coffee. We select high-quality beans, roast them with care and our baristas prepare each drink with dedication, so that your experience is complete: excellent coffee in the best feline company.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: AppColors.textDark),
              ),
              const SizedBox(height: 40),

              Text(
                'We are waiting for you!',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: AppColors.primaryDark),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Widget Helper para la Galería de Gatos --- (Sin cambios necesarios aquí)
  Widget _buildCatGallery(BuildContext context) {
    if (nuestrosGatos.isEmpty) {
      return const SizedBox.shrink();
    }
    // ... (código del _buildCatGallery se mantiene igual)
    return Wrap(
      spacing: 15.0,
      runSpacing: 15.0,
      alignment: WrapAlignment.center,
      children: nuestrosGatos.map((cat) {
        return SizedBox(
          width: 150,
          child: Column(
            children: [
              Card(
                // Envolver en Card para posible fondo sutil
                elevation: 3.0, // Sombra ligera
                color: Colors.white
                    .withOpacity(0.9), // Fondo blanco casi opaco para fotos
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                clipBehavior: Clip.antiAlias, // Importante con Card y ClipRRect
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(10.0), // Redondeo consistente
                  child: Image.asset(
                    cat.imagePath,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                        height: 150,
                        width: 150,
                        color: Colors.grey[200]?.withOpacity(0.8),
                        child:
                            const Icon(Icons.pets, color: AppColors.textLight)),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cat.name,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark), // Asegurar color
                textAlign: TextAlign.center,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

