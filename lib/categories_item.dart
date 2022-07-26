import 'package:flutter/material.dart';
import 'package:myapp/categories_detail.dart';
import 'package:myapp/model/category.dart';

class CatagoriesItem extends StatelessWidget {
  Category category;
  CatagoriesItem({required this.category});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          print(this.category.content);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CategoriesDetail(category: this.category)));
        },
        splashColor: Colors.amber,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.category.content,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: this.category.color,
              borderRadius: BorderRadius.circular(20)),
        ));
  }
}
