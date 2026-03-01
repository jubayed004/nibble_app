import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nibble_app/share/widgets/network_image/custom_network_image.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

/// Horizontal chip card used in the "All Topics" row.
class ExploreTopicChip extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const ExploreTopicChip({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomNetworkImage(
              imageUrl: imageUrl,
              height: 90.h,
              width: double.infinity,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14.r),
                topRight: Radius.circular(14.r),
              ),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              child: Text(
                title,
                style: context.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headingText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
