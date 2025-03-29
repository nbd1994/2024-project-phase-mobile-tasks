part of 'auth_bloc.dart';

// Note: Removed import 'package:equatable/equatable.dart'; - It belongs in auth_bloc.dart

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

// Event for email/username changes
class AuthEmailChanged extends AuthEvent {
  final String email;

  const AuthEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

// Event for password changes
class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

// Event to toggle password visibility
class AuthPasswordVisibilityToggled extends AuthEvent {}

// Event for sign-in attempt (can add more specific events later)
class AuthSignInRequested extends AuthEvent {}

// Event for sign-up attempt (can add more specific events later)
class AuthSignUpRequested extends AuthEvent {}