import 'package:flutter/material.dart';
import 'package:flutter_features/themes/text_theme.dart';
import 'package:flutter_features/utils/constants/asset_constants.dart';
import 'package:flutter_features/utils/constants/color_constants.dart';
import 'package:flutter_features/utils/constants/size_constants.dart';
import 'package:flutter_features/utils/constants/space_utils.dart';
import 'package:flutter_features/utils/responsive_util.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundBlack,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Icon(
          Icons.arrow_back_ios,
          size: 18.w(context),
          color: AppColors.backgroundLight,
        ),
      ),
      leadingWidth: 35,
      automaticallyImplyLeading: false,
      titleSpacing: 0.0,
      elevation: 2,
      title: Row(
        children: [
          const HorizontalSpace(space: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              AssetConstants.userMale1,
              width: ResponsiveUtil.width(context, .075),
              height: ResponsiveUtil.width(context, .075),
              fit: BoxFit.cover,
            ),
          ),
          const HorizontalSpace(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rishi • Full-Stack Freelancer",
                  style: AppTextTheme.body(context).copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textLight,
                  ),
                ),
                Text(
                  "rishikeshshede",
                  style: AppTextTheme.small(context).copyWith(
                    color: AppColors.textGrey,
                  ),
                )
              ],
            ),
          ),
          const ActionWidget(icon: AssetConstants.phoneOutlineIcon),
          const HorizontalSpace(space: 6),
          const ActionWidget(icon: AssetConstants.videoOutlineIcon),
          const HorizontalSpace(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ActionWidget extends StatelessWidget {
  const ActionWidget({
    super.key,
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveUtil.width(context, .095),
      height: ResponsiveUtil.width(context, .095),
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        // color: AppColors.greyDisabled,
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        icon,
        fit: BoxFit.contain,
        color: AppColors.backgroundLight,
      ),
    );
  }
}
