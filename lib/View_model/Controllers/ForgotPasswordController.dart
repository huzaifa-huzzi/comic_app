import 'package:comic_reading_app/Utils/Utils.dart';
import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Observables
  var emailController = TextEditingController();
  var isLoading = false.obs;

  // Forgot password function
  Future<void> resetPassword() async {
    if (emailController.text.isEmpty) {
      Utils.toastMessage('Email cannot be empty');
      return;
    }

    isLoading.value = true;
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Utils.toastMessage('Password reset email sent! Please check your inbox.');
      isLoading.value = false;

      // Navigate to LoginScreen
      Get.to(() => const LoginScreen());
    } catch (e) {
      isLoading.value = false;
      Utils.toastMessage(e.toString());
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
