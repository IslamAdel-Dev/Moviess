import 'package:collection/collection.dart';

class ProductionCountry {
  final String? iso31661;
  final String? name;

  const ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json['iso_3166_1'] as String?,
      name: json['name'] as String?,
    );
  }
}
