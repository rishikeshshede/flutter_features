import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/encription_info_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_bubble.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_input_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_long_press_actions.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/responsive_util.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.find<ChatController>();
  final reactionController = Get.find<ReactToMessageController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatController.fetchMessages("user789");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: const AppBarWidget(),
          body: Container(
            color: AppColors.backgroundBlack,
            height: ResponsiveUtil.height(context, 1),
            child: Stack(
              children: [
                // Show messages
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const EncriptionInfoWidget(),
                      Obx(
                        () => chatController.isLoading.value
                            ? const Center(child: CircularProgressIndicator())
                            : _buildMessageList(context),
                      ),
                    ],
                  ),
                ),
                // Message input box
                const Positioned(
                  bottom: 0,
                  left: 7.2,
                  right: 7.2,
                  child: MessageInputWidget(),
                ),
              ],
            ),
          ),
        ),
        // Show then a message is long pressed
        MessageLongPressActions(
            chatController: chatController,
            reactionController: reactionController),
      ],
    );
  }

  Container _buildMessageList(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ResponsiveUtil.height(context, .05)),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: chatController.messages.length,
        itemBuilder: (context, index) {
          Message message = chatController.messages[index];

          return Column(
            children: [
              if (!chatController.isMsgFromSameDay(index))
                _showMessageDate(index, context),
              MessageBubble(
                message: message,
                index: index,
                chatController: chatController,
                userImageUrl: AssetConstants.userMale1,
                reactionController: reactionController,
              ),
            ],
          );
        },
      ),
    );
  }

  Padding _showMessageDate(int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        chatController.getMessageDateString(index),
        style: AppTextTheme.extraSmall(context).copyWith(
          color: AppColors.textGrey,
        ),
      ),
    );
  }
}
