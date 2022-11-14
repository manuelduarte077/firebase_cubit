import 'dart:async';

import 'package:firebase_cubit/main.dart';
import 'package:firebase_cubit/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { initial, signedOut, signedIn }

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = getIt();
  StreamSubscription? _authSubscription;

  AuthCubit() : super(AuthState.initial);

  /// Esta funcion init es para suscribirme al repository
  Future<void> init() async {
    _authSubscription =
        _authRepository.onAuthStateChanged.listen(_authStateChanged);
  }

  void _authStateChanged(String? userUID) {
    userUID == null ? emit(AuthState.signedOut) : emit(AuthState.signedIn);
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    emit(AuthState.signedOut);
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
