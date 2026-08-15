import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';

class BuildAboutDescriptionCard extends StatelessWidget {
  const BuildAboutDescriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 15,
          right: 15,
          bottom: 20,
        ),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFEBE0E2),
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          choiceDescription,
          textAlign: TextAlign.center,
          style: _choiceTextStyle(),
        ),
      ),
    );
  }
}

TextStyle? _choiceTextStyle() {
  return const TextStyle(
    color: Color(0xFF53433F),
    fontSize: 14,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0.25,
  );
}
