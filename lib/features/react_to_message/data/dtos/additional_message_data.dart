enum MessageType { text, image, video, post, reel, story }

class MessageReaction {
  final String emoji;
  final String userId;

  MessageReaction({required this.emoji, required this.userId});

  factory MessageReaction.fromJson(Map<String, dynamic> json) {
    return MessageReaction(
      emoji: json['emoji'],
      userId: json['user_id'],
    );
  }
}
