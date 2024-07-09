import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/auth_use_case.dart';

abstract class AuthEvent {}

class AuthSignInWithEmail extends AuthEvent {
  final String email;
  final String password;

  AuthSignInWithEmail(this.email, this.password);
}

class AuthSignInWithGoogle extends AuthEvent {}

class AuthSignUpWithEmail extends AuthEvent {
  final String email;
  final String password;

  AuthSignUpWithEmail(this.email, this.password);
}

class AuthSignOut extends AuthEvent {}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;

  AuthAuthenticated(this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCase _authUseCase;

  AuthBloc({required AuthUseCase authUseCase})
      : _authUseCase = authUseCase,
        super(AuthInitial()) {
    on<AuthSignInWithEmail>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authUseCase.signInWithEmail(event.email, event.password);
        final user = await _authUseCase.authStateChanges.first;
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthSignInWithGoogle>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authUseCase.signInWithGoogle();
        final user = await _authUseCase.authStateChanges.first;
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthSignUpWithEmail>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authUseCase.signUpWithEmail(event.email, event.password);
        final user = await _authUseCase.authStateChanges.first;
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthInitial());
        }
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<AuthSignOut>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authUseCase.signOut();
        emit(AuthInitial());
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
