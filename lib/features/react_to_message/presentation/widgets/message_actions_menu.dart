import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/chat_controller.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';

class PopupMenuWidget extends StatelessWidget {
  final bool showOnLeft;
  final ChatController chatController;
  final ReactToMessageController reactionController;

  const PopupMenuWidget({
    super.key,
    required this.showOnLeft,
    required this.chatController,
    required this.reactionController,
  });

  static List<Map<String, dynamic>> menuItems = [
    {
      'id': "reply",
      'text': "Reply",
      'icon': AssetConstants.replyOutlineIcon,
      'width': 16.0,
      'color': AppColors.backgroundLight,
      'action': () {},
    },
    {
      'id': "forward",
      'text': "Forward",
      'icon': AssetConstants.sendMessageOutlineIcon,
      'width': 16.0,
      'color': AppColors.backgroundLight,
      'action': () {},
    },
    {
      'id': "copy",
      'text': "Copy",
      'icon': AssetConstants.copyOutlineIcon,
      'width': 16.0,
      'color': AppColors.backgroundLight,
      'action': () {},
    },
    {
      'id': "delete",
      'text': "Delete for you",
      'icon': AssetConstants.deleteOutlineIcon,
      'width': 16.0,
      'color': AppColors.backgroundLight,
      'action': () {},
    },
    {
      'id': "unsend",
      'text': "Unsend",
      'icon': AssetConstants.unsendOutlineIcon,
      'width': 16.0,
      'color': AppColors.error,
      'action': () {},
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: showOnLeft ? 8 : null,
      top: reactionController.getReplyPopMenuTopPosition(context),
      right: showOnLeft ? null : 8,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.grey[800]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: menuItems.map((menu) {
              return _buildMenuItem(
                context,
                menu['id'],
                menu['text'],
                menu['icon'],
                menu['color'],
                menu['width'],
              );
            }).toList(),
            // ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String value, String text,
      String icon, Color color, double width) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              height: width,
              fit: BoxFit.scaleDown,
              color: color,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: AppTextTheme.body(context).copyWith(
                color: color,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
