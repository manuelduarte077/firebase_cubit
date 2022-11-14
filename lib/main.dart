import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_cubit/app/app.dart';
import 'package:firebase_cubit/cubit/auth_cubit.dart';
import 'package:firebase_cubit/firebase_options.dart';
import 'package:firebase_cubit/repository/auth_repository.dart';
import 'package:firebase_cubit/repository/implementation/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await injectDependencies();

  runApp(
    BlocProvider(
      create: (_) => AuthCubit()..init(),
      child: const MyApp(),
    ),
  );
}

Future<void> injectDependencies() async {
  getIt.registerLazySingleton<AuthRepository>(AuthRepositoryImp.new);
}
