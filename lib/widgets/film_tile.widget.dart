import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';

class FilmTileWidget extends StatelessWidget {
  const FilmTileWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final FilmEntity film;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
      padding: const EdgeInsets.all(AppConstants.padding),
      color: Colors.grey.shade300,
      child: Text(film.title),
    );
  }
}
