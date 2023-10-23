import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/Theme/text_theme.dart';

extension TextHelper on BuildContext {
  TextTheme get DarkTextTheme => CustomTextTheme.customDarkTextTheme;
  TextTheme get LightTextTheme => CustomTextTheme.customLightTextTheme;

  TextStyle? get displayLargeDark => DarkTextTheme.displayLarge;
  TextStyle? get displayMediumDark => DarkTextTheme.displayMedium;
  TextStyle? get displaySmallDark => DarkTextTheme.displaySmall;
  TextStyle? get headlineMediumDark => DarkTextTheme.headlineMedium;
  TextStyle? get headlineSmallDark => DarkTextTheme.headlineSmall;
  TextStyle? get titleLargeDark => DarkTextTheme.titleLarge;
  TextStyle? get subtitle1Dark => DarkTextTheme.titleMedium;
  TextStyle? get subtitle2Dark => DarkTextTheme.titleSmall;
  TextStyle? get bodyText1Dark => DarkTextTheme.bodyLarge;
  TextStyle? get bodyText2Dark => DarkTextTheme.bodyMedium;
  TextStyle? get captionDark => DarkTextTheme.bodySmall;
  TextStyle? get buttonDark => DarkTextTheme.labelLarge;
  TextStyle? get overlineDark => DarkTextTheme.labelSmall;

  //Light Theme getters

  TextStyle? get displayLargeLight => LightTextTheme.displayLarge;
  TextStyle? get titleSmallLight => LightTextTheme.titleSmall;
//   TextStyle? get displaySmallDark => LightTextTheme.displaySmall;

  TextStyle? get headlineMediumLight => LightTextTheme.headlineMedium;
}

TextStyle? getCustomHeadlineMediumLight(BuildContext context, Color color) {
  final baseStyle = context.headlineMediumLight;
  return baseStyle?.copyWith(color: color);
}
