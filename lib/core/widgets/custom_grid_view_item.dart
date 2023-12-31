import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

Widget buildCustomGridViewItem(
  String iconPath,
  String label,
  BuildContext context,
) {
  return Container(
    height: 100,
    padding: const EdgeInsets.all(10),
    decoration: ShapeDecoration(
      color: const Color(0xFFF6EBEE),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 15),
        buildImageWidget(
          width: 34,
          height: 33,
          imagePath: iconPath,
        ),
        const SizedBox(height: 10),
        Expanded(
          child: Text(
            label,
            style: context.captionLight,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
