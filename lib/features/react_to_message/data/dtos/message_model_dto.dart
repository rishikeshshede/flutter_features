import 'package:flutter_features/features/react_to_message/data/dtos/additional_message_data.dart';

class MessageDTO {
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

  MessageDTO({
    required this.messageId,
    required this.senderId,
    this.content = 'Could not get this message',
    required this.sentAt,
    required this.type,
    this.isRead = false,
    this.readAt,
    this.updatedAt,
    this.deletedAt,
    this.reactions = const <MessageReaction>[],
  });

  // Factory constructor for JSON deserialization
  factory MessageDTO.fromJson(Map<String, dynamic> json) {
    return MessageDTO(
      messageId: json['message_id'],
      senderId: json['sender_id'],
      content: json['content'] ?? 'Could not get this message',
      sentAt: json['sent_at'],
      type: MessageType.values.byName(json['type']),
      isRead: json['is_read'] ?? false,
      readAt: json['read_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      reactions: (json['reactions'] as List<dynamic>?)
          ?.map((reactionJson) => MessageReaction.fromJson(reactionJson))
          .toList(),
    );
  }

  static List<MessageDTO> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MessageDTO.fromJson(json)).toList();
  }
}
