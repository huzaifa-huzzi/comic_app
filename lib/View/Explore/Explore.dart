import 'package:flutter/material.dart';



class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {

  String categoryName = 'All';

  List<String> categoriesList =[
    'All',
    'Fantasy',
    'SuperHeroes',

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore',style: TextStyle(fontSize:24,fontWeight:FontWeight.bold,),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(

          )
        ],
      ),
    );
  }
}
