import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/core/router/routes.dart';
import 'package:nibble_app/helper/validator/text_field_validator.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/share/widgets/button/google_sign_in_button.dart';
import 'package:nibble_app/share/widgets/text_field/custom_text_field.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/features/auth/controller/auth_controller.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailSignIn = TextEditingController();
  final TextEditingController passwordSignIn = TextEditingController();

  @override
  void dispose() {
    emailSignIn.dispose();
    passwordSignIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(64.h), // Top spacing
                  /// ----------- Title -----------
                  Center(
                    child: Text(
                      AppStrings.welcomeBack,
                      style: context.headlineMedium.copyWith(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Gap(8.h),
                  Center(
                    child: Text(
                      AppStrings.loginSubtitle,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.subHeadingText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  Gap(32.h),

                  /// ----------- Email Field -----------
                  Text(AppStrings.email, style: context.bodyLarge.copyWith()),
                  Gap(8.h),
                  CustomTextField(
                    controller: emailSignIn,
                    hintText: AppStrings.enterYourEmail,
                    keyboardType: TextInputType.emailAddress,
                    validator: TextFieldValidator.email(),
                  ),

                  Gap(20.h),

                  /// ----------- Password Field -----------
                  Text(
                    AppStrings.password,
                    style: context.bodyLarge.copyWith(),
                  ),
                  Gap(8.h),
                  CustomTextField(
                    controller: passwordSignIn,
                    hintText: AppStrings.enterYourPassword,
                    isPassword: true,
                    validator: TextFieldValidator.password(),
                  ),

                  Gap(12.h),

                  /// ----------- Forgot Password -----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => AppRouter.route.pushNamed(
                          RoutePath.forgetPasswordScreen,
                        ),
                        child: Text(
                          AppStrings.forgotPassword,
                          style: context.bodyMedium.copyWith(),
                        ),
                      ),
                    ],
                  ),

                  Gap(24.h),

                  /// ----------- Or text -----------
                  Center(
                    child: Text('Or', style: context.bodyMedium.copyWith()),
                  ),
                  Gap(24.h),

                  /// ----------- Google Button -----------
                  GoogleSignInButton(
                    onTap: () {
                      // TODO: Google Signin Logic
                    },
                  ),

                  Gap(48.h), // Push bottom content down
                  /// ----------- Don't Have An Account -----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAnAccount,
                        style: context.bodyMedium.copyWith(),
                      ),
                      Gap(8.w),
                      GestureDetector(
                        onTap: () =>
                            AppRouter.route.pushNamed(RoutePath.signUpScreen),
                        child: Text(
                          AppStrings.signUp,
                          style: context.bodyMedium.copyWith(
                            color: AppColors.primaryGreenDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  Gap(24.h),

                  /// ----------- Login Button -----------
                  CustomButton(
                    isLoading: ref.watch(authControllerProvider).signInLoading,
                    text: AppStrings.loginTitle,
                    onTap: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   await ref
                      //       .read(authControllerProvider.notifier)
                      //       .signIn(
                      //         email: emailSignIn.text,
                      //         password: passwordSignIn.text,
                      //       );
                      //   // AppRouter.route.goNamed(RoutePath.navigationPage);
                      // }
                      AppRouter.route.goNamed(RoutePath.navigationPage);
                    },
                  ),

                  Gap(32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
