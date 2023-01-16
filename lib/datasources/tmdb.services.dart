import 'dart:convert';
import 'dart:developer';

import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/models/film.model.dart';

import 'package:http/http.dart' as http;

abstract class TmdbServices {
  static const String apiKey = '16fcd85d2d6fbad5e47a0880cb5628bd';
  static const String host = 'https://api.themoviedb.org/3';

  static Uri buildUri(String requestPath, {Map<String, String>? params}) {
    String queryParams = '';
    params?.forEach((key, value) {
      queryParams = '$queryParams&$key=$value';
    });
    return Uri.parse('$host$requestPath?api_key=$apiKey$queryParams');
  }

  static String getImageUrl(String path, {int width = 500}) =>
      'https://image.tmdb.org/t/p/w$width$path';

  static Future<List<FilmEntity>?> getPopularFilms() async {
    http.Response response = await http.get(buildUri('/movie/popular'));
    switch (response.statusCode) {
      case 200:
        try {
          final String responseBody = response.body;
          Iterable<dynamic> responseResult =
              json.decode(responseBody)['results'];

          return responseResult
              .map((dynamic json) => FilmModel.fromJson(json))
              .toList();
        } catch (e) {
          log(e.toString());
          return null;
        }
      default:
        return null;
    }
  }

  static Future<List<FilmEntity>?> searchFilms(String search) async {
    http.Response response = await http.get(
      buildUri('/search/movie', params: {'query': search}),
    );
    switch (response.statusCode) {
      case 200:
        try {
          final String responseBody = response.body;
          Iterable<dynamic> responseResult =
              json.decode(responseBody)['results'];
          return responseResult
              .map((dynamic json) => FilmModel.fromJson(json))
              .toList();
        } catch (e) {
          log(e.toString());
          return null;
        }
      default:
        return null;
    }
  }
}
