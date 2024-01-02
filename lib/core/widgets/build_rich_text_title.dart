import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/color_extention.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

class BuildRichTextTitle extends StatelessWidget {
  const BuildRichTextTitle(
      {super.key, required this.title1, required this.title2});
  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title1,
            style: context.headlineMediumLight,
          ),
          TextSpan(
            text: title2,
            style: getCustomHeadlineMediumLight(
              context,
              context.primary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
