import 'package:flutter/material.dart';
import 'package:mealapp/dummies/data.dart';
import 'package:mealapp/models/category.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meals.dart';

// ignore: must_be_immutable
class CategoriesItem extends StatefulWidget {
  final Category category;
  const CategoriesItem({super.key, required this.category});

  @override
  State<CategoriesItem> createState() => _CategoriesItemState();
}

class _CategoriesItemState extends State<CategoriesItem> {
  @override
  Widget build(BuildContext context) {
    void onCategoryTap(BuildContext context) {
      List<Meal> meals = dummyMeals.where((element) {
        return element.categories.contains(widget.category.id);
      }).toList();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Meals(
                  categoryTitle: widget.category.title,
                  meals: meals,
                )),
      );
    }

    return InkWell(
      onTap: () {
        onCategoryTap(context);
      },
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.category.color.withOpacity(0.9)),
        child: Text(
          softWrap: true,
          widget.category.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
