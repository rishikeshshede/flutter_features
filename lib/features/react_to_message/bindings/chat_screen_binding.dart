import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:get/get.dart';

class ChatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReactToMessageController>(() => ReactToMessageController());
  }
}
