import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nibble_app/features/other/controller/other_controller.dart';
import 'package:nibble_app/helper/validator/text_field_validator.dart';
import 'package:nibble_app/share/widgets/button/custom_button.dart';
import 'package:nibble_app/share/widgets/text_field/custom_text_field.dart';
import 'package:nibble_app/utils/app_strings/app_strings.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _resetPassword = TextEditingController();
  final TextEditingController _resetConfirmPassword = TextEditingController();

  @override
  void dispose() {
    _resetConfirmPassword.dispose();
    _resetPassword.dispose();
    _oldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Change Password'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// ---------- Old Password Input ----------
                        CustomTextField(
                          title: "Old Password",
                          hintText: AppStrings.enterYourPassword,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _oldPassword,
                          validator: TextFieldValidator.password(),
                        ),
                        Gap(16.h),

                        /// ---------- New Password Input ----------
                        CustomTextField(
                          title: AppStrings.newPassword,
                          hintText: AppStrings.enterYourNewPassword,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _resetPassword,
                          validator: TextFieldValidator.password(),
                        ),
                        Gap(16.h),

                        /// ---------- Confirm Password ----------
                        CustomTextField(
                          title: AppStrings.confirmPassword,
                          hintText: AppStrings.confirmYourNewPassword,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _resetConfirmPassword,
                          validator: TextFieldValidator.confirmPassword(
                            _resetPassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              CustomButton(
                isLoading: ref
                    .watch(otherControllerProvider)
                    .changePasswordLoading,
                text: AppStrings.resetPassword,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    ref
                        .read(otherControllerProvider.notifier)
                        .changePassword(
                          body: {
                            "old_password": _oldPassword.text,
                            "new_password": _resetPassword.text,
                          },
                        );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
