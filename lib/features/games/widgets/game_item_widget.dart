import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/share/widgets/network_image/custom_network_image.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class GameItemWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int level;
  final int stars;

  const GameItemWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    this.level = 1,
    this.stars = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // -------- Thumbnail --------
          CustomNetworkImage(
            borderRadius: BorderRadius.circular(10.r),
            imageUrl: imageUrl,
            width: 52.w,
            height: 52.w,
            fit: BoxFit.cover,
          ),

          Gap(14.w),

          // -------- Title & Level --------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.headingText,
                  ),
                ),
                Gap(4.h),
                Text(
                  'Lvl $level',
                  style: context.bodySmall.copyWith(
                    color: AppColors.subHeadingText,
                  ),
                ),
              ],
            ),
          ),

          // -------- Stars --------
          Row(
            children: [
              Text(
                '$stars',
                style: context.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headingText,
                ),
              ),
              Gap(4.w),
              Icon(
                Icons.star_border_rounded,
                size: 20.r,
                color: AppColors.headingText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
