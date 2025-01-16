import 'package:comic_reading_app/View/Authentication/LoginScreen/LoginScreen.dart';
import 'package:comic_reading_app/resources/Components/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/profile_placeholder.png'), // Replace with your image path
            ),
            SizedBox(height: height * 0.03),

            // User name
            const Text(
              'John Doe', // Replace with dynamic user data
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.4),

            /// Logout
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: RoundButton(title: 'Logout', onTap: (){
                Get.to(() => const LoginScreen());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
