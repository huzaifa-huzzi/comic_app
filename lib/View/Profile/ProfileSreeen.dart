import 'package:comic_reading_app/View_model/Controllers/ProfileController.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:comic_reading_app/resources/Components/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final profileController = Get.put(ProfileController()); // Inject ProfileController

    // Reference to Firebase Realtime Database
    final ref = FirebaseDatabase.instance.ref().child('user');
    final auth = FirebaseAuth.instance;
    final userId = auth.currentUser?.uid;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile Screen",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.primary,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Circular Avatar - Click to open camera
              GestureDetector(
                onTap: () => profileController.getGalleryImage(), // Open gallery or camera
                child: Padding(
                  padding: EdgeInsets.only(top: mediaQuery.size.height * 0.03),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: profileController.image != null
                        ? FileImage(profileController.image!)
                        : null,
                    child: profileController.image == null
                        ?  Icon(
                      Icons.camera_alt,
                      size: 50,
                      color: AppColors.primary,
                    )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // StreamBuilder to get user data from Firebase Realtime Database
              StreamBuilder<DatabaseEvent>(
                stream: ref.child(userId ?? '').onValue,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data?.snapshot.value == null) {
                    return const Text('No data available');
                  } else {
                    final data = snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

                    // Fetch username and email from Firebase
                    final username = data['username'] ?? 'Loading...';
                    final email = data['email'] ?? 'Loading...';

                    return Column(
                      children: [
                        // Username
                        Text(
                          'Username: $username',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Email
                        Text(
                          'Email: $email',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),

              const SizedBox(height: 40),

              // Logout Button
              RoundButton(
                title: 'Logout',
                onTap: () {
                  profileController.logout(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
