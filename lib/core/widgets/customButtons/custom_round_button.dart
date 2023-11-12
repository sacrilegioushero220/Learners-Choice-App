import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';

Widget buildCustomRoundedButton({
  required BuildContext context,
  required Color color,
  required void Function() onPressed,
}) {
  return Container(
    width: 80,
    height: 40,
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
    child: InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 13),
        child: Text(
          'Start',
          textAlign: TextAlign.center,
          style: context.overlineDark,
        ),
      ),
    ),
  );
}
