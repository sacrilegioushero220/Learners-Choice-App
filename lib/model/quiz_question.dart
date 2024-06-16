class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;
  final String? imageUrl;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.imageUrl,
  });

  factory QuizQuestion.fromMap(Map<String, dynamic> map) {
    return QuizQuestion(
      question: map['question'] ?? '',
      options: List<String>.from(map['options']),
      correctAnswerIndex: map['correctAnswerIndex'] as int,
      imageUrl: map['imageUrl'],
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
