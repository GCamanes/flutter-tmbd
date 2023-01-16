import 'package:flutter/material.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';

class FilmDetailPage extends StatelessWidget {
  const FilmDetailPage({
    Key? key,
    required this.film,
  }) : super(key: key);

  final FilmEntity film;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          film.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        titleSpacing: 0,
        centerTitle: true,
      ),
    );
  }
}
