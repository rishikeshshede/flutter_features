import 'package:flutter/widgets.dart';
import 'package:flutter_features/features/react_to_message/data/dtos/additional_message_data.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/utils/constants/app_constants.dart';
import 'package:flutter_features/utils/responsive_util.dart';
import 'package:get/get.dart';

class ReactToMessageController extends GetxController {
  List<String> quickReactionEmojis = ["😂", "❤️", "👀", "👍🏼", "💯", "🔥"];
  late RxList<double> emojiScales;
  RxInt selectedEmojiIndex = (-1).obs;

  RxBool isReacting = false.obs;
  Rx<Offset> globalOffset = Offset.zero.obs;
  Rx<Offset> localOffset = Offset.zero.obs;

  int replyingToMsgIndex = -1;
  String replyingToMsgId = "";
  late ChatController chatController;

  @override
  void onInit() {
    super.onInit();
    emojiScales = List.filled(quickReactionEmojis.length, 1.0).obs;
    chatController = Get.find<ChatController>();
  }

  void startReaction(
      Offset offsetGlobal, Offset offsetLocal, int index, String msgId) {
    isReacting.value = true;
    globalOffset.value = offsetGlobal;
    localOffset.value = offsetLocal;
    replyingToMsgIndex = index;
    replyingToMsgId = msgId;
  }

  void stopReaction() {
    isReacting.value = false;
    globalOffset.value = Offset.zero;
    localOffset.value = Offset.zero;
    replyingToMsgIndex = -1;
  }

  double getReactionPanelTopPosition(BuildContext context) {
    return getYPosition(context) - localOffset.value.dy - 5 - 50;
  }

  double getMessageBubbleTopPosition(BuildContext context) {
    return getYPosition(context) - localOffset.value.dy;
  }

  double getReplyPopMenuTopPosition(BuildContext context) {
    return getYPosition(context) + (45 - localOffset.value.dy) + 5;
  }

  double getYPosition(BuildContext context) {
    const double topSafeArea = 120.0;
    const double bottomSafeArea = 300.0;

    if (globalOffset.value.dy < topSafeArea) {
      return globalOffset.value.dy + topSafeArea;
    } else if (globalOffset.value.dy + bottomSafeArea >
        ResponsiveUtil.height(context, 1)) {
      return ResponsiveUtil.height(context, 1) - bottomSafeArea;
    }
    return globalOffset.value.dy;
  }

  void onEmojiTap(int index) async {
    emojiScales[index] = 2;
    await Future.delayed(const Duration(milliseconds: 200));
    emojiScales[index] = 1.0;
    addReactionToMessage(index);
    stopReaction();
  }

  void addReactionToMessage(int tappedEmojiIndex) {
    int index = chatController.messages
        .indexWhere((message) => message.messageId == replyingToMsgId);

    if (index != -1) {
      List<MessageReaction> reactions =
          chatController.messages[index].reactions ?? [];

      String myUserId = AppConstants.dummyOwnUserId;
      String selectedEmoji = quickReactionEmojis[tappedEmojiIndex];
      int existingReactionIndex =
          reactions.indexWhere((reaction) => reaction.userId == myUserId);

      if (existingReactionIndex != -1) {
        if (reactions[existingReactionIndex].emoji == selectedEmoji) {
          reactions.removeAt(existingReactionIndex);
        } else {
          reactions[existingReactionIndex] = MessageReaction(
            emoji: selectedEmoji,
            userId: myUserId,
          );
        }
      } else {
        reactions.add(
          MessageReaction(
            emoji: selectedEmoji,
            userId: myUserId,
          ),
        );
      }
      print("reactions: $reactions");

      Message updatedMessage =
          chatController.messages[index].copyWith(reactions: reactions);

      chatController.messages[index] = updatedMessage;

      if (selectedEmojiIndex.value == index) {
        selectedEmojiIndex.value = -1;
      } else {
        selectedEmojiIndex.value = index;
      }
    }
  }
}
