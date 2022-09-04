import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/services/services_locator.dart';
import 'package:movie/movies/presentation/controllers/movies_bloc.dart';
import 'package:movie/movies/presentation/controllers/movies_events.dart';
import 'package:movie/movies/presentation/controllers/movies_states.dart';

class ServiceLocatorTestScreen extends StatelessWidget {
  const ServiceLocatorTestScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //Note the same hashCode because we user [registerLazySingleton]
    //log('NowPlayingMoviesUseCase Hash Code: ${locator<NowPlayingMoviesUseCase>.hashCode}');
    //Note in case of bloc we used [registerFactory] so the hashCode was not the same
    //log('MoviesBloc Hash Code: ${locator<MoviesBloc>().hashCode}');

   // NowPlayingMoviesUseCase nowPlayingMoviesUseCase=GetIt.instance.get<NowPlayingMoviesUseCase>();
    return BlocProvider(
      create: (context) {
        //OR: return MoviesBloc(nowPlayingMoviesUseCase)..add(GetNowPlayingMoviesEvent());
        return MoviesBloc(locator(),locator(),locator())..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MoviesBloc,MoviesStates>(builder: (context, state) {
        return const Scaffold(
          body: Center(child: Text('Hello')),
        );
      }),
    );
  }
}
