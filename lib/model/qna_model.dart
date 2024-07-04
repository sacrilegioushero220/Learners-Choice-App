class QnA {
  final String question;
  final String answer;
  final String imageUrl;

  QnA({
    required this.question,
    required this.answer,
    required this.imageUrl,
  });

  factory QnA.fromJson(Map<String, dynamic> json) {
    return QnA(
      question: json['question'],
      answer: json['answer'],
      imageUrl: json['imageUrl'],
    );
  }
}
