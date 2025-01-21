import 'package:comic_reading_app/Models/Movies_Model.dart';
import 'package:comic_reading_app/View/DetailComicScreen/DetailComicScreen.dart';
import 'package:comic_reading_app/View/DetailMoviesScreen/DetailMovieScreen.dart';
import 'package:comic_reading_app/View_model/Controllers/FavouriteController.dart';
import 'package:comic_reading_app/View_model/comic_view_Model.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:comic_reading_app/resources/Components/SectionHeading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import '../../Models/Trending_Comic_Model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final favoriteController = Get.put(FavoriteController()); // Inject the controller

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/Images/your_image.png'),
            ),
            SizedBox(width: width * 0.03),
            const Text('Hey, Huzaifa!'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.03),

              /// Trending Movies
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Trending Movies'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: FutureBuilder<Movies_Model>(
                  future: ComicViewModel().fetchMoviesApi(),
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.total,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailMovieScreen(
                                imageUrl: snapshot.data!.data![index].coverUrl.toString(),
                                title: snapshot.data!.data![index].title.toString(),
                                author: snapshot.data!.data![index].directedBy.toString(),
                                description: snapshot.data!.data![index].overview.toString(),
                                url: snapshot.data!.data![index].trailerUrl.toString(),
                              ));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.25,
                                  width: width * 0.5,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(snapshot.data!.data![index].coverUrl.toString()),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Obx(() {
                                    final isFavorite = favoriteController.favoriteMovies.contains(index);
                                    return IconButton(
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        favoriteController.toggleFavoriteMovie(index);
                                      },
                                    );
                                  }),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),

              /// Recommended Comics
              SizedBox(height: height * 0.03),
              const SectionHeading(title: 'Recommended Comics'),
              SizedBox(height: height * 0.03),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: FutureBuilder<TrendingApiModel>(
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
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: min(6, snapshot.data!.data!.results!.length),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(() => DetailComicScreen(
                                  imageUrl:
                                  '${snapshot.data!.data!.results![index].thumbnail!.path!}.${snapshot.data!.data!.results![index].thumbnail!.extension!}',
                                  title: snapshot.data!.data!.results![index].title.toString(),
                                  author: snapshot.data!.data!.results![index].creators.toString(),
                                  description: snapshot.data!.data!.results![index].description.toString(),
                                  url: snapshot.data!.data!.results![index].format.toString()));
                            },
                            child: Stack(
                              children: [
                                Container(
                                  height: height * 0.25,
                                  width: width * 0.5,
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        '${snapshot.data!.data!.results![index].thumbnail!.path!}.${snapshot.data!.data!.results![index].thumbnail!.extension!}',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Obx(() {
                                    final isFavorite = favoriteController.favoriteComics.contains(index);
                                    return IconButton(
                                      icon: Icon(
                                        isFavorite ? Icons.favorite : Icons.favorite_border,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        favoriteController.toggleFavoriteComic(index);
                                      },
                                    );
                                  }),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text('No data available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}





