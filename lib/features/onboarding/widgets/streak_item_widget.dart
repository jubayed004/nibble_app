import 'package:flutter/material.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

import '../controller/onboarding_controller.dart';

class StreakItemWidget extends StatelessWidget {
  const StreakItemWidget({
    super.key,
    required this.streak,
    required this.isSelected,
    required this.onTap,
  });

  final StreakOption streak;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.white,
            width: 1.5,
          ),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              streak.title,
              style: context.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.headingText,
              ),
            ),
            Text(
              streak.subtitle,
              style: context.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.subHeadingText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
