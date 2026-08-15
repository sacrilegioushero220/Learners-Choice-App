import 'package:equatable/equatable.dart';
import 'package:learners_choice_app/model/qn_a/qn_a.dart';
import 'package:learners_choice_app/model/quiz_question.dart';

abstract class QuizState extends Equatable {
  @override
  List<Object> get props => [];
}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<QuizQuestion> quizQuestions;

  QuizLoaded({required this.quizQuestions});

  @override
  List<Object> get props => [quizQuestions];
}

class QuizError extends QuizState {
  final String message;

  QuizError({required this.message});

  @override
  List<Object> get props => [message];
}

class QnALoaded extends QuizState {
  final List<QnA> qnAs;

  QnALoaded({required this.qnAs});

  @override
  List<Object> get props => [qnAs];
}
