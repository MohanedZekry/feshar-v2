import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/utils/constants.dart';
import 'package:movieapp/core/utils/dio_helper.dart';
import 'package:movieapp/features/movies/data/data_source/remote/remote_movie_data_source.dart';
import 'package:movieapp/features/movies/data/models/MovieModel.dart';

class RemoteMovieDataSourceImpl implements RemoteMovieDataSource {

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await DioHelper
        .getData(url: Constants.NOW_PLAYING_EP,
        query: {
          'api_key': Constants.apiKey,
          'page': '1'
        }
    );
    if(response.statusCode == 200){
      return  List<MovieModel>.from((response.data['results'] as List).map((e) =>
          MovieModel.fromJson(e)
      ));
    }else{
      throw ServerException(serverFailure: ServerFailure.fromJson(response.data));
    }
  }
}