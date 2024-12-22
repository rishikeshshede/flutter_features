import 'package:flutter_features/features/react_to_message/domain/interfaces/message_interface.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:flutter_features/utils/datetime_util.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late final MessageInterface messageInterface;

  RxBool isLoading = false.obs;
  RxList<Message> messages = <Message>[].obs;

  ChatController({required this.messageInterface});

  Future<void> fetchMessages(String userId) async {
    try {
      isLoading.value = true;
      messages.value = await messageInterface.getMessages(userId);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  bool isLastMsgBySameSender(int index) {
    return index > 0 &&
        messages[index - 1].senderId == messages[index].senderId;
  }

  bool isNextMsgBySameSender(int index) {
    return index < messages.length - 1 &&
        messages[index + 1].senderId == messages[index].senderId;
  }

  bool isMsgFromSameDay(int index) {
    return index > 0 &&
        DatetimeUtil.isDateSame(
            messages[index - 1].sentAt, messages[index].sentAt);
  }

  String getMessageDateString(int index) {
    return !isMsgFromSameDay(index)
        ? DatetimeUtil.toDateStringDDMMMYYYY(
            DateTime.parse(messages[index].sentAt),
          ).toUpperCase()
        : '';
  }
}
