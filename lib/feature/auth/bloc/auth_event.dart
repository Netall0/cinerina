part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent({this.email, this.password});

  final String? email;
  final String? password;
}

final class AuthChechRequested extends AuthEvent {
  const AuthChechRequested({required super.email, required super.password});

  @override
  int get hashCode => Object.hashAll([email, password]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthChechRequested &&
          email == other.email &&
          password == other.password;
}

class AuthLoginRequested extends AuthEvent {
  const AuthLoginRequested({required this.email, required this.password});

  @override
  // TODO: implement email
  final String email;

  @override
  // TODO: implement password
  final String password;

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hashAll([email, password]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthChechRequested &&
          email == other.email &&
          password == other.password;
}

class AuthSignUpRequested extends AuthEvent {
  const AuthSignUpRequested({required this.email, required this.password});

  @override
  // TODO: implement email
  final String email;

  @override
  // TODO: implement password
  final String password;

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hashAll([email, password]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthSignUpRequested &&
          email == other.email &&
          password == other.password;
}

class AuthLogoutRequested extends AuthEvent {
  const AuthLogoutRequested({required super.email, required super.password});

  @override
  int get hashCode => Object.hashAll([email, password]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthChechRequested &&
          email == other.email &&
          password == other.password;
}
