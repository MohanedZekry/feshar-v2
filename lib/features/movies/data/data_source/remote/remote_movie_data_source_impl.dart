import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/network/error_message_model.dart';
import 'package:movieapp/core/utils/constants.dart';
import 'package:movieapp/core/utils/dio_helper.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source.dart';
import 'package:movieapp/features/movies/data/models/movie_model.dart';

class RemoteMovieDataSourceImpl implements RemoteMovieDataSource {

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await DioHelper
        .getData(url: Constants.MOVIE_NOW_PLAYING_EP,
        query: {
          'api_key': Constants.apiKey,
          'page': 1,
          'language' : 'en-US'
        }
    );

    if(response.statusCode == 200){
      return  List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)
      ));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMoves() async{
    final response = await DioHelper
        .getData(url: Constants.MOVIE_POPULAR_EP,
        query: {
          'api_key': Constants.apiKey,
          'page': 1,
          'language' : 'en-US'
        }
    );

    if(response.statusCode == 200){
      return  List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)
      ));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMoves() async {
    final response = await DioHelper
        .getData(url: Constants.MOVIE_TOP_RATED_EP,
        query: {
          'api_key': Constants.apiKey,
          'page': 1,
          'language' : 'en-US'
        }
    );
    if(response.statusCode == 200){
      return  List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)
      ));
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}