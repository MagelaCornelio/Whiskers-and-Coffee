import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart'; // Para AppColors

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  // Helper para lanzar URLs
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      // Podríamos mostrar un snackbar si falla
      debugPrint('No se pudo lanzar $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentYear = DateTime.now().year;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      color: AppColors.primaryDark, // Fondo oscuro para el footer
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // --- Copyright ---
          Text(
            '© $currentYear Whiskers & Coffee. Todos los derechos reservados.',
            style: TextStyle(
                color: AppColors.white.withOpacity(0.8), fontSize: 13),
          ),

          // --- Iconos Redes Sociales ---
          Row(
            children: [
              _socialButton(
                icon: FontAwesomeIcons.instagram,
                tooltip: 'Síguenos en Instagram',
                url: 'https://www.instagram.com/tu_usuario/', // CAMBIA ESTO
              ),
              const SizedBox(width: 15),
              _socialButton(
                icon:
                    FontAwesomeIcons.facebookF, // 'F' para el icono más simple
                tooltip: 'Síguenos en Facebook',
                url: 'https://www.facebook.com/tu_pagina/', // CAMBIA ESTO
              ),
              const SizedBox(width: 15),
              _socialButton(
                icon: FontAwesomeIcons.tiktok,
                tooltip: 'Síguenos en TikTok',
                url:
                    'https://www.tiktok.com/@tu_usuario', // CAMBIA ESTO (Opcional)
              ),
              // Añade más botones si es necesario (Twitter/X, Pinterest, etc.)
            ],
          ),
        ],
      ),
      // Considerar responsive: En pantallas muy pequeñas, podríamos apilar con Column.
    );
  }

  // Helper para crear botones sociales
  Widget _socialButton(
      {required IconData icon, required String tooltip, required String url}) {
    return Tooltip(
      message: tooltip,
      child: IconButton(
        icon: FaIcon(icon, color: AppColors.white.withOpacity(0.9), size: 20),
        onPressed: () => _launchURL(url),
        splashRadius: 25, // Radio del efecto splash al pulsar
        hoverColor:
            AppColors.accent.withOpacity(0.2), // Color al pasar el ratón
      ),
    );
  }
}
