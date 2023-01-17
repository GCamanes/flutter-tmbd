import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmbd/cubit/films.cubit.state.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';

class FilmsCubit extends Cubit<FilmsState> {
  FilmsCubit() : super(FilmsInitState());

  Future<void> getFilms() async {
    emit(FilmsLoadingState());
    await Future<void>.delayed(const Duration(seconds: 1));
    List<FilmEntity>? films = await TmdbServices.getPopularFilms();
    if (films != null) {
      emit(FilmsLoadedState(films));
    } else {
      emit(FilmsErrorState('Error loading films'));
    }
  }
}