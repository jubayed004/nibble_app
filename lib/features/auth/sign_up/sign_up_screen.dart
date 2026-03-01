import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:nibble_app/core/router/route_path.dart';
import 'package:nibble_app/core/router/routes.dart';
import 'package:nibble_app/helper/toast/toast_helper.dart';
import 'package:nibble_app/helper/validator/text_field_validator.dart';
import 'package:nibble_app/share/widgets/button/custom_back_button.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/share/widgets/button/google_sign_in_button.dart';
import 'package:nibble_app/share/widgets/text_field/custom_text_field.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';
import 'package:nibble_app/utils/color/app_colors.dart';
import 'package:nibble_app/features/auth/controller/auth_controller.dart';
import 'package:nibble_app/utils/extension/base_extension.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailSignUp = TextEditingController();
  final TextEditingController passwordSignUp = TextEditingController();
  final TextEditingController confirmPasswordSignUp = TextEditingController();

  @override
  void dispose() {
    emailSignUp.dispose();
    passwordSignUp.dispose();
    confirmPasswordSignUp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(16.h),
                // Back Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: const CustomBackButton(),
                ),

                Gap(32.h),

                /// ----------- Title -----------
                Center(
                  child: Text(
                    AppStrings.signUpTitle,
                    style: context.headlineSmall,
                  ),
                ),

                Gap(32.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// ----------- Email Field -----------
                      Text(AppStrings.email, style: context.bodyLarge),
                      Gap(8.h),
                      CustomTextField(
                        controller: emailSignUp,
                        hintText: AppStrings.enterYourEmailSignup,
                        keyboardType: TextInputType.emailAddress,
                        validator: TextFieldValidator.email(),
                      ),

                      Gap(20.h),

                      /// ----------- Password Field -----------
                      Text(AppStrings.password, style: context.bodyLarge),
                      Gap(8.h),
                      CustomTextField(
                        controller: passwordSignUp,
                        hintText: AppStrings.enterYourPassword,
                        isPassword: true,
                        validator: TextFieldValidator.password(),
                      ),

                      Gap(20.h),

                      /// ----------- Confirm Password Field -----------
                      Text(
                        AppStrings.confirmPassword,
                        style: context.bodyLarge,
                      ),
                      Gap(8.h),
                      CustomTextField(
                        controller: confirmPasswordSignUp,
                        hintText: AppStrings.enterYourConfirmPassword,
                        isPassword: true,
                        validator: TextFieldValidator.password(),
                      ),

                      Gap(24.h),

                      /// ----------- Terms & Policy Checkbox -----------
                      Consumer(
                        builder: (context, ref, child) {
                          final acceptedTerms = ref.watch(
                            authControllerProvider.select(
                              (s) => s.acceptedTerms,
                            ),
                          );

                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .toggleTermsAcceptance();
                                },
                                child: Container(
                                  width: 24.w,
                                  height: 24.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: acceptedTerms
                                          ? AppColors.primaryGreen
                                          : AppColors.headingText,
                                      width: 1.5,
                                    ),
                                    color: acceptedTerms
                                        ? AppColors.primaryGreen
                                        : Colors.transparent,
                                  ),
                                  child: acceptedTerms
                                      ? Icon(
                                          Icons.check,
                                          size: 16.w,
                                          color: AppColors.white,
                                        )
                                      : null,
                                ),
                              ),
                              Gap(12.w),
                              Text(
                                'I understand the ',
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.subHeadingText,
                                ),
                              ),
                              Text(
                                'terms & policy',
                                style: context.bodyMedium.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      Gap(32.h),

                      /// ----------- Google Button -----------
                      GoogleSignInButton(
                        onTap: () {
                          // TODO: Google Sign up logic
                        },
                      ),

                      Gap(48.h),

                      /// ----------- Already Have Account -----------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.loginLink,
                            style: context.bodyMedium.copyWith(
                              color: AppColors.subHeadingText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap(8.w),
                          GestureDetector(
                            onTap: () => AppRouter.route.pushNamed(
                              RoutePath.loginScreen,
                            ),
                            child: Text(
                              AppStrings.loginTitle,
                              style: context.bodyMedium.copyWith(
                                color: AppColors.primaryGreenDark,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Gap(24.h),

                      /// ----------- Sign Up Button -----------
                      Consumer(
                        builder: (context, ref, child) {
                          final acceptedTerms = ref.watch(
                            authControllerProvider.select(
                              (s) => s.acceptedTerms,
                            ),
                          );
                          final isLoading = ref.watch(
                            authControllerProvider.select(
                              (s) => s.signUpLoading,
                            ),
                          );

                          return CustomButton(
                            isLoading: isLoading,
                            text: AppStrings.signUp,
                            onTap: () async {
                              if (!acceptedTerms) {
                                AppToast.error(
                                  message: 'Please accept terms and policy',
                                );
                                return;
                              }
                              // if (_formKey.currentState!.validate()) {
                              //   await ref
                              //       .read(authControllerProvider.notifier)
                              //       .signUp(
                              //         nameSignUp: emailSignUp.text.split('@').first,
                              //         emailSignUp: emailSignUp.text,
                              //         passwordSignUp: passwordSignUp.text,
                              //         isUser: true,
                              //       );
                              AppRouter.route.pushNamed(
                                RoutePath.activeOtpScreen,
                              );
                              // }
                            },
                          );
                        },
                      ),

                      Gap(32.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
