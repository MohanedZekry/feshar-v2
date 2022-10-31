import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/services/services_locator.dart';
import 'package:movieapp/features/movies/presentation/controllers/movies_bloc.dart';
import '../controllers/movies_event.dart';
import '../controllers/movies_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MoviesBloc(getNowPlayingMoviesUseCase: sl())..add(GetNowPlayingMovieEvent()),
        child: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
              return Scaffold(
                appBar:  AppBar(),
              );
          },
        )
    );
  }
}
