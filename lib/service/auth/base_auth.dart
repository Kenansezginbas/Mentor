import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthService {
  Future<User?> currentUser();
  Future<String> signIn(String email, String password);
  Future<String> signUp(String email, String password);
  Future<void> signOut();
}
