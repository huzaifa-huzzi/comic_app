import 'package:comic_reading_app/Models/Trending_Comic_Model.dart';
import 'package:comic_reading_app/View/DetailComicScreen/DetailComicScreen.dart';
import 'package:comic_reading_app/View_model/comic_view_Model.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String categoryName = 'General';

  List<String> categoriesList = [
    'General',
    'Fantasy',
    'SuperHeroes',
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.02),
          // Horizontal ListView for categories
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      categoryName = categoriesList[index];
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: categoryName == categoriesList[index]
                            ? AppColors.primary
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Center(
                          child: Text(
                            categoriesList[index],
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.05),
          // Vertical ListView for comic cards
      FutureBuilder<TrendingApiModel>(
        future: ComicViewModel().fetchTrendingComicApi(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                itemCount: min(8, snapshot.data!.data!.results!.length), // Limit to 8 comics
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      Get.to(() => DetailComicScreen(
                          imageUrl:'${snapshot.data!.data!.results![index].thumbnail!.path!}.${snapshot.data!.data!.results![index].thumbnail!.extension!}',
                          title: snapshot.data!.data!.results![index].title.toString(),
                          author: snapshot.data!.data!.results![index].creators.toString(),
                          description: snapshot.data!.data!.results![index].description.toString(),
                          url: snapshot.data!.data!.results![index].format.toString()
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Container(
                        height: height * 0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${snapshot.data!.data!.results![index].thumbnail!.path!}.${snapshot.data!.data!.results![index].thumbnail!.extension!}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            // Gradient overlay
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                            // Comic name and author
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.data!.results![index].title.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    snapshot.data!.data!.results![index].creators.toString(),
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Favorite icon button
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                icon: const Icon(Icons.favorite_border, color: Colors.white),
                                onPressed: () {
                                  // Handle favorite button action
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),

        ],
      ),
    );
  }
}
