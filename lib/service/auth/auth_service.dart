import 'package:firebase_auth/firebase_auth.dart';
import 'package:mentor/service/auth/base_auth.dart';

class AuthService extends IAuthService {
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> currentUser() async {
    try {
      final result = await firebaseAuth.currentUser;
      final User? user = result;
      return user;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String> signIn(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "user-not-found":
          res = "Kullanıcı Bulunamadı";
          break;
        case "wrong-password":
          res = "Hatalı Şifre";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçersiz Mail";
          break;
        case "user-disabled":
          res = "Kullanıcı Pasif";
          break;
        default:
          res = "Bir Hata İle Karşılaşıldı, Birazdan Tekrar Deneyiniz.";
          break;
      }
    }
    return res;
  }

  @override
  Future<String> signUp(String email, String password) async {
    String? res;
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "Mail Zaten Kayıtlı.";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçersiz Mail";
          break;
        default:
          res = "Bir Hata İle Karşılaşıldı, Birazdan Tekrar Deneyiniz.";
          break;
      }
    }
    return res;
  }

  @override
  Future<void> signOut() async {
    try {
      final result = await firebaseAuth.signOut();
      return result;
    } catch (e) {
      return null;
    }
  }
}
