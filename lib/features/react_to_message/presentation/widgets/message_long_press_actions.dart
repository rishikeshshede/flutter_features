import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/blur_bg_layer_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_actions_menu.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_bubble.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/reaction_panel.dart';
import 'package:flutter_features/utils/constants/app_constants.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:get/get.dart';

class MessageLongPressActions extends StatelessWidget {
  final ChatController chatController;
  final ReactToMessageController reactionController;

  const MessageLongPressActions({
    super.key,
    required this.chatController,
    required this.reactionController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => reactionController.isReacting.value
          ? Stack(
              children: [
                // Blur the entire background
                BlurBGLayer(reactionController: reactionController),

                // Show the reaction panel to select emoji from
                Positioned(
                  top: reactionController.getReactionPanelTopPosition(context),
                  child: ReactionPanel(reactionController: reactionController),
                ),

                // Show message that is long pressed
                Positioned(
                  top: reactionController.getMessageBubbleTopPosition(context),
                  right: chatController
                              .messages[reactionController.replyingToMsgIndex]
                              .senderId ==
                          AppConstants.dummyOwnUserId
                      ? 0
                      : null,
                  child: MessageBubble(
                    message: chatController
                        .messages[reactionController.replyingToMsgIndex],
                    index: reactionController.replyingToMsgIndex,
                    userImageUrl: AssetConstants.userMale1,
                    chatController: chatController,
                    reactionController: reactionController,
                  ),
                ),

                // Show menu to perform actions on the selected message
                PopupMenuWidget(
                  showOnLeft: AppConstants.dummyOwnUserId !=
                      chatController
                          .messages[reactionController.replyingToMsgIndex]
                          .senderId,
                  chatController: chatController,
                  reactionController: reactionController,
                )
              ],
            )
          : const SizedBox(),
    );
  }
}
