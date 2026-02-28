import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nibble_app/utils/color/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.padding,
  });

  /// Optional custom tap handler. If null, defaults to [context.pop()].
  final VoidCallback? onTap;

  /// Icon color. Defaults to [AppColors.headingText].
  final Color? iconColor;

  /// Button background color. Defaults to [AppColors.white].
  final Color? backgroundColor;

  /// Icon size. Defaults to 20.
  final double? iconSize;

  /// Inner padding. Defaults to [EdgeInsets.all(10)].
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          onTap ??
          () {
            if (context.canPop()) {
              context.pop();
            }
          },
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: padding ?? const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back,
          size: iconSize ?? 20,
          color: iconColor ?? AppColors.headingText,
        ),
      ),
    );
  }
}
