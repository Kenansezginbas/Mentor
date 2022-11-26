import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final firebaseAuth = FirebaseAuth.instance;

  Future<String?> signIn(String email, String password) async {
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

  Future<String?> signUp(String email, String password) async {
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

  Future currentUser() async {
    try {
      final result = await firebaseAuth.currentUser;
      final User? user = result;
      return user;
    } catch (e) {
      return null;
    }
  }

  Future signOut() async {
    try {
      final result = await firebaseAuth.signOut();
      return result;
    } catch (e) {
      return null;
    }
  }
}
