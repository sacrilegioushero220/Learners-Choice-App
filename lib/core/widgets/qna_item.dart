import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

class QnaItem extends StatelessWidget {
  const QnaItem({
    super.key,
    required this.answer,
    required this.imagePath,
    required this.question,
    required this.number,
  });

  final String answer;
  final String imagePath;
  final String question;
  final int number;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          QuestionCard(
            question: "Q$number: $question",
            image: imagePath,
          ),
          const SizedBox(
            height: 8,
          ),
          OptionCard(
            optionDescription: answer,
            optionNumber: "Ans:",
            onTap: () {},
            leadingFontSize: 18,
            trailingFontSize: 18,
          ),
        ],
      ),
    );
  }
}
