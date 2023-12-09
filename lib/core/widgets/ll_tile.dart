import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/extensions/text_extension.dart';
import 'package:learners_choice_app/Presentation/Intro/presentation/name_screen.dart';
import '../../../../core/widgets/customButtons/custom_round_button.dart';

Widget buildLLTile(BuildContext context) {
  return Container(
      width: 328,
      height: 123,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: ShapeDecoration(
        color: const Color(0xFFFCF1F3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildLLCard(context),
            buildCustomRoundedButton(
              context: context,
              color: const Color(0xFF410002),
              label: "Start",
              onPressed: () {},
            ),
          ],
        ),
      ));
}

Widget buildLLCard(BuildContext context) {
  return Row(
    children: [
      buildImageWidget(
        width: 32,
        height: 32,
        imagePath: lIconPath,
      ),
      const SizedBox(width: 5),
      Text(
        "Learners Test",
        style: context.overlineLight,
      )
    ],
  );
}
