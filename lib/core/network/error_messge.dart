import 'package:equatable/equatable.dart';

class ErrorMassageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMassageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMassageModel.fromJson(Map<String, dynamic>? json, {
    int? statusCode,
  }) {
    return ErrorMassageModel(
      statusCode: statusCode ?? json?['status_code'] ?? 500,
      statusMessage:
          json?['message'] ??
          json?['status_message'] ??
          json?['error'] ??
          'Unknown error',
      success: json?['success'] ?? false,
    );
  }

  @override
  List<Object> get props => [statusCode, statusMessage, success];
}
