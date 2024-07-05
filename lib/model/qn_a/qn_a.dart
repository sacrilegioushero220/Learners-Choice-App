import 'dart:convert';

import 'package:equatable/equatable.dart';

class QnA extends Equatable {
  final String? question;
  final String? answer;
  final String? imageUrl;

  const QnA({this.question, this.answer, this.imageUrl});

  factory QnA.fromMap(Map<String, dynamic> data) => QnA(
        question: data['question']?.toString(),
        answer: data['answer']?.toString(),
        imageUrl: data['imageUrl']?.toString(),
      );

  Map<String, dynamic> toMap() => {
        if (question != null) 'question': question,
        if (answer != null) 'answer': answer,
        if (imageUrl != null) 'imageUrl': imageUrl,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [QnA].
  factory QnA.fromJson(String data) {
    return QnA.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [QnA] to a JSON string.
  String toJson() => json.encode(toMap());

  QnA copyWith({
    String? question,
    String? answer,
    String? imageUrl,
  }) {
    return QnA(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object?> get props => [question, answer, imageUrl];
}
