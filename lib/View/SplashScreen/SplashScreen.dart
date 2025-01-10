import 'package:comic_reading_app/Services/Splash_Services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Services splashScreen = Services();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: screenWidth * 0.6,
          height: screenHeight * 0.3,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/Images/comic logo-2.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
