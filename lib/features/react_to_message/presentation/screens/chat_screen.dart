import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/domain/models/message_model.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/app_bar_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/encription_info_widget.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_bubble.dart';
import 'package:flutter_features/features/react_to_message/presentation/widgets/message_input_widget.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/datetime_util.dart';
import 'package:flutter_features/utils/responsive_util.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final chatController = Get.find<ChatController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatController.fetchMessages("user789");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: GestureDetector(
        onLongPressStart: (details) {},
        child: Container(
          color: AppColors.backgroundBlack,
          height: ResponsiveUtil.height(context, 1),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    const EncriptionInfoWidget(),
                    Obx(
                      () => chatController.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Container(
                              margin: EdgeInsets.only(
                                  bottom: ResponsiveUtil.height(context, .05)),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: chatController.messages.length,
                                itemBuilder: (context, index) {
                                  Message message =
                                      chatController.messages[index];
                                  bool isLastMsgBySameSender = index == 0
                                      ? false
                                      : chatController
                                              .messages[index - 1].senderId ==
                                          message.senderId;
                                  bool isNextMsgBySameSender = index ==
                                          chatController.messages.length - 1
                                      ? false
                                      : chatController
                                              .messages[index + 1].senderId ==
                                          message.senderId;
                                  bool isMsgFromSameDay = index == 0
                                      ? false
                                      : DatetimeUtil.isDateSame(
                                          chatController
                                              .messages[index - 1].sentAt,
                                          chatController
                                              .messages[index].sentAt);

                                  String dateStr = '';
                                  if (!isMsgFromSameDay) {
                                    DateTime dateTime = DateTime.parse(
                                        chatController.messages[index].sentAt);
                                    dateStr =
                                        DatetimeUtil.toDateStringDDMMMYYYY(
                                            dateTime);
                                  }

                                  return Column(
                                    children: [
                                      if (!isMsgFromSameDay)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Text(
                                            dateStr.toUpperCase(),
                                            style: AppTextTheme.extraSmall(
                                                context),
                                          ),
                                        ),
                                      MessageBubble(
                                        message: message,
                                        index: index,
                                        isLastMsgBySameSender:
                                            isLastMsgBySameSender,
                                        isNextMsgBySameSender:
                                            isNextMsgBySameSender,
                                        userImageUrl: AssetConstants.userMale1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
