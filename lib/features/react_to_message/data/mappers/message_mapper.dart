import 'package:flutter_features/features/react_to_message/data/dtos/additional_message_data.dart';
import 'package:flutter_features/features/react_to_message/data/dtos/message_model_dto.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';

class MessageMapper {
  // Converts MessageDTO to Message
  static List<Message> toDomain(List<MessageDTO> dtos) {
    return dtos.map((dto) {
      return Message(
        dto.messageId,
        dto.senderId,
        dto.content,
        dto.sentAt,
        dto.type,
        dto.isRead,
        dto.readAt,
        dto.updatedAt,
        dto.deletedAt,
        dto.reactions
            ?.map((reaction) =>
                MessageReaction(emoji: reaction.emoji, userId: reaction.userId))
            .toList(),
      );
    }).toList();
  }

  // Converts Message to MessageDTO
  static MessageDTO toDTO(Message message) {
    return MessageDTO(
      messageId: message.messageId,
      senderId: message.senderId,
      content: message.content ?? 'Could not get this message',
      sentAt: message.sentAt,
      type: message.type,
      isRead: message.isRead,
      readAt: message.readAt,
      updatedAt: message.updatedAt,
      deletedAt: message.deletedAt,
      reactions: message.reactions
          ?.map((reaction) =>
              MessageReaction(emoji: reaction.emoji, userId: reaction.userId))
          .toList(),
    );
  }
}
