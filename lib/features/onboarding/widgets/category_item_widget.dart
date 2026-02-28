import 'package:flutter/material.dart';
import 'package:nibble_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryOption category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryGreen.withValues(alpha: 0.08)
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : Colors.transparent,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            category.icon.svg(width: 32, height: 32),
            const SizedBox(height: 8),
            Text(
              category.title,
              textAlign: TextAlign.center,
              style: context.bodySmall.copyWith(
                color: AppColors.headingText,
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
