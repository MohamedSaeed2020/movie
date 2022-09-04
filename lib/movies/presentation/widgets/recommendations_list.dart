import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/network/api_constants.dart';
import 'package:movie/core/utils/enums.dart';
import 'package:movie/movies/presentation/controllers/movie_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
      switch (state.recommendationsRequestStates) {
        case RequestStates.isLoading:
          return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()));
        case RequestStates.isLoaded:
          return state.recommendations.isNotEmpty
              ? SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return FadeInUp(
                        from: 20,
                        duration: const Duration(milliseconds: 500),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4.0)),
                          child: CachedNetworkImage(
                            imageUrl: ApiConstants.imageUrl(
                                state.recommendations[index].backdropPath!),
                            placeholder: (context, url) => Shimmer.fromColors(
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
                            height: 180.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    childCount: state.recommendations.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 0.7,
                    crossAxisCount: 3,
                  ),
                )
              : const SliverToBoxAdapter(
                  child: Center(
                      child: Text(
                    'There are no recommendations for this movie',
                  )),
                );
        case RequestStates.isError:
          return SliverToBoxAdapter(
            child: Center(
                child: Text(
              state.movieDetailsErrorMessage.toString(),
            )),
          );
      }
    });
  }
}
