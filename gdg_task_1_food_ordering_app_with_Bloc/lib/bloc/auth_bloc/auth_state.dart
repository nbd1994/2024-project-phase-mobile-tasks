part of 'auth_bloc.dart';

// Note: Removed import 'package:equatable/equatable.dart'; - It belongs in auth_bloc.dart

// Define possible statuses for the authentication process
enum AuthStatus { initial, loading, success, failure }

class AuthState extends Equatable {
  final String email;
  final String password;
  final bool isPasswordVisible;
  final AuthStatus status;
  final String? errorMessage; // Optional error message

  const AuthState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.status = AuthStatus.initial,
    this.errorMessage,
  });

  // Helper method to create a copy of the state with updated values
  AuthState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    AuthStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage, // Keep or update error message
    );
  }

  @override
  List<Object?> get props => [email, password, isPasswordVisible, status, errorMessage];
}