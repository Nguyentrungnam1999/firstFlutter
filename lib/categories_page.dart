import 'package:flutter/material.dart';
import 'package:myapp/fake_data.dart';
import 'categories_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 3 / 2,
      children:
          FAKE_CATEGORIES.map((e) => CatagoriesItem(category: e)).toList(),
    );
  }
}
