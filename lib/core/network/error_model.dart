import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json["status_code"],
      statusMessage: json["status_message"],
      success: json["success"],
    );
  }

  @override
  List<Object> get props => [statusCode, statusMessage, success];
}
