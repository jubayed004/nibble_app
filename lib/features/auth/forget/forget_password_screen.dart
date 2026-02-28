import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*       scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          AppStrings.forgotPassword.tr,
          style: context.headlineSmall.copyWith(color: AppColors.primaryBlue),
        ),*/
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                /*                Gap(20.h),

                /// ---------- MAIN TITLE ----------
                Text(
                  AppStrings.forgotPassword.tr,
                  textAlign: TextAlign.center,
                  style: context.headlineSmall,
                ),
                Gap(12.h),

                /// ---------- SUBTITLE ----------
                Text(
                  AppStrings.forgotPasswordTitle.tr,
                  textAlign: TextAlign.center,
                  style: context.bodyMedium.copyWith(
                    color: isDarkMode ? Colors.white : AppColors.hintTextColor,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(32.h),

                /// ---------- Email Input ----------
                CustomTextField(
                  controller: emailController,
                  title: AppStrings.email.tr,
                  hintText: AppStrings.enterYourEmail.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(Icons.mail_outline_rounded, size: 20),
                  validator: TextFieldValidator.email(),
                ),
                Gap(32.h),

                /// ---------- Send Reset Link Button ----------
                Obx(
                  () => CustomButton(
                    isLoading: authController.forgotPasswordLoading.value,
                    text: AppStrings.sendCode.tr,
                    onTap: () {
                      AppRouter.route.pushNamed(RoutePath.verifyOtpScreen);
                      // if (_formKey.currentState!.validate()) {
                      //   authController.forgotPassword(
                      //     email: emailController.text,
                      //   );
                      // }
                    },
                  ),
                ),
                Gap(20.h),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
