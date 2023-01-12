import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/widgets/film_tile.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FilmEntity>? _films = <FilmEntity>[];
  bool _loading = false;

  @override
  void initState() {
    _loadFilms();
    super.initState();
  }

  Future<void> _loadFilms() async {
    setState(() {
      _loading = true;
    });
    List<FilmEntity>? films = await TmdbServices.getPopularFilms();
    setState(() {
      _loading = false;
      _films = films;
    });
  }

  Widget _buildFilmList() => ListView.separated(
    padding: const EdgeInsets.symmetric(vertical: AppConstants.padding),
        itemBuilder: (BuildContext context, int index) =>
            FilmTileWidget(film: _films![index]),
        separatorBuilder: (BuildContext context, int index) =>
             const SizedBox(height: AppConstants.innerPadding),
        itemCount: _films?.length ?? 0,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Movie DB app'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => log('go to search'),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _buildFilmList(),
    );
  }
}
