import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepository {
  Future<void> singInWithEmail(String email, String password);
  Future<void> singUpWithEmail(String email, String password);
  Future<void> signOut();

  User? get currentUser;
  Stream<User?> get authStateChanges;
}
