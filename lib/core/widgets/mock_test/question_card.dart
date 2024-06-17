import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/widgets/build_image_widget.dart';
import 'package:learners_choice_app/presentation/Intro/name_screen.dart';

class QuestionCard extends StatelessWidget {
  final String? image;
  final String question;
  const QuestionCard({super.key, required this.image, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      clipBehavior: Clip.antiAlias,
      decoration: containerDecDefault(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 331,
              child: Text(
                textAlign: TextAlign.justify,
                question,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                  height: 1.6,
                ),
              ),
            ),
            image != null
                ? SizedBox(
                    height: 226,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        right: 60,
                        left: 60,
                      ),
                      child: imageContainerBlack(image ?? "Null"),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

ShapeDecoration containerDecDefault() {
  return ShapeDecoration(
    color: const Color(0xFFFFF8F6),
    shape: RoundedRectangleBorder(
      side: const BorderSide(width: 1, color: Color(0xFFD8C2BC)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

Widget imageContainerBlack(String image) {
  return Container(
    padding: const EdgeInsets.all(10),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      color: const Color(0xFF1F1A1C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      shadows: const [
        BoxShadow(
          color: Color(0x4C000000),
          blurRadius: 2,
          offset: Offset(0, 1),
          spreadRadius: 0,
        ),
        BoxShadow(
          color: Color(0x26000000),
          blurRadius: 3,
          offset: Offset(0, 1),
          spreadRadius: 1,
        )
      ],
    ),
    child: BuildImageWidget(
      width: 154,
      height: 154,
      imagePath: image,
    ),
  );
}
