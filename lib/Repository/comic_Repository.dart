

import 'dart:convert';
import 'package:comic_reading_app/Models/Movies_Model.dart';
import 'package:comic_reading_app/Models/Trending_Comic_Model.dart';
import 'package:http/http.dart' as http;

class ComicRepository {

  Future<TrendingApiModel>fetchTrendingComicApi()async{
    String url = 'http://gateway.marvel.com/v1/public/comics?ts=1&apikey=c2dc5e5005ed4ef028d67e6783759499&hash=15f0b2774c08453517427b8baab52391';

    final response =await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return TrendingApiModel.fromJson(body);
    }else{
      throw Exception('Error');
    }
  }

  /// Movies Fetching
  Future<Movies_Model>fetchMoviesApi()async{
    String url = 'https://mcuapi.herokuapp.com/api/v1/movies/';

    final response =await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final body = jsonDecode(response.body);
      return Movies_Model.fromJson(body);
    }else{
      throw Exception('Error');
    }
  }



}