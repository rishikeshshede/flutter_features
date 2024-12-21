import 'package:flutter/material.dart';

/// A centralized class for managing app colors.
class AppColors {
  // Primary Color
  static const Color primary = Color(0xFF1757FF);

  // Secondary Colors
  static const Color secondary = Color(0xFF050C9C);
  static const Color secondaryLight = Color(0xFF83B4FF);

  // Accent Colors
  static const Color accent = Color(0xFF857CCE);
  static const Color accentLight = Color(0xFFE4E4FF);

  // Neutral Colors (Background and Text)
  static const Color backgroundLight = Color(0xFFFBFBFB);
  static const Color backgroundDark = Color(0xFF252525);

  static const Color textLight = Color(0xFFFBFBFB);
  static const Color textDark = Color(0xFF212427);
  static const Color textGrey = Color(0xFFB4B4B8);

  // Supporting Colors
  static const Color error = Color(0xFFFF2929);
  static const Color success = Color(0xFF06D001);
  static const Color greyDisabled = Color(0xFFEEEEEE);

  // Gradients
  /// Primary gradient used across the app.
  static const List<Color> gradientPrimary = [secondary, primary];
  static const List<double> gradientPrimaryStops = [0.35, 0.75];

  /// Colors used for Instagram UI
  static const Color ownMessageBubble = Color(0xFF5069f2);
  static const Color otherMessageBubble = Color(0xFF25292E);
  static const Color backgroundBlack = Color(0xFF0B1014);
  static const Color textField = Color(0xFF1C1E1F);
}
