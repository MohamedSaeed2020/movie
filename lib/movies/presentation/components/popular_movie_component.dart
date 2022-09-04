
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_states.dart';
import 'package:movie/movies/presentation/screens/movie_detail_screen.dart';
import 'package:shimmer/shimmer.dart';

class PopularMovieComponent extends StatelessWidget {
  const PopularMovieComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesStates>(
      buildWhen: (previousState,currentState) {
        return currentState is PopularMoviesStates;
      },
      builder: (context, state) {
        log('PopularMovieComponent BlocBuilder');
        switch (state.requestStates) {
        case RequestStates.isLoading:
          return const SizedBox(
              height: 170.0, child: Center(child: CircularProgressIndicator()));
        case RequestStates.isLoaded:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.moviesList.length,
                itemBuilder: (context, index) {
                  final movie =  state.moviesList[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              return MovieDetailScreen(id: movie.id);
                            }));
                      },
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                          placeholder: (context, url) =>
                              Shimmer.fromColors(
                                baseColor: const Color(0xffE3E3E3),
                                highlightColor: const Color(0xffFAFAFA),
                                child: Container(
                                  height: 170.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        case RequestStates.isError:
        return SizedBox(
            height: 170.0,
            child: Text(
              state.errorMessage.toString(),
            ));
      }

      },
    );
  }
}
