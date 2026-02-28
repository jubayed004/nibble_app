import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/core/custom_assets/assets.gen.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              // Illustration Image
              Assets.images.getStartedLogo.image(),

              const SizedBox(height: 48),

              // Headline Text
              Text(
                AppStrings.onboardingHeadline,
                textAlign: TextAlign.center,
                style: context.headlineMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),

              const Spacer(flex: 3),

              // Get Started Button
              CustomButton(
                onTap: () {
                  context.pushNamed(RoutePath.onboardingOneScreen);
                },
                text: AppStrings.getStarted,
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
