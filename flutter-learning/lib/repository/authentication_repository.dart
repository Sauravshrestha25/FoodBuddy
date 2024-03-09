import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_application_0/main.dart';
import 'package:flutter_application_0/repository/exceptions.dart';

class AuthenticationRepositary extends GetxController {
  static AuthenticationRepositary get instance => Get.find();
  // Variables
  final _auth = FirebaseAuth.instance;
  late final User? firebaseUser;

  void onReady() {
    firebaseUser = _auth.currentUser as User?;

    ever(firebaseUser, _setInitialScreen);
  }

  void ever(User? firebaseUser, setInitialScreen) {}
  _setInitialScreen(User? user) {}
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = Failure.code(e.code);
      print('Exception - ${ex.messege}');
      throw ex;
    } catch (_) {
      const ex = Failure();
      print('Exception - ${ex.messege}');
      throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut;
}

class GetxController {}
