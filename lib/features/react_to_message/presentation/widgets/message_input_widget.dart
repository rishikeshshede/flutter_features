import 'package:flutter/material.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/constants/size_constants.dart';
import 'package:flutter_features/utils/constants/space_utils.dart';
import 'package:flutter_features/utils/responsive_util.dart';

class MessageInputWidget extends StatelessWidget {
  const MessageInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double sectionHeight = ResponsiveUtil.height(context, .08);
    final double textboxHeight = ResponsiveUtil.height(context, .047);
    return Container(
      height: sectionHeight,
      width: ResponsiveUtil.width(context, 1) - 16,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: AppColors.backgroundBlack,
        borderRadius:
            BorderRadius.circular(ResponsiveUtil.height(context, .08) / 2),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textField,
          borderRadius:
              BorderRadius.circular(ResponsiveUtil.height(context, .08) / 2),
        ),
        height: textboxHeight,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: false,
                textCapitalization: TextCapitalization.sentences,
                textInputAction: TextInputAction.newline,
                style: AppTextTheme.genericTextStyle(context,
                    color: AppColors.textLight, fontSize: 13),
                decoration: InputDecoration(
                  hintText: "Message...",
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.h(context)),
                  border: InputBorder.none,
                ),
                onChanged: (value) {},
                onEditingComplete: () {},
              ),
            ),
            const HorizontalSpace(),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: textboxHeight - 12,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(18, 7, 14, 7),
                margin: const EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                  color: Colors.amber[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  AssetConstants.sendMessageFilledIcon,
                  height: 20,
                  color: AppColors.backgroundLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
