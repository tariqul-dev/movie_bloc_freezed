import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_bloc_freezed/src/core/utils/urls.dart';

import '../blocs/movie_list_bloc.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state.nowShowingMovies != null) {
                    final showingMovies = state.nowShowingMovies!.results!;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Now Showing',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: showingMovies.length,
                              itemBuilder: (context, index) {
                                final movie = showingMovies[index];
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        '$imageBaseUrl${movie.posterPath}',
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        height: 150,
                                      ),
                                      ListTile(
                                        title: Text(
                                          movie.originalTitle!,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                        subtitle: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                              'Rating: ${movie.voteAverage}'),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<MovieListBloc, MovieListState>(
                builder: (context, state) {
                  if (state.popularMovies != null) {
                    final popularMoves = state.popularMovies!.results!;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Popular Movies',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: popularMoves.length,
                            itemBuilder: (context, index) {
                              final movie = popularMoves[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListTile(
                                  leading: Image.network(
                                    '$imageBaseUrl${movie.posterPath}',
                                  ),
                                  title: Text(
                                    movie.originalTitle!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 4.0),
                                    child: Text('Rating: ${movie.voteAverage}'),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
