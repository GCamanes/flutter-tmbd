import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/cubit/search_films.cubit.dart';
import 'package:flutter_tmbd/cubit/search_films.cubit.state.dart';
import 'package:flutter_tmbd/widgets/films_list.widget.dart';
import 'package:flutter_tmbd/widgets/search_field.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchFilmsCubit _searchCubit = SearchFilmsCubit();
  final TextEditingController _controller = TextEditingController();

  void _searchFilms(String search) => _searchCubit.search(search);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: AppConstants.appBarHeight * 0.7,
            child: SearchFieldWidget(
              controller: _controller,
              onSubmit: _searchFilms,
            ),
          ),
          centerTitle: true,
          titleSpacing: 0,
          actions: [
            IconButton(
              onPressed: () => _searchFilms(_controller.text),
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: BlocBuilder<SearchFilmsCubit, SearchFilmsState>(
          bloc: _searchCubit,
          builder: (BuildContext context, SearchFilmsState state) {
            if (state is SearchFilmsLoadedState) {
              return FilmsListWidget(films: state.films);
            } else if (state is SearchFilmsErrorState) {
              return Center(
                child: ElevatedButton(
                  onPressed: () => _searchFilms(_controller.text),
                  child: const Text('Retry'),
                ),
              );
            } else if (state is SearchFilmsLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
