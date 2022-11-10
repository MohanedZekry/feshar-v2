import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums_state.dart';
import '../../domain/entities/movie_details.dart';
import '../../domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {

  final MovieDetails? movieDetail;
  final RequestState movieDetailState;
  final String message;
  final List<Recommendation>? recommendationMovies;
  final RequestState recommendationState;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.message = '',
    this.recommendationMovies = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  MovieDetailsState copyWith(
      {
        MovieDetails? movieDetail,
        RequestState? movieDetailState,
        String? message,
        List<Recommendation>? recommendationMovies,
        RequestState? recommendationState,
        String? recommendationMessage,
      })
  {
    return MovieDetailsState(
      message: message ?? this.message,
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailState: movieDetailState ?? this.movieDetailState,
      recommendationMovies: recommendationMovies ?? this.recommendationMovies,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
    movieDetail, movieDetailState, message,
    recommendationMovies, recommendationState, recommendationMessage
  ];
}
