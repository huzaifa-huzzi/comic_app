import 'package:comic_reading_app/resources/Components/RoundButton.dart';
import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Scaffold(
         body: Column(
           children: [
             SizedBox(height: height * 0.1,),
             ClipRRect(
               borderRadius: BorderRadius.circular(10),
               child: const Center(
                 child: Image(image: AssetImage('assets/Images/Screenshot 2025-01-06 175633.png')),
               ),
             ),
             SizedBox(height: height * 0.1,),
             const Text('Lets Start your manga adventure!',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),),
             SizedBox(height: height * 0.1,),
             const Text('The best place to find and enjoy thousands of manga titles of various genre!We are glad you Joined us',style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),),
             SizedBox(height: height * 0.1,),
             RoundButton(title: 'Continue', onTap: (){})
           ],
         ),
      ),
    );
  }
}
