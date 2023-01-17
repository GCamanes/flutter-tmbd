import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tmbd/cubit/films.cubit.dart';
import 'package:flutter_tmbd/cubit/films.cubit.state.dart';
import 'package:flutter_tmbd/pages/search.page.dart';
import 'package:flutter_tmbd/widgets/films_list.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Create a local cubit of type FilmsCubit
  final FilmsCubit _filmsCubit = FilmsCubit();

  @override
  void initState() {
    _filmsCubit.getFilms();
    super.initState();
  }

  @override
  void dispose() {
    /// Don't forget to close local cubit on widget dispose
    _filmsCubit.close();
    super.dispose();
  }

  void _goToSearch(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchPage()),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Movie DB app'),
        centerTitle: true,
        titleSpacing: 0,
        actions: [
          IconButton(
            onPressed: () => _goToSearch(context),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      // BlocConsumer is the combination of BlocBuilder and BlocListener
      body: BlocConsumer<FilmsCubit, FilmsState>(
        bloc: _filmsCubit,
        listener: (BuildContext context, FilmsState state) {
          log('NEW STATE $state');
        },
        builder: (BuildContext context, FilmsState state) {
          // show list of films if api call succeeded
          if (state is FilmsLoadedState) {
            return RefreshIndicator(
              onRefresh: () => _filmsCubit.getFilms(),
              child: FilmsListWidget(films: state.films),
            );
          // show retry button if api call failed
          } else if (state is FilmsErrorState) {
            return Center(
              child: ElevatedButton(
                onPressed: () => _filmsCubit.getFilms(),
                child: const Text('Retry'),
              ),
            );
          }
          // show loading if cubit is working
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
