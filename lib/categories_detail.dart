import 'package:flutter/material.dart';
import 'package:myapp/fake_data.dart';
import 'package:myapp/model/category.dart';
import 'package:myapp/model/food.dart';

class CategoriesDetail extends StatelessWidget {
  Category category;
  CategoriesDetail({required this.category});

  @override
  Widget build(BuildContext context) {
    List<Food> foods = FAKE_FOODS.where(((food) {
      return food.categoryId == this.category.id;
    })).toList();
    return MaterialApp(
      title: 'categories detail',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('food from ${category.content}'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: ((context, index) {
              return Container(
                child: Center(
                  child: Text('${foods[index].name}'),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
