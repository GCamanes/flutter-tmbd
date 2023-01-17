import 'package:flutter_tmbd/entities/film.entity.dart';

abstract class SearchFilmsState {}

class SearchFilmsInitState extends SearchFilmsState {}

class SearchFilmsLoadingState extends SearchFilmsState {}

class SearchFilmsLoadedState extends SearchFilmsState {
  SearchFilmsLoadedState(this.films);

  final List<FilmEntity> films;
}

class SearchFilmsErrorState extends SearchFilmsState {
  SearchFilmsErrorState(this.error);

  final String error;
}
