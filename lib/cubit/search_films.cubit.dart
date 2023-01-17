import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmbd/cubit/search_films.cubit.state.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';

class SearchFilmsCubit extends Cubit<SearchFilmsState> {
  SearchFilmsCubit() : super(SearchFilmsInitState());

  Future<void> search(String search) async {
    emit(SearchFilmsLoadingState());
    await Future<void>.delayed(const Duration(seconds: 1));
    List<FilmEntity>? films = await TmdbServices.searchFilms(search);
    if (films != null) {
      emit(SearchFilmsLoadedState(films));
    } else {
      emit(SearchFilmsErrorState('Error searching films'));
    }
  }
}