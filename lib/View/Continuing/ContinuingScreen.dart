import 'package:comic_reading_app/View/DashBoardScreen/DashBoardScreen.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:comic_reading_app/resources/Components/RoundButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinuingScreen extends StatefulWidget {
  const ContinuingScreen({super.key});

  @override
  State<ContinuingScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ContinuingScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.1),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Center(
                child: Image.asset(
                  'assets/Images/Screenshot 2025-01-06 175633.png',
                  width: width * 0.8,
                  height: height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.1),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Lets Start your manga ',
                  style: TextStyle(fontSize: 31, fontWeight: FontWeight.bold,color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'adventure!',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.1),
              child: Text(
                'The best place to find and enjoy thousands of manga titles of various genre! We are glad you Joined us 👏',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: AppColors.greyOpacity,
                ),
              ),
            ),
            SizedBox(height: height * 0.1),
            RoundButton(title: 'Continue', onTap: () {
              Get.to(() => const  DashboardScreen());
            })
          ],
        ),
      ),
    );
  }
}
