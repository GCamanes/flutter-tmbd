import 'package:flutter_tmbd/entities/film.entity.dart';

abstract class FilmsState {}

class FilmsInitState extends FilmsState {}

class FilmsLoadingState extends FilmsState {}

class FilmsLoadedState extends FilmsState {
  FilmsLoadedState(this.films);

  final List<FilmEntity> films;
}

class FilmsErrorState extends FilmsState {
  FilmsErrorState(this.error);

  final String error;
}
