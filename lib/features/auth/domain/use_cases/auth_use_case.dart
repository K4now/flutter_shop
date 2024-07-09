import '../../domain/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Stream<User?> get authStateChanges => _authRepository.authStateChanges;

  Future<void> signInWithEmail(String email, String password) {
    return _authRepository.signInWithEmail(email, password);
  }

  Future<void> signInWithGoogle() {
    return _authRepository.signInWithGoogle();
  }

  Future<void> signUpWithEmail(String email, String password) {
    return _authRepository.signUpWithEmail(email, password);
  }

  Future<void> signOut() {
    return _authRepository.signOut();
  }
}
