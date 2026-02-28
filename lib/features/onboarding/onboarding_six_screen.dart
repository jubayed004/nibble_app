import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/core/custom_assets/assets.gen.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/share/widgets/button/custom_back_button.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/share/widgets/custom_image/custom_image.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

import 'controller/onboarding_controller.dart';
import 'widgets/streak_item_widget.dart';

class OnboardingSixScreen extends ConsumerWidget {
  const OnboardingSixScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streaks = ref.watch(streakListProvider);
    final selectedIndex = ref.watch(onboardingStreakProvider);

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
                    '6/7',
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
                AppStrings.commitTitle,
                style: context.headlineSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),

            const Gap(48),

            // List of Streaks
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                itemCount: streaks.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  final streak = streaks[index];

                  return StreakItemWidget(
                    streak: streak,
                    isSelected: isSelected,
                    onTap: () {
                      ref.read(onboardingStreakProvider.notifier).state = index;
                    },
                  );
                },
              ),
            ),

            // Footer illustration
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Assets.images.car.image(height: 100),
                  const Gap(8),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Assets.icons.youWillBe.svg(),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 24.0,
              ),
              child: CustomButton(
                text: 'Continue',
                onTap: () {
                  context.pushNamed(RoutePath.onboardingSevenScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
