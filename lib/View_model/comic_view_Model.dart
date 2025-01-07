import 'package:comic_reading_app/Models/Movies_Model.dart';
import 'package:comic_reading_app/Models/Trending_Comic_Model.dart';
import 'package:comic_reading_app/Repository/comic_Repository.dart';

class ComicViewModel{
  final _repo = ComicRepository();

  Future<TrendingApiModel>fetchTrendingComicApi()async{
    final response =await _repo.fetchTrendingComicApi();
    return response;
  }

  Future<Movies_Model>fetchMoviesApi()async{
    final response =await _repo.fetchMoviesApi();
    return response;
  }


}