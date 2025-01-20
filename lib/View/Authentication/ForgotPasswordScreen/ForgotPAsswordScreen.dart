import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:comic_reading_app/View_model/Controllers/ForgotPasswordController.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:comic_reading_app/resources/Components/RoundButtonAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  final ForgotPasswordController controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Password',
          style: TextStyle(fontSize: 25, color: AppColors.primary),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/Images/comic logo-2.png',
                  height: height * 0.2,
                  width: width * 0.99,
                ),
              ),
              SizedBox(height: height * 0.05),

              /// TextFields
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Form(
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.07),

                      /// Submit Button
                      Obx(
                            () => RoundButtonAuth(
                          title: 'Reset Password',
                          loading: controller.isLoading.value,
                          ontap: () {
                            controller.resetPassword();
                          },
                        ),
                      ),

                      SizedBox(height: height * 0.03),

                      /// "Have an Account? Sign in" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Have an Account?'),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const LoginScreen());
                            },
                            child: const Text(
                              ' Sign in',
                              style: TextStyle(
                                color: Color.fromRGBO(96, 37, 166, 1.0),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
