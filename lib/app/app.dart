import 'package:firebase_cubit/features/splash/splash_screen.dart';
import 'package:firebase_cubit/navigation/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.routes,
    );
  }
}
