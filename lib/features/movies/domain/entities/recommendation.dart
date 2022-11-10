import 'package:equatable/equatable.dart';

class Recommendation extends Equatable {
  final String? backDropPath;
  final int id;

  const Recommendation({
    this.backDropPath,
    required this.id
  });

  @override
  List<Object?> get props => [backDropPath, id];

}

