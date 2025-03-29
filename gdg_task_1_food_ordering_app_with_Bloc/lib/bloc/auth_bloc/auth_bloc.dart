import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart'; // Added Equatable import

// Import event and state files
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) { // Initialize with default state
    // Register event handlers
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<AuthPasswordVisibilityToggled>(_onPasswordVisibilityToggled);
    on<AuthSignInRequested>(_onSignInRequested);
    on<AuthSignUpRequested>(_onSignUpRequested);
  }

  // Handler for email changes
  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(email: event.email, status: AuthStatus.initial)); // Reset status on input change
  }

  // Handler for password changes
  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(password: event.password, status: AuthStatus.initial)); // Reset status on input change
  }

  // Handler for toggling password visibility
  void _onPasswordVisibilityToggled(AuthPasswordVisibilityToggled event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  // Handler for sign-in requests (placeholder)
  void _onSignInRequested(AuthSignInRequested event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading));
    // TODO: Implement actual sign-in logic here (e.g., API call)
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    // Example: Check credentials (replace with real logic)
    if (state.email == 'test@test.com' && state.password == 'password') {
       emit(state.copyWith(status: AuthStatus.success));
    } else {
       emit(state.copyWith(status: AuthStatus.failure, errorMessage: 'Invalid credentials'));
    }
  }

  // Handler for sign-up requests (placeholder)
  void _onSignUpRequested(AuthSignUpRequested event, Emitter<AuthState> emit) async {
     emit(state.copyWith(status: AuthStatus.loading));
    // TODO: Implement actual sign-up logic here (e.g., API call)
     await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
     // Example: Simulate success (replace with real logic)
     emit(state.copyWith(status: AuthStatus.success));
     // Or simulate failure:
     // emit(state.copyWith(status: AuthStatus.failure, errorMessage: 'Sign up failed'));
  }
}