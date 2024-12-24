import 'package:flutter/material.dart';
import 'package:flutter_features/features/react_to_message/presentation/controllers/react_to_message_controller.dart';
import 'package:flutter_features/utils/constants/size_constants.dart';
import 'package:flutter_features/utils/responsive_util.dart';
import 'package:get/get.dart';

class ReactionPanel extends StatelessWidget {
  const ReactionPanel({super.key, required this.reactionController});
  final ReactToMessageController reactionController;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: ResponsiveUtil.width(context, 1) - 16,
            height: 50,
            margin: const EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.grey[850],
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: ResponsiveUtil.width(context, 1) - 16,
            margin: const EdgeInsets.only(left: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...reactionController.quickReactionEmojis.asMap().entries.map(
                  (entry) {
                    int index = entry.key;
                    String emoji = entry.value;
                    return Expanded(
                      child: Center(
                        child: GestureDetector(
                          onTap: () => reactionController.onEmojiTap(index),
                          behavior: HitTestBehavior.opaque,
                          child: Obx(() {
                            double scale =
                                reactionController.emojiScales[index];
                            return Transform.translate(
                              offset: scale == 1
                                  ? Offset.zero
                                  : const Offset(0, -70),
                              child: Transform.scale(
                                scale: scale,
                                child: Text(
                                  emoji,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 24.w(context)),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
