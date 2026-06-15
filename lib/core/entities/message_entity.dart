import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  // final String status;
  final String message;

  const MessageEntity({
    // required this.status,
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
