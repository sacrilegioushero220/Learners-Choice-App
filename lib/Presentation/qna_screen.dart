import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_cubit.dart';
import 'package:learners_choice_app/core/blocs/cubit/quizCubit/quiz_state.dart';
import 'package:learners_choice_app/core/widgets/my_custom_widgets.dart';

class QnaScreen extends StatefulWidget {
  const QnaScreen({super.key, required this.quizCubit});
  final QuizCubit quizCubit;

  @override
  // ignore: library_private_types_in_public_api
  _QnaScreenState createState() => _QnaScreenState();
}

class _QnaScreenState extends State<QnaScreen> {
  @override
  void initState() {
    super.initState();
    widget.quizCubit.fetchQnA();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: BlocBuilder<QuizCubit, QuizState>(
        builder: (context, state) {
          if (state is QuizLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is QnALoaded) {
            return Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
                itemCount: state.qnAs.length,
                itemBuilder: (context, index) {
                  final qnA = state.qnAs[index];
                  return QnaItem(
                    question: qnA.question ?? 'No Question',
                    answer: qnA.answer ?? 'No Answer',
                    imagePath: qnA.imageUrl ?? '',
                    number: index + 1,
                  );
                },
              ),
            );
          } else if (state is QuizError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            BlocProvider.of<QuizCubit>(context).fetchQnA();
            return const Center(
                child: Text(
              'No data available',
              style: TextStyle(color: Colors.black),
            ));
          }
        },
      ),
    );
  }
}
