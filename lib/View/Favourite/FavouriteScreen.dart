import 'package:comic_reading_app/View/DetailComicScreen/DetailComicScreen.dart';
import 'package:comic_reading_app/View/DetailMoviesScreen/DetailMovieScreen.dart';
import 'package:comic_reading_app/View_model/Controllers/FavouriteController.dart';
import 'package:comic_reading_app/resources/Color/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Models/Movies_Model.dart';
import '../../Models/Trending_Comic_Model.dart';
import '../../View_model/comic_view_Model.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({super.key});

  final favoriteController = Get.put(FavoriteController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Favorites',
          style: TextStyle(fontSize: 25, color: AppColors.primary),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display Favorite Movies and Comics directly
              Text('Favourite Movies',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: Obx(() {
                  final favoriteMovies = favoriteController.favoriteMovies;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favoriteMovies.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<Movies_Model>(
                        future: ComicViewModel().fetchMoviesApi(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            final movie = snapshot.data!.data![favoriteMovies[index]];
                            return InkWell(
                              onTap: () {
                                Get.to(() => DetailMovieScreen(
                                  imageUrl: movie.coverUrl.toString(),
                                  title: movie.title.toString(),
                                  author: movie.directedBy.toString(),
                                  description: movie.overview.toString(),
                                  url: movie.trailerUrl.toString(),
                                ));
                              },
                              child: Container(
                                height: height * 0.25,
                                width: width * 0.5,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(movie.coverUrl.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      );
                    },
                  );
                }),
              ),

              // Display Favorite Comics directly
              Text('Favourite Comics',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
              SizedBox(height: height * 0.02),
              SizedBox(
                height: height * 0.25,
                width: width * 0.9,
                child: Obx(() {
                  final favoriteComics = favoriteController.favoriteComics;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: favoriteComics.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<TrendingApiModel>(
                        future: ComicViewModel().fetchTrendingComicApi(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          } else if (snapshot.hasData) {
                            final comic = snapshot.data!.data!.results![favoriteComics[index]];
                            return InkWell(
                              onTap: () {
                                Get.to(() => DetailComicScreen(
                                  imageUrl: '${comic.thumbnail!.path!}.${comic.thumbnail!.extension!}',
                                  title: comic.title.toString(),
                                  author: comic.creators.toString(),
                                  description: comic.description.toString(),
                                  url: comic.format.toString(),
                                ));
                              },
                              child: Container(
                                height: height * 0.25,
                                width: width * 0.5,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      '${comic.thumbnail!.path!}.${comic.thumbnail!.extension!}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          } else {
                            return const Center(child: Text('No data available'));
                          }
                        },
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
