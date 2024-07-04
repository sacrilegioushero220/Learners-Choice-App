import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_state.dart';
import 'package:learners_choice_app/core/widgets/customButtons/custom_round_button.dart';
import 'package:learners_choice_app/core/widgets/mock_test/question_card.dart';
import 'package:learners_choice_app/core/widgets/mock_test/option_card.dart';
import 'package:learners_choice_app/core/widgets/mock_test/timer_count_down.dart';

class MockTestScreen extends StatelessWidget {
  const MockTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              QuizCubit(DefaultCacheManager())..loadQuizQuestions(),
          child: const MockTestBody(),
        ),
      ),
    );
  }
}

class MockTestBody extends StatefulWidget {
  const MockTestBody({Key? key}) : super(key: key);

  @override
  _MockTestBodyState createState() => _MockTestBodyState();
}

class _MockTestBodyState extends State<MockTestBody> {
  int currentQuestionIndex = 0;
  int score = 0;
  Timer? _timer;
  int _remainingTime = 30;
  int? selectedOptionIndex; // Track the selected option

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _remainingTime = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _nextQuestion();
        }
      });
    });
  }

  void _nextQuestion() {
    _timer?.cancel();

    if (context.read<QuizCubit>().state is QuizLoaded) {
      final quizQuestions =
          (context.read<QuizCubit>().state as QuizLoaded).quizQuestions;

      if (selectedOptionIndex != null &&
          selectedOptionIndex ==
              quizQuestions[currentQuestionIndex].correctAnswerIndex) {
        score++;
      }

      setState(() {
        if (currentQuestionIndex < quizQuestions.length - 1) {
          currentQuestionIndex++;
          selectedOptionIndex = null; // Reset selected option for next question
          _startTimer();
        } else {
          _showResultDialog(quizQuestions.length);
        }
      });
    }
  }

  void _showResultDialog(int totalQuestions) {
    final isPassed = score >= 12;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isPassed ? 'Congratulations' : 'Try Again',
              style: const TextStyle(color: Colors.black)),
          content: Text(
              'You scored $score/$totalQuestions. You ${isPassed ? 'passed' : 'failed'} the test.',
              style: const TextStyle(color: Colors.black)),
          actions: <Widget>[
            TextButton(
              child: const Text('Repeat Test'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  currentQuestionIndex = 0;
                  score = 0;
                  _startTimer();
                });
              },
            ),
            TextButton(
              child: const Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizCubit, QuizState>(
      builder: (context, state) {
        if (state is QuizLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is QuizLoaded) {
          final question = state.quizQuestions[currentQuestionIndex];
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [
                      QuestionCard(
                        image: question.imageUrl ?? "",
                        question:
                            "Q${currentQuestionIndex + 1}. ${question.question}",
                      ),
                      const SizedBox(height: 10),
                      ...List.generate(question.options.length, (index) {
                        return Column(
                          children: [
                            OptionCard(
                              optionDescription: question.options[index],
                              optionNumber: "${index + 1}.",
                              isSelected: selectedOptionIndex ==
                                  index, // Highlight selected option
                              onTap: () {
                                setState(() {
                                  selectedOptionIndex = index;
                                });
                              },
                            ),
                            const SizedBox(height: 5),
                          ],
                        );
                      }),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  height: 60,
                  color: Colors.white,
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BuildCustomRoundedButton(
                        color: Colors.red,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        label: "End",
                      ),
                      CountDownTimer(timeRemaining: _remainingTime),
                      BuildCustomRoundedButton(
                        color: Colors.blue,
                        onPressed: selectedOptionIndex != null
                            ? _nextQuestion // Only proceed if an option is selected
                            : () {},
                        label: "Submit",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is QuizError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Press the button to load quiz.'));
        }
      },
    );
  }
}
