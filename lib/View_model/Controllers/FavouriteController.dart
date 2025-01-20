

import 'package:get/get.dart';

class FavoriteController extends GetxController {
  var favoriteMovies = <int>[].obs; // List of favorite movie IDs
  var favoriteComics = <int>[].obs; // List of favorite comic IDs

  void toggleFavoriteMovie(int id) {
    if (favoriteMovies.contains(id)) {
      favoriteMovies.remove(id);
    } else {
      favoriteMovies.add(id);
    }
  }

  void toggleFavoriteComic(int id) {
    if (favoriteComics.contains(id)) {
      favoriteComics.remove(id);
    } else {
      favoriteComics.add(id);
    }
  }
}