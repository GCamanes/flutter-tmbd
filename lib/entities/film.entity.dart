class FilmEntity {
  const FilmEntity({
    required this.adult,
    this.background,
    required this.budget,
    required this.id,
    required this.language,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.poster,
    this.releaseDate,
    required this.revenue,
    this.tagLine,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? background;
  final int budget;
  final int id;
  final String language;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String? poster;
  final String? releaseDate;
  final int revenue;
  final String? tagLine;
  final String title;
  final num voteAverage;
  final int voteCount;
}
