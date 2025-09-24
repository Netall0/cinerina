import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cinerina/core/bloc/bloc_transformer.dart';
import 'package:cinerina/feature/auth/data/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  late StreamSubscription _authSubscription;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(AuthInitial()) {
    _authSubscription = authRepository.authStateChanges.listen(
      (user) => add(AuthUserChanged(user)),
    );

    on<AuthEvent>((event, emit) {
      return switch (event) {
        AuthChechRequested() => _authChechRequested(event, emit),
        AuthLoginRequested() => _authLoginRequested(event, emit),
        AuthSignUpRequested() => _authSignUpRequested(event, emit),
        AuthLogoutRequested() => _authLogoutRequested(event, emit),
        AuthUserChanged() => _onAuthUserChanged(event, emit),
      };
    }, transformer: BlocTransformer.sequential());
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    final user = event.user;
    user != null
        ? emit(AuthAuthenticated(user: user))
        : emit(const AuthError(errorMessage: 'Login failed'));
  }

  Future<void> _authLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
    } on Object catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> _authSignUpRequested(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.singUpWithEmail(event.email, event.password);
    } on Object catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> _authLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _authRepository.singInWithEmail(event.email, event.password);
    } on Object catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  Future<void> _authChechRequested(
    AuthChechRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final user = _authRepository.currentUser;
      user == null
          ? emit(AuthUnauthenticated())
          : emit(AuthAuthenticated(user: user));
    } on Object catch (e) {
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _authSubscription.cancel();
    return super.close();
  }
}
