import 'package:flutter_features/features/react_to_message/data/dtos/message_model_dto.dart';

class MessageRemoteDataSource {
  final String baseUrl;

  MessageRemoteDataSource(this.baseUrl);

  Future<List<MessageDTO>> fetchMessages(String userId) async {
    const Map<String, dynamic> response = {
      'statusCode': 200,
      'body': [
        {
          "message_id": "1",
          "sender_id": "user123",
          "content": "Hello there!",
          "sent_at": "2024-12-20T08:00:00Z",
          "type": "text",
          "is_read": true,
          "read_at": "2024-12-20T10:00:00Z",
          "reactions": [
            {"emoji": "❤️", "user_id": "user789"}
          ]
        },
        {
          "message_id": "2",
          "sender_id": "user789",
          "content": "Good morning!",
          "sent_at": "2024-12-20T11:00:00Z",
          "type": "text",
          "is_read": false,
          "reactions": []
        }
      ],
    };

    if (response['statusCode'] == 200) {
      return MessageDTO.fromJsonList(response['body']);
    } else {
      throw Exception('Failed to load user');
    }
  }
}
