import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learners_choice_app/model/quiz_question.dart';
import 'quiz_state.dart';

// class QuizCubit extends Cubit<QuizState> {
//   QuizCubit() : super(QuizInitial());

//   Future<void> fetchQuizQuestions() async {
//     emit(QuizLoading());
//     try {
//       final cacheManager = DefaultCacheManager();
//       const cacheKey = 'quizQuestions';
//       final fileInfo = await cacheManager.getFileFromCache(cacheKey);

//       if (fileInfo != null) {
//         final cachedData = await fileInfo.file.readAsString();
//         List<Map<String, dynamic>> cachedItems =
//             List<Map<String, dynamic>>.from(json.decode(cachedData));
//         List<QuizQuestion> quizQuestions =
//             cachedItems.map((item) => QuizQuestion.fromMap(item)).toList();
//         emit(QuizLoaded(quizQuestions: quizQuestions));
//       } else {
//         final querySnapshot =
//             await FirebaseFirestore.instance.collection('quizQuestions').get();
//         List<QuizQuestion> quizQuestions = querySnapshot.docs
//             .map((doc) => QuizQuestion.fromMap(doc.data()))
//             .toList();

//         List<Map<String, dynamic>> cacheItems =
//             quizQuestions.map((item) => item.toMap()).toList();
//         await cacheManager.putFile(
//           cacheKey,
//           Uint8List.fromList(json.encode(cacheItems).codeUnits),
//           fileExtension: 'json',
//         );

//         emit(QuizLoaded(quizQuestions: quizQuestions));
//       }
//     } catch (error) {
//       emit(QuizError(message: error.toString()));
//     }
//   }
// }
import 'dart:convert';
import 'dart:typed_data';

class QuizCubit extends Cubit<QuizState> {
  final CacheManager cacheManager;
  final String cacheKey = 'quizQuestions';

  QuizCubit(this.cacheManager) : super(QuizInitial());

  Future<void> loadQuizQuestions() async {
    emit(QuizLoading());
    try {
      // Fetch questions from Firebase
      List<QuizQuestion> allQuizQuestions =
          await fetchQuizQuestionsFromFirebase();

      //shuffle all the questions
      allQuizQuestions.shuffle();
      // Cache the questions
      await cacheQuestions(allQuizQuestions);
      //Select only 40 questions
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

  Future<List<QuizQuestion>> fetchQuizQuestionsFromFirebase() async {
    // Simulate fetching data from Firebase
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // Simulated data from Firebase
    List<Map<String, dynamic>> firebaseData = [
      {
        'question':
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type ',
        'options': ['SDK', 'IDE', 'Language', 'Framework'],
        'correctAnswerIndex': 3,
      },
      {
        'question': 'Who developed Dart?',
        'options': ['Google', 'Facebook', 'Microsoft', 'Apple'],
        'correctAnswerIndex': 0,
        'imageUrl': null,
      },
      // Add more dummy questions here
      {
        'question': 'What is the capital of France?',
        'options': ['Paris', 'London', 'Berlin', 'Madrid'],
        'correctAnswerIndex': 0,
        'imageUrl': null,
      },
      {
        'question': 'What is the largest planet in our solar system?',
        'options': ['Jupiter', 'Saturn', 'Earth', 'Mars'],
        'correctAnswerIndex': 0,
        'imageUrl': null,
      },
      // Add 70 more dummy questions
      // Example of adding multiple questions programmatically
      ...List.generate(70, (index) {
        return {
          'question': 'Dummy Question ${index + 1}',
          'options': ['Option 1', 'Option 2', 'Option 3', 'Option 4'],
          'correctAnswerIndex': index % 4, // Just an example, adjust as needed
          'imageUrl': null,
        };
      }),
    ];

    return firebaseData.map((data) => QuizQuestion.fromMap(data)).toList();
  }
}
