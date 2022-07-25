import 'package:flutter/material.dart';

class Transaction {
  String content;
  double price;
  Transaction({this.content = '', this.price = 0.0});
  @override
  String toString() {
    // TODO: implement toString
    return '${content} - ${price}';
  }
}
