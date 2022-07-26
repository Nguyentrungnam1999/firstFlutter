import 'dart:math';

import 'package:flutter/material.dart';
import 'category.dart';

class Food {
  late int id;
  String name;
  String urlImage;
  Duration duration;
  Complexity? complexity;

  List<String>? ingredients = <String>[];
  int? categoryId;
  Food({
    required this.name,
    required this.urlImage,
    required this.duration,
    this.complexity,
    this.categoryId,
    this.ingredients,
  }) {
    this.id = Random().nextInt(1000);
  }
}

enum Complexity {
  Simple,
  Medium,
  Hard,
}
