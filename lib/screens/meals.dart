import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/app_bar.dart';
import 'package:mealapp/widgets/meals_item.dart';

class Meals extends StatefulWidget {
  final String categoryTitle;
  List<Meal> meals = [];

  Meals({
    super.key,
    required this.meals,
    required this.categoryTitle,
  });

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  @override
  Widget build(BuildContext context) {
    Widget render;
    if (widget.meals.isEmpty) {
      render = const Center(
        child: Text(
          "There is no meal available !",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      );
    } else {
      render = ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: widget.meals[index],
          );
        },
      );
    }
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: widget.categoryTitle),
      body: render,
    ));
  }
}
