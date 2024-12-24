import 'package:flutter_features/features/react_to_message/data/dtos/message_model_dto.dart';

class MessageRemoteDataSource {
  final String baseUrl;

  MessageRemoteDataSource(this.baseUrl);

  Future<List<MessageDTO>> fetchMessages(String userId) async {
    await Future.delayed(const Duration(seconds: 1), () {});
    const Map<String, dynamic> response = {
      'statusCode': 200,
      'body': dummyMessages,
    };

    if (response['statusCode'] == 200) {
      return MessageDTO.fromJsonList(response['body']);
    } else {
      throw Exception('Failed to load user');
    }
  }
}

const dummyMessages = [
  {
    "message_id": "1",
    "sender_id": "user789",
    "content": "Hey, is this your new Flutter series?",
    "sent_at": "2024-12-19T18:00:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-19T18:05:00Z",
    "reactions": []
  },
  {
    "message_id": "2",
    "sender_id": "user123",
    "content": "Hii",
    "sent_at": "2024-12-19T18:06:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-19T18:07:20Z",
    "reactions": []
  },
  {
    "message_id": "3",
    "sender_id": "user123",
    "content": "Yes",
    "sent_at": "2024-12-19T18:06:10Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-19T18:07:20Z",
    "reactions": []
  },
  {
    "message_id": "4",
    "sender_id": "user123",
    "content": "Flutter Features",
    "sent_at": "2024-12-19T18:06:20Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-19T18:07:20Z",
    "reactions": []
  },
  {
    "message_id": "5",
    "sender_id": "user789",
    "content": "Awesome!❤️",
    "sent_at": "2024-12-19T18:08:30Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-19T18:09:20Z",
    "reactions": [
      {"emoji": "❤️", "user_id": "user789"}
    ]
  },
  {
    "message_id": "6",
    "sender_id": "user123",
    "content": "Hello there!",
    "sent_at": "2024-12-20T08:00:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-20T08:05:00Z",
    "reactions": []
  },
  {
    "message_id": "7",
    "sender_id": "user789",
    "content": "Heyy Rishi",
    "sent_at": "2024-12-20T08:06:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-20T08:09:00Z",
    "reactions": []
  },
  {
    "message_id": "8",
    "sender_id": "user123",
    "content": "How are you?",
    "sent_at": "2024-12-20T08:10:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-20T08:12:00Z",
    "reactions": []
  },
  {
    "message_id": "9",
    "sender_id": "user789",
    "content": "Good, thanks for asking!",
    "sent_at": "2024-12-20T08:13:00Z",
    "type": "text",
    "is_read": false,
    "read_at": "2024-12-20T08:18:00Z",
    "reactions": []
  },
  {
    "message_id": "10",
    "sender_id": "user789",
    "content": "How about you?",
    "sent_at": "2024-12-20T08:13:10Z",
    "type": "text",
    "is_read": false,
    "read_at": "2024-12-20T08:18:00Z",
    "reactions": []
  },
  {
    "message_id": "11",
    "sender_id": "user123",
    "content": "I'm doing great",
    "sent_at": "2024-12-21T08:20:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-21T10:21:00Z",
    "reactions": []
  },
  {
    "message_id": "12",
    "sender_id": "user123",
    "content": "Did you like this new feature?",
    "sent_at": "2024-12-21T08:20:00Z",
    "type": "text",
    "is_read": true,
    "read_at": "2024-12-21T10:21:00Z",
    "reactions": []
  },
  {
    "message_id": "13",
    "sender_id": "user789",
    "content": "Yeah, it so cool!!!",
    "sent_at": "2024-12-21T08:21:50Z",
    "type": "text",
    "is_read": false,
    "read_at": "2024-12-21T08:23:00Z",
    "reactions": []
  },
];
