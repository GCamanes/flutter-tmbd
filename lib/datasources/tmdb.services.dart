import 'dart:convert';

import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/models/film.model.dart';

import 'package:http/http.dart' as http;

abstract class TmdbServices {
  static const String apiKey = '16fcd85d2d6fbad5e47a0880cb5628bd';
  static const String host = 'https://api.themoviedb.org/3';

  static Uri buildUri(String requestPath) =>
      Uri.parse('$host$requestPath?api_key=$apiKey');

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
          return null;
        }
      default:
        return null;
    }
  }
}
