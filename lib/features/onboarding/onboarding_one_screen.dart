import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/share/widgets/button/custom_back_button.dart';
import 'package:nibble_app/features/onboarding/controller/onboarding_controller.dart';
import 'package:nibble_app/features/onboarding/widgets/category_item_widget.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class OnboardingOneScreen extends ConsumerWidget {
  const OnboardingOneScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListProvider);
    final selectedIndices = ref.watch(onboardingCategoryProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomBackButton(),
                  Text(
                    '1/7',
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.headingText,
                    ),
                  ),
                ],
              ),
            ),

            // Title and Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.interestsHeadline,
                    style: context.headlineSmall.copyWith(
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const Gap(8),
                  Text(
                    AppStrings.interestsSubheadline,
                    style: context.bodyMedium.copyWith(
                      color: AppColors.subHeadingText,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const Gap(24),

            // Grid of Categories
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.9,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndices.contains(index);
                  final category = categories[index];

                  return CategoryItemWidget(
                    category: category,
                    isSelected: isSelected,
                    onTap: () {
                      ref
                          .read(onboardingCategoryProvider.notifier)
                          .toggleCategory(index);
                    },
                  );
                },
              ),
            ),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Continue',
                onTap: () {
                  context.pushNamed(RoutePath.onboardingTwoScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
