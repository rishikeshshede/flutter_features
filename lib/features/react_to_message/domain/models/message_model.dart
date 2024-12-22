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

  Message copyWith({
    String? messageId,
    String? senderId,
    String? content,
    String? sentAt,
    MessageType? type,
    bool? isRead,
    String? readAt,
    String? updatedAt,
    String? deletedAt,
    List<MessageReaction>? reactions,
  }) {
    return Message(
      messageId ?? this.messageId,
      senderId ?? this.senderId,
      content ?? this.content,
      sentAt ?? this.sentAt,
      type ?? this.type,
      isRead ?? this.isRead,
      readAt ?? this.readAt,
      updatedAt ?? this.updatedAt,
      deletedAt ?? this.deletedAt,
      reactions ?? this.reactions,
    );
  }
}
