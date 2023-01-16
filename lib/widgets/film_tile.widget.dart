import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/pages/film_detail.page.dart';

class FilmTileWidget extends StatelessWidget {
  const FilmTileWidget({
    Key? key,
    required this.film,
  }) : super(key: key);

  final FilmEntity film;

  void _goToDetail(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FilmDetailPage(film: film)),
      );

  @override
  Widget build(BuildContext context) {
    /// Main widget
    return GestureDetector(
      onTap: () => _goToDetail(context),
      child: Container(
        // We can define margin and padding
        margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        padding: const EdgeInsets.all(AppConstants.innerPadding),
        // Give this context a height (easier when working with row/column)
        height: 100,
        // Give it some decoration
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        // Stacking widget horizontally
        child: Row(
          children: <Widget>[
            // This widget create a context with border radius as attribute
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                TmdbServices.getImageUrl(film.poster ?? ''),
                fit: BoxFit.fitHeight,
              ),
            ),
            // Spacing widgets in the row
            const SizedBox(width: AppConstants.innerPadding),
            // Central widget will take all available space horizontally
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    film.title,

                    // We don't want UI issues with long title
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'robotoMedium',
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    film.releaseDate ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'robotoRegular',
                      fontSize: 14,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            // Spacing widgets in the row
            const SizedBox(width: AppConstants.innerPadding),
            Text(
              '${film.voteAverage}',
              style: const TextStyle(
                fontFamily: 'robotoMedium',
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
