import 'package:flutter_features/features/react_to_message/domain/interfaces/message_interface.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late final MessageInterface messageInterface;

  RxBool isLoading = false.obs;
  List<Message> messages = <Message>[].obs;

  ChatController({required this.messageInterface});

  Future<void> fetchMessages(String userId) async {
    try {
      isLoading.value = true;
      messages = await messageInterface.getMessages(userId);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
