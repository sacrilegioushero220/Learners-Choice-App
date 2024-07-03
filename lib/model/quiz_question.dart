class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String imageUrl;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    required this.imageUrl,
  });

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      question: map['question'] as String,
      options: List<String>.from(map['options']),
      correctAnswerIndex: (map['correctAnswerIndex'] is int)
          ? map['correctAnswerIndex'] as int
          : int.tryParse(map['correctAnswerIndex'].toString()) ?? 0,
      imageUrl: map['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'correctAnswerIndex': correctAnswerIndex,
      'imageUrl': imageUrl,
    };
  }
}
