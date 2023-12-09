import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

Widget docTile({
  required BuildContext context,
  required String iconPath,
  required String title,
  String subtitle = '',
  required int points,
}) {
  return Container(
    width: 342,
    height: 91,
    padding: const EdgeInsets.only(
      top: 10,
      left: 15,
      right: 15,
      bottom: 17,
    ),
    decoration: ShapeDecoration(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(width: 1, color: Color(0xFFEBE0E2)),
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildImageWidget(
          width: 56,
          height: 56,
          imagePath: iconPath,
        ),
        const SizedBox(
          width: 15,
        ),
        SizedBox(
          height: 42,
          width: 158,
          child: Text(
            "$title\n$subtitle",
            style: context.overlineLight,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "$points Points",
          style: context.buttonLight,
        )
      ],
    ),
  );
}
