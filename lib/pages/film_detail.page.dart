import 'package:flutter/material.dart';
import 'package:flutter_tmbd/app.constants.dart';
import 'package:flutter_tmbd/datasources/tmdb.services.dart';
import 'package:flutter_tmbd/entities/film.entity.dart';
import 'package:flutter_tmbd/utils/date.utils.dart';

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
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(
              TmdbServices.getImageUrl(film.background ?? ''),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.all(AppConstants.padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Release on: '
                    '${DateTimeUtils.getFormatDate(
                      context,
                      film.releaseDate ?? 'unknown',
                    )}',
                    style: const TextStyle(
                      fontFamily: 'robotoRegular',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: AppConstants.padding),
                  Text(
                    'Vote average: '
                        '${DateTimeUtils.getFormatDate(
                      context,
                      film.voteAverage.toString(),
                    )}',
                    style: const TextStyle(
                      fontFamily: 'robotoRegular',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: AppConstants.padding),
                  Text(
                    'Vote count: '
                        '${DateTimeUtils.getFormatDate(
                      context,
                      film.voteCount.toString(),
                    )}',
                    style: const TextStyle(
                      fontFamily: 'robotoRegular',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: AppConstants.padding),
                  Text(
                    'Popularity: '
                        '${DateTimeUtils.getFormatDate(
                      context,
                      film.popularity.toString(),
                    )}',
                    style: const TextStyle(
                      fontFamily: 'robotoRegular',
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: AppConstants.padding),
                  Text(
                    'Popularity: '
                        '${DateTimeUtils.getFormatDate(
                      context,
                      film.overview,
                    )}',
                    style: const TextStyle(
                      fontFamily: 'robotoLight',
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
