abstract interface class AuthRepository {
  Future<void> singInWithEmail(String email,String password);
  Future<void> singUpWithEmail(String email, String password);
  Future<void> signOut();
}
