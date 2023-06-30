import 'package:flutter/material.dart';
import 'package:mealapp/dummies/data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/categories_item.dart';

class Categories extends StatelessWidget {
  Categories({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          for (var item in availableCategories)
            CategoriesItem(
              category: item,
            )
        ],
      ),
    );
  }
}
