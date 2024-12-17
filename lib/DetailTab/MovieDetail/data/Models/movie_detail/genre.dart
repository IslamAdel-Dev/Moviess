import 'package:collection/collection.dart';

class Genre {
  final int? id;
  final String? name;

  const Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );
}
