import 'package:equatable/equatable.dart';
import '../../../../core/utils/enums_state.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {

  final MovieDetails? movieDetail;
  final RequestState movieDetailState;
  final String message;

  const MovieDetailsState({
    this.movieDetail,
    this.movieDetailState = RequestState.loading,
    this.message = '',
  });

  MovieDetailsState copyWith(
      {
        MovieDetails? movieDetail,
        RequestState? movieDetailState,
        String? message
      })
  {
    return MovieDetailsState(
        message: message ?? this.message,
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailState: movieDetailState ?? this.movieDetailState
    );
  }

  @override
  List<Object?> get props => [movieDetail, movieDetailState, message];
}
