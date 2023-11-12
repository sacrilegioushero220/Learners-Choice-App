import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';

extension TextHelper on BuildContext {
  TextTheme get darkTextTheme => CustomTextTheme.customDarkTextTheme;
  TextTheme get lightTextTheme => CustomTextTheme.customLightTextTheme;

  TextStyle? get displayLargeDark => darkTextTheme.displayLarge;
  TextStyle? get displayMediumDark => darkTextTheme.displayMedium;
  TextStyle? get displaySmallDark => darkTextTheme.displaySmall;
  TextStyle? get headlineMediumDark => darkTextTheme.headlineMedium;
  TextStyle? get headlineSmallDark => darkTextTheme.headlineSmall;
  TextStyle? get titleLargeDark => darkTextTheme.titleLarge;
  TextStyle? get subtitle1Dark => darkTextTheme.titleMedium;
  TextStyle? get subtitle2Dark => darkTextTheme.titleSmall;
  TextStyle? get bodyText1Dark => darkTextTheme.bodyLarge;
  TextStyle? get bodyText2Dark => darkTextTheme.bodyMedium;
  TextStyle? get captionDark => darkTextTheme.bodySmall;
  TextStyle? get buttonDark => darkTextTheme.labelLarge;
  TextStyle? get overlineDark => darkTextTheme.labelSmall;

  //Light Theme getters

  TextStyle? get displayLargeLight => lightTextTheme.displayLarge;
  TextStyle? get titleSmallLight => lightTextTheme.titleSmall;
  TextStyle? get headlineMediumLight => lightTextTheme.headlineMedium;
  TextStyle? get overlineLight => lightTextTheme.labelSmall;
  TextStyle? get buttonLight => lightTextTheme.labelLarge;
  TextStyle? get captionLight => lightTextTheme.bodySmall;
}

TextStyle? getCustomHeadlineMediumLight(BuildContext context, Color color) {
  final baseStyle = context.headlineMediumLight;
  return baseStyle?.copyWith(color: color);
}
