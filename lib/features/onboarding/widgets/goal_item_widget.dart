import 'package:flutter/material.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';
import 'package:gap/gap.dart';

import '../controller/onboarding_controller.dart';

class GoalItemWidget extends StatelessWidget {
  const GoalItemWidget({
    super.key,
    required this.goal,
    required this.isSelected,
    required this.onTap,
  });

  final GoalOption goal;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
          children: [
            goal.icon.svg(height: 32, width: 32),
            const Gap(16),
            Expanded(
              child: Text(
                goal.title,
                style: context.bodyLarge.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.headingText,
                ),
              ),
            ),
            Text(
              goal.duration,
              style: context.bodyMedium.copyWith(
                color: AppColors.subHeadingText,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
