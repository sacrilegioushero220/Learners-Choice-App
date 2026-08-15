import 'dart:convert';

import 'package:equatable/equatable.dart';

class DriverActs extends Equatable {
  final num? number;
  final num? sectionNumber;
  final String? title;
  final String? description;

  const DriverActs({
    this.number,
    this.sectionNumber,
    this.title,
    this.description,
  });

  factory DriverActs.fromMap(Map<String, dynamic> data) => DriverActs(
        number: num.tryParse(data['number'].toString()),
        sectionNumber: num.tryParse(data['sectionNumber'].toString()),
        title: data['title']?.toString(),
        description: data['description']?.toString(),
      );

  Map<String, dynamic> toMap() => {
        if (number != null) 'number': number,
        if (sectionNumber != null) 'sectionNumber': sectionNumber,
        if (title != null) 'title': title,
        if (description != null) 'description': description,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DriverActs].
  factory DriverActs.fromJson(String data) {
    return DriverActs.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DriverActs] to a JSON string.
  String toJson() => json.encode(toMap());

  DriverActs copyWith({
    num? number,
    num? sectionNumber,
    String? title,
    String? description,
  }) {
    return DriverActs(
      number: number ?? this.number,
      sectionNumber: sectionNumber ?? this.sectionNumber,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [number, sectionNumber, title, description];
}
