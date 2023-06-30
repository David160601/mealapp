import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/meals_item.dart';

class Favorites_screen extends StatelessWidget {
  List<Meal> favoritesMeal = [];

  Favorites_screen({
    super.key,
    required this.favoritesMeal,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: favoritesMeal.length,
        itemBuilder: (context, index) {
          return MealItem(
            meal: favoritesMeal[index],
          );
        });
  }
}
