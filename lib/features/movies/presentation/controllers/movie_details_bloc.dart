import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/core/utils/enums_state.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movieapp/features/movies/domain/use_cases/get_recommendation_movies_use_case.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';


class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendationMoviesUseCase getRecommendationMovieUseCase;

  MovieDetailsBloc({required this.getMovieDetailsUseCase,
    required this.getRecommendationMovieUseCase}) : super(const MovieDetailsState())
  {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationMovieEvent>(_getRecommendationMovies);
  }


  FutureOr<void> _getRecommendationMovies(GetRecommendationMovieEvent event, Emitter<MovieDetailsState> emit) async {

    final result = await getRecommendationMovieUseCase.call(event.id);

    result.fold(
            (l) =>
            emit(state.copyWith(
                recommendationState: RequestState.error,
                recommendationMessage: l.message
            )),
            (r) =>
            emit(state.copyWith(
              recommendationState: RequestState.loaded,
              recommendationMovies: r,
            )));
  }


  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase.call(event.id);
    result.fold(
            (l) =>
            emit(state.copyWith(
                movieDetailState: RequestState.error,
                message: l.message
            )),
            (r) =>
            emit(state.copyWith(
              movieDetailState: RequestState.loaded,
              movieDetail: r,
            )));
  }
}
