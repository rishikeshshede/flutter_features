import 'package:flutter_features/features/react_to_message/data/dtos/message_model_dto.dart';
import 'package:flutter_features/features/react_to_message/data/mappers/message_mapper.dart';
import 'package:flutter_features/features/react_to_message/data/sources/messages_remote_data_source.dart';
import 'package:flutter_features/features/react_to_message/domain/interfaces/message_interface.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';

class MessageInterfactImpl implements MessageInterface {
  final MessageRemoteDataSource remoteDataSource;
  MessageInterfactImpl(this.remoteDataSource);

  @override
  Future<List<Message>> getMessages(String userId) async {
    final List<MessageDTO> messageDTO =
        await remoteDataSource.fetchMessages(userId);
    return MessageMapper.toDomain(messageDTO);
  }
}
