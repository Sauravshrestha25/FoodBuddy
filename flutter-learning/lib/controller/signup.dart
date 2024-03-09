import 'package:flutter/material.dart';
import 'package:flutter_application_0/main.dart';
import 'package:flutter_application_0/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  void registerUser(String email, String password) {}
}
