import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Category {
  int id;
  String content;
  Color? color;

  Category({required this.id, required this.content, this.color});

  @override
  String toString() {
    // TODO: implement toString
    return '${content} - ${color}';
  }
}
