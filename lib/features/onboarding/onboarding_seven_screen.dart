import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/core/custom_assets/assets.gen.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/share/widgets/button/custom_back_button.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class OnboardingSevenScreen extends StatelessWidget {
  const OnboardingSevenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Row(children: [const CustomBackButton()]),
            ),

            const Spacer(),

            // Image
            Assets.images.righhtLogo.image(
              width: 280,
              height: 280,
              fit: BoxFit.contain,
            ),

            const Gap(32),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                AppStrings.completionTitle,
                textAlign: TextAlign.center,
                style: context.headlineSmall.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                ),
              ),
            ),

            const Gap(16),

            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                AppStrings.completionSubtitle,
                textAlign: TextAlign.center,
                style: context.bodyMedium.copyWith(
                  color: AppColors.subHeadingText,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(flex: 2),

            // Bottom Button
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                text: 'Continue',
                onTap: () {
                  context.goNamed(RoutePath.loginScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
