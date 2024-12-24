import 'package:flutter/material.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/constants/size_constants.dart';
import 'package:flutter_features/utils/constants/text_constants.dart';
import 'package:flutter_features/utils/responsive_util.dart';

class EncriptionInfoWidget extends StatelessWidget {
  const EncriptionInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtil.width(context, .7),
      height: 80.h(context),
      padding: EdgeInsets.symmetric(
          horizontal: 20.h(context), vertical: 10.w(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AssetConstants.lockOutlineIcon,
            height: 10,
            color: AppColors.textGrey,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 3.w(context)),
              child: Text(
                TextConstants.encriptionInfo,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: AppTextTheme.extraSmall(context).copyWith(
                  height: 1.30,
                  color: AppColors.textGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
