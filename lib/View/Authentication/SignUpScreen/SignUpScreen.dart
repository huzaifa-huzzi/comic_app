


import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:comic_reading_app/View_model/Controllers/SignUpController.dart';
import 'package:comic_reading_app/resources/Components/RoundButtonAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignUpController());
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/Images/comic logo-2.png',
                  height: height * 0.2,
                  width: width * 0.99,
                ),
              ),

              SizedBox(height: height * 0.05),

              // "Create Account" text
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 35,
                      color:Color.fromRGBO(96, 37, 166, 1.0) ,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: height * 0.03),

              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
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
                      SizedBox(height: height * 0.03),
                      // Username Field
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),

                      // Password Field
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: const OutlineInputBorder(),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        obscureText: !_isPasswordVisible,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),

                      // Submit Button
                      RoundButtonAuth(
                        title: 'SignUp',
                        loading: controller.loading.value,
                        ontap: () {
                          if (_formKey.currentState!.validate()) {
                            String email = controller.emailController.text;
                            String username = controller.usernameController.text;
                            String password = controller.passwordController.text;
                            controller.signUpFtn(email, username, password, context);
                          }
                        },
                      ),


                      SizedBox(height: height * 0.03),

                      // "Have an Account? Sign in" text
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
