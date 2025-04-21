import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart'; 
import '../screens/menu_screen.dart'; 
import '../screens/about_screen.dart'; 
import '../screens/location_screen.dart'; 
import '../screens/contact_screen.dart';
import '../widgets/main_layout.dart'; 


final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve HomeScreen con MainLayout
        return const MainLayout(child: HomeScreen());
      },
      // ... (resto de la ruta '/')
    ),
    GoRoute(
      path: '/menu',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve MenuScreen con MainLayout
        return const MainLayout(child: MenuScreen());
      },
    ),
    GoRoute(
      path: '/nosotros',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve AboutScreen con MainLayout
        return const MainLayout(child: AboutScreen());
      },
    ),
    GoRoute(
      path: '/ubicacion',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve LocationScreen con MainLayout
        return const MainLayout(child: LocationScreen());
      },
    ),
    GoRoute(
      path: '/contacto',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve ContactScreen con MainLayout
        return const MainLayout(child: ContactScreen());
      },
    ),
    // ... (resto de rutas)
  ],
  // ... (errorBuilder)
);

