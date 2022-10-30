import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class ServerFailure extends Failure {

  final int status;
  final String statusMessage;
  final bool success;

  ServerFailure({
    required this.status,
    required this.statusMessage,
    required this.success
  });

  factory ServerFailure.fromJson(Map<String, dynamic> json) =>
      ServerFailure(
          status: json['status'],
          statusMessage: json['statusMessage'],
          success: json['success']
      );

  @override
  List<Object?> get props => [status, statusMessage, success];

}
