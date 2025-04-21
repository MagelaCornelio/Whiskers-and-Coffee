import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/home_screen.dart'; 
import '../screens/menu_screen.dart'; 
import '../screens/about_screen.dart'; 
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
        return MainLayout(child: MenuScreen());
      },
    ),
    GoRoute(
      path: '/nosotros',
      builder: (BuildContext context, GoRouterState state) {
        // Envuelve AboutScreen con MainLayout
        return MainLayout(child: AboutScreen());
      },
    ),
    // ... (resto de rutas)
  ],
  // ... (errorBuilder)
);

