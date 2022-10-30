import 'package:movieapp/core/error/failure.dart';

class ServerException implements Exception{

  final ServerFailure serverFailure;

  const ServerException({required this.serverFailure});

}