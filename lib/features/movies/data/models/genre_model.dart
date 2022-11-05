import 'package:movieapp/features/movies/domain/entities/movie_details.dart';

class GenreModel extends Genre {

  const GenreModel({
    required super.id,
    required super.name
  });

  factory GenreModel.fromJson(Map<String, dynamic> json){
    return GenreModel(
        id: json['id'],
        name: json['name']
    );
  }

}