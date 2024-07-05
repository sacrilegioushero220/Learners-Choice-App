import 'dart:convert';
import 'package:flutter/services.dart'; // Add this import for rootBundle
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:learners_choice_app/model/qn_a/qn_a.dart';

import 'package:learners_choice_app/model/quiz_question.dart';
import 'quiz_state.dart';

class QuizCubit extends Cubit<QuizState> {
  final CacheManager cacheManager;
  final String cacheKey = 'quizQuestions';

  QuizCubit(this.cacheManager) : super(QuizInitial());

  Future<void> loadQuizQuestions() async {
    emit(QuizLoading());
    try {
      // Fetch questions from Firebase (or in this case, from local JSON file)
      List<QuizQuestion> allQuizQuestions = await fetchQuizQuestionsFromJson();

      // Shuffle all the questions
      allQuizQuestions.shuffle();

      // Cache the questions
      await cacheQuestions(allQuizQuestions);

      // Select only 40 questions
      final List<QuizQuestion> selectedQuestions =
          allQuizQuestions.take(20).toList();

      // Emit the loaded state
      emit(QuizLoaded(quizQuestions: selectedQuestions));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }

  Future<void> cacheQuestions(List<QuizQuestion> quizQuestions) async {
    final cacheItems =
        quizQuestions.map((question) => question.toMap()).toList();
    await cacheManager.putFile(
      cacheKey,
      Uint8List.fromList(json.encode(cacheItems).codeUnits),
      fileExtension: 'json',
    );
  }

  Future<List<QuizQuestion>> fetchQuizQuestionsFromJson() async {
    // Load the JSON file from the assets folder
    final String response = await rootBundle.loadString('assets/output.json');
    List<dynamic> jsonData = json.decode(response);

    // Convert JSON data to a list of QuizQuestion objects
    List<QuizQuestion> quizQuestions =
        jsonData.map((data) => QuizQuestion.fromMap(data)).toList();

    return quizQuestions;
  }

//Fetch QnA Data

  Future<void> fetchQnA() async {
    emit(QuizLoading());
    try {
      // Fetch questions from Firebase (or in this case, from local JSON file)
      List<QnA> allQnA = (await fetchQnAFromJson());

      // Emit the loaded state
      emit(QnALoaded(qnAs: allQnA.toList()));
    } catch (e) {
      emit(QuizError(message: e.toString()));
    }
  }

  Future<void> cacheQnA(List<QnA> qnAs) async {
    final cacheItems = qnAs.map((qnA) => qnA.toMap()).toList();
    await cacheManager.putFile(
      cacheKey,
      Uint8List.fromList(json.encode(cacheItems).codeUnits),
      fileExtension: 'json',
    );
  }

  Future<List<QnA>> fetchQnAFromJson() async {
    // Load the JSON file from the assets folder
    final String response = await rootBundle
        .loadString('assets/filtered_questions_with_images.json');

    List<dynamic> jsonData = json.decode(response);

    // Convert JSON data to a list of qnA objects
    List<QnA> qnA = jsonData.map((data) => QnA.fromMap(data)).toList();

    return qnA;
  }
}
