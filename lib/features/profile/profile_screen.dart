import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/core/router/routes.dart';
import 'package:nibble_app/features/other/widgets/settings_disclosure_item.dart';
import 'package:nibble_app/share/widgets/custom_buttom_sheet/custom_buttom_sheet.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(32.h),

            // -------------------- Profile Avatar --------------------
            CircleAvatar(
              radius: 45.r,
              backgroundColor: AppColors.borderColor,
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=12',
              ),
            ),

            Gap(12.h),

            // -------------------- Name --------------------
            Text(
              'Hridoy',
              style: context.titleLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.headingText,
              ),
            ),

            Gap(4.h),

            // -------------------- Email --------------------
            Text(
              'Hridoy@Gmail.Com',
              style: context.bodyMedium.copyWith(
                color: AppColors.subHeadingText,
              ),
            ),

            Gap(32.h),

            // -------------------- Settings List --------------------
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section header
                    Text(
                      AppStrings.accountSettings,
                      style: context.bodyLarge.copyWith(),
                    ),

                    Gap(12.h),

                    // Personal Information
                    SettingsDisclosureItem(
                      title: AppStrings.personalInformation,
                      icon: Iconsax.profile_circle,
                      onTap: () {},
                    ),

                    // Password & Security
                    SettingsDisclosureItem(
                      title: AppStrings.passwordAndSecurity,
                      icon: Iconsax.lock_1,
                      onTap: () {},
                    ),

                    // Support
                    SettingsDisclosureItem(
                      title: AppStrings.support,
                      icon: Iconsax.message_question,
                      onTap: () {},
                    ),

                    // About us
                    SettingsDisclosureItem(
                      title: AppStrings.aboutUs,
                      icon: Iconsax.info_circle,
                      onTap: () {},
                    ),

                    // Terms of use
                    SettingsDisclosureItem(
                      title: AppStrings.termsOfUse,
                      icon: Iconsax.document_text,
                      onTap: () {},
                    ),

                    // Privacy Policy
                    SettingsDisclosureItem(
                      title: AppStrings.privacyPolicy,
                      icon: Iconsax.shield_tick,
                      isLast: true,
                      onTap: () {},
                    ),

                    Gap(32.h),

                    // -------------------- Log Out Button --------------------
                    GestureDetector(
                      onTap: () {
                        showYesNoModal(
                          context,
                          title: 'Log Out',
                          message: 'Are you sure you want to log out?',
                          confirmButtonText: 'Log Out',
                          onConfirm: () {
                            AppRouter.route.goNamed(RoutePath.loginScreen);
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 52.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryGreen,
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Iconsax.logout,
                              color: AppColors.white,
                              size: 20.r,
                            ),
                            Gap(10.w),
                            Text(
                              AppStrings.logOut,
                              style: context.bodyLarge.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Gap(24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
