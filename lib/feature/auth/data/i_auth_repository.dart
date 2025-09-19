import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/auth/bloc/auth_bloc.dart';
import 'package:cinerina/feature/auth/data/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final class IAuthRepository with LoggerMixin implements AuthRepository {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  User? get currentUser => _client.auth.currentUser;


  IAuthRepository();


  @override
  Stream<User?> get authStateChanges => _client.auth.onAuthStateChange.map((data) => data.session?.user);
  
  

  @override
  Future<void> signOut() async {
    await _client.auth.signOut();
  }
 
  @override
  Future<void> singInWithEmail(String email, String password) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      logInfo('User logged in successfully: ${response.user!.email}');
    } on Object catch (e) {
      logError('Login error: ${e.toString()}');
      rethrow;
    }
  }

  @override
  Future<void> singUpWithEmail(String email, String password) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      logInfo('User registered successfully: ${response.user!.email}');
    } on Object catch (e) {
      logError('Registration error: ${e.toString()}');
      rethrow;
    }
  }
}
