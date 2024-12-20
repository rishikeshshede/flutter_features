import 'package:flutter_features/features/react_to_message/data/dtos/additional_message_data.dart';

class Message {
  final String messageId;
  final String senderId;
  final String? content;
  final String sentAt;
  final MessageType type;
  final bool isRead;
  final String? readAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<MessageReaction>? reactions;

  Message(
    this.messageId,
    this.senderId,
    this.content,
    this.sentAt,
    this.type,
    this.isRead,
    this.readAt,
    this.updatedAt,
    this.deletedAt,
    this.reactions,
  );
}
