


abstract class AuthRepository {
  /// Para suscribirmos a este estado
  Stream<String?> get onAuthStateChanged;

  Future<void> signOut();
}
