import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/widgets/film_tile.widget.dart';

class FilmsListWidget extends StatelessWidget {
  const FilmsListWidget({
    Key? key,
    required this.films,
  }) : super(key: key);

  final List<FilmEntity> films;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: AppConstants.padding,
      ),
      itemBuilder: (BuildContext context, int index) =>
          FilmTileWidget(film: films[index]),
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(height: AppConstants.innerPadding),
      itemCount: films.length,
    );
  }
}
