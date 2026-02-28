import 'package:flutter/material.dart';

class AppColors {
  // ================= Common Colors =================
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color redColor = Color(0xFFBF0A30);

  static const Color success = Color(0xFF00DD30);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // ================= Nibble App - Brand =================
  static const Color primaryGreen = Color(0xFF047857); // Main Green
  static const Color primaryGreenDark = Color(0xFF034B3B); // Deep Primary Green
  static const Color primaryGreenLight = Color(
    0xFF07B18B,
  ); // Bright Teal Gradient

  // Legacy variables mapped to new green paradigm to prevent immediate breaks
  static const Color primaryBlue = primaryGreen;
  static const Color primaryBlueDark = primaryGreenDark;
  static const Color primaryBlueLight = primaryGreenLight;

  // ================= Background =================
  static const Color scaffoldBg = Color(0xFFEDF7EF); // Light Mint
  static const Color scaffoldGradientTop = Color(
    0xFFEDF7EF,
  ); // Top Light Mint Gradient
  static const Color scaffoldGradientBottom = Color(
    0xFFACEBD6,
  ); // Bottom Soft Teal Gradient
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color sectionBg = Color(0xFFFFFFFF);

  // ================= Text =================
  static const Color headingText = Color(0xFF374151); // Dark Charcoal/Grey
  static const Color subHeadingText = Color(0xFF6B7280); // Medium Gray
  static const Color hintTextColor = Color(0xFF9AA6B2);

  // ================= Border / Divider =================
  static const Color borderColor = Color(0xFF96C9B8);
  static const Color dividerColor = Color(0xFFEDF2F7);

  // ================= Status =================
  static const Color favoriteRed = Color(0xFFFF4D4F);
  static const Color priceGreen = Color(0xFF047857);

  // ================= Icon Background =================
  static const Color iconBg = Color(0xFFF0F3F8);

  // ================= Shadow =================
  static const Color shadowColor = Color(0x14000000);
}
