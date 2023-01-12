import 'package:flutter_tmbd/entities/film.entity.dart';

class FilmModel extends FilmEntity {
  const FilmModel({
    required bool adult,
    String? background,
    required int budget,
    required int id,
    required String language,
    required String originalTitle,
    required String overview,
    required double popularity,
    final String? poster,
    String? releaseDate,
    required int revenue,
    final String? tagLine,
    required String title,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          background: background,
          budget: budget,
          id: id,
          language: language,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          poster: poster,
          releaseDate: releaseDate,
          revenue: revenue,
          tagLine: tagLine,
          title: title,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  FilmModel.fromJson(Map<String, dynamic> json)
      : super(
          adult: json['adult'] ?? false,
          background: json['backdrop_path'],
          budget: json['budget'] ?? 0,
          id: json['id'] ?? 0,
          language: json['original_language'] ?? '',
          originalTitle: json['original_title'] ?? '',
          overview: json['overview'] ?? '',
          popularity: json['popularity'] ?? 0.0,
          poster: json['poster_path'],
          releaseDate: json['release_date'],
          revenue: json['runtime'] ?? 0,
          tagLine: json['tagline'] ?? '',
          title: json['title'] ?? '',
          voteAverage: json['vote_average'] ?? 0.0,
          voteCount: json['vote_count'] ?? 0,
        );
}
