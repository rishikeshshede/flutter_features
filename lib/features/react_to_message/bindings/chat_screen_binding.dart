import 'package:flutter_features/features/react_to_message/data/implementations/message_interfact_impl.dart';
import 'package:flutter_features/features/react_to_message/data/sources/messages_remote_data_source.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:get/get.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageRemoteDataSource("baseUrl"));
    Get.lazyPut(
        () => MessageInterfactImpl(Get.find<MessageRemoteDataSource>()));
    Get.lazyPut(() =>
        ChatController(messageInterface: Get.find<MessageInterfactImpl>()));
    Get.lazyPut(() => ReactToMessageController());
  }
}
