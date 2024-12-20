import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';

abstract class MessageInterface {
  Future<List<Message>> getMessages(String userId);
}
