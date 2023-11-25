import 'package:flutter/material.dart';
import 'package:learners_choice_app/core/constants/text.dart';
import 'package:learners_choice_app/core/widgets/mock_test/question_card.dart';
import 'package:learners_choice_app/core/widgets/mock_test/option_card.dart';

class MockTestScreen extends StatelessWidget {
  const MockTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String option =
        "'Ipsum is simply dummy text of the Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's'";
    const String question =
        "' Q1: What is Lorem Ipsum? Why do we use it? Why do we use it? It is a Why do we use it? It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.fact that a reader will be distracted by the readable content of a page when looking at its layout.'";
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  QuestionCard(image: carIconPath, question: question),
                  const SizedBox(
                    height: 10,
                  ),
                  OptionCard(
                    optionDescription: option,
                    optionNumber: "1.",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OptionCard(
                    optionDescription: option,
                    optionNumber: "2.",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OptionCard(
                    optionDescription: option,
                    optionNumber: "3.",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  OptionCard(
                    optionDescription: option,
                    optionNumber: "4.",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(5.0),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
