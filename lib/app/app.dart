import 'package:firebase_cubit/cubit/auth_cubit.dart';
import 'package:firebase_cubit/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state == AuthState.signedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (route) => false);
        } else if (state == AuthState.signedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (route) => false);
        }
      },
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        theme: ThemeData.from(
          colorScheme: const ColorScheme.light(),
          useMaterial3: true,
        ),
        onGenerateRoute: Routes.routes,
      ),
    );
  }
}
