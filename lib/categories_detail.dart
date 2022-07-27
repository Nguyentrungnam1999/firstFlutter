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
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    // child: Text('${foods[index].name}'),
                    child: Image.network('${foods[index].urlImage}'),
                  ),
                  Positioned(
                    top: 30,
                    left: 30,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 25,
                          ),
                          Text(
                            '${foods[index].duration.inMinutes} minutes',
                            style: TextStyle(fontSize: 22, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    right: 30,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${foods[index].complexity.toString().split('.').last}',
                            style: TextStyle(fontSize: 22, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    right: 30,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${foods[index].name}',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
