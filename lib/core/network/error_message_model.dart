import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {

  final int status;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.status,
    required this.statusMessage,
    required this.success
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          status: json['status_code'],
          statusMessage: json['status_message'],
          success: json['success']
      );

  @override
  List<Object?> get props => [status, statusMessage, success];

}