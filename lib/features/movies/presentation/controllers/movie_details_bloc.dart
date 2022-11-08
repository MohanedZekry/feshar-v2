import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(const MovieDetailsState()) {
    on<MovieDetailsEvent>((event, emit) {
    });
  }
}
