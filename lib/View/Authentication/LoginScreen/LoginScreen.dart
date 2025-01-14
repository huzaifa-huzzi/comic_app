
import 'package:comic_reading_app/View/Authentication/SignUpScreen/SignUpScreen.dart';
import 'package:comic_reading_app/View_model/Controllers/LoginController.dart';
import 'package:comic_reading_app/resources/Components/RoundButtonAuthentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.put(LoginController());
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(),
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

              // "Welcome Back" text
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 35,
                      color: Color.fromRGBO(96, 37, 166, 1.0),
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

                      // "Forgot Password" text
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            // Add forgot password functionality
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color.fromRGBO(96, 37, 166, 1.0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.05),

                      // Login Button
                      Obx(() {
                        return RoundButtonAuth(
                          title: 'Login',
                          loading: controller.loading.value,
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              String email = controller.emailController.text.trim();
                              String password = controller.passwordController.text.trim();
                              String username = controller.usernameController.text.trim();
                              controller.login(email, password, username, context);
                            }

                          },
                        );
                      }),

                      SizedBox(height: height * 0.03),

                      // "Don't have an Account? Create Account" text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an Account?'),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const SignUpScreen());
                            },
                            child: const Text(
                              ' Create Account',
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
