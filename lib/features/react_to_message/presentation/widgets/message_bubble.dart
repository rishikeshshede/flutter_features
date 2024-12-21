import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/app_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/constants/size_constants.dart';
import 'package:flutter_features/utils/constants/space_utils.dart';
import 'package:flutter_features/utils/responsive_util.dart';
import 'package:get/get.dart';

class MessageBubble extends StatelessWidget {
  final reactionController = Get.find<ReactToMessageController>();

  final String ownUserId = AppConstants.dummyOwnUserId;
  final Message message;
  final int index;
  final String userImageUrl;
  final ChatController chatController;

  MessageBubble({
    super.key,
    required this.message,
    required this.index,
    required this.userImageUrl,
    required this.chatController,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMyMessage = ownUserId == message.senderId;
    final double profilePicSize = ResponsiveUtil.width(context, .07);

    return Container(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      margin: _getMargins(isMyMessage, context),
      child: isMyMessage
          ? _buildMessageBubble(context, isMyMessage, profilePicSize)
          : Row(
              children: [
                if (!chatController.isNextMsgBySameSender(index))
                  _buildProfilePic(context, profilePicSize),
                const HorizontalSpace(),
                _buildMessageBubble(context, isMyMessage, profilePicSize),
              ],
            ),
    );
  }

  ClipRRect _buildProfilePic(BuildContext context, double size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Image.network(
        userImageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }

  Container _buildMessageBubble(
      BuildContext context, bool isMyMessage, double size) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 14.h(context), vertical: 7.w(context)),
      margin: EdgeInsets.only(
          left: chatController.isNextMsgBySameSender(index) ? size : 0),
      decoration: BoxDecoration(
        color: isMyMessage
            ? AppColors.ownMessageBubble
            : AppColors.otherMessageBubble,
        borderRadius: _getBorderRadius(isMyMessage),
      ),
      child: Text(
        message.content!,
        style: AppTextTheme.body(context).copyWith(
          color: AppColors.textLight,
        ),
      ),
    );
  }

  EdgeInsets _getMargins(bool isMyMessage, BuildContext context) {
    return EdgeInsets.fromLTRB(
      isMyMessage ? ResponsiveUtil.width(context, .3) : 8,
      chatController.isLastMsgBySameSender(index) ? 0 : 4,
      isMyMessage ? 8 : ResponsiveUtil.width(context, .3),
      2,
    );
  }

  BorderRadius _getBorderRadius(bool isMyMessage) {
    bool isLastMsgBySameSender = chatController.isLastMsgBySameSender(index);
    bool isNextMsgBySameSender = chatController.isNextMsgBySameSender(index);

    return BorderRadius.only(
      topLeft: isMyMessage
          ? const Radius.circular(16)
          : isLastMsgBySameSender
              ? Radius.zero
              : const Radius.circular(16),
      bottomLeft: isMyMessage
          ? const Radius.circular(16)
          : isNextMsgBySameSender
              ? Radius.zero
              : const Radius.circular(16),
      topRight: isMyMessage
          ? isLastMsgBySameSender
              ? Radius.zero
              : const Radius.circular(16)
          : const Radius.circular(16),
      bottomRight: isMyMessage
          ? isNextMsgBySameSender
              ? Radius.zero
              : const Radius.circular(16)
          : const Radius.circular(16),
    );
  }
}
