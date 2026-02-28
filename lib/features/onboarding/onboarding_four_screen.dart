import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/share/widgets/button/custom_back_button.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

import 'controller/onboarding_controller.dart';
import 'widgets/checkbox_item_widget.dart';

class OnboardingFourScreen extends ConsumerWidget {
  const OnboardingFourScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goals = ref.watch(learningGoalsListProvider);
    final selectedIndices = ref.watch(onboardingLearningGoalsProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
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
                    '4/7',
                    style: context.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.headingText,
                    ),
                  ),
                ],
              ),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                AppStrings.learningGoalsTitle,
                style: context.headlineSmall.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
            ),

            const Gap(32),

            // List of Goals
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndices.contains(index);
                  final goal = goals[index];

                  return CheckboxItemWidget(
                    category: goal,
                    isSelected: isSelected,
                    onTap: () {
                      ref
                          .read(onboardingLearningGoalsProvider.notifier)
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
                  context.pushNamed(RoutePath.onboardingFiveScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
