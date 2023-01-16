import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/widgets/film_tile.widget.dart';
import 'package:flutter_tmbd/widgets/search_field.widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<FilmEntity>? _films = <FilmEntity>[];
  bool _loading = false;
  final TextEditingController _controller = TextEditingController();

  Future<void> _searchFilms(String search) async {
    setState(() {
      _loading = true;
    });
    List<FilmEntity>? films = await TmdbServices.searchFilms(search);
    setState(() {
      _loading = false;
      _films = films;
    });
  }

  Widget _buildFilmList() => ListView.separated(
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: AppConstants.padding),
        itemBuilder: (BuildContext context, int index) =>
            FilmTileWidget(film: _films![index]),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: AppConstants.innerPadding),
        itemCount: _films?.length ?? 0,
      );

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
        body: _loading
            ? const Center(child: CircularProgressIndicator())
            : _buildFilmList(),
      ),
    );
  }
}
