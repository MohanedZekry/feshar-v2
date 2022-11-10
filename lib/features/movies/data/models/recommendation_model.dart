import 'package:movieapp/features/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {

  const RecommendationModel({
    required super.backDropPath,
    required super.id
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json)  =>
      RecommendationModel(
          backDropPath: json['backdrop_path'] ?? '/y5Z0WesTjvn59jP6yo459eUsbli.jpg',
          id: json['id']
      );
}
