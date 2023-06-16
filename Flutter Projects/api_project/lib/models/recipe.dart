import 'package:flutter/foundation.dart';

class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Recipe(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
      name: json['name'] as String? ?? '',
      images:
          json['images'] != null && json['images'][0]['hostedLargeUrl'] != null
              ? json['images'][0]['hostedLargeUrl'] as String
              : '',
      rating: json['rating'] != null ? json['rating'] as double : 0.0,
      totalTime: json['totalTime'] as String? ?? '',
    );
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    try {
      return snapshot
          .where((data) => data != null && data is Map<dynamic, dynamic>)
          .map((data) => Recipe.fromJson(data))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('Error converting snapshot to Recipe list: $e');
      }
      return [];
    }
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
