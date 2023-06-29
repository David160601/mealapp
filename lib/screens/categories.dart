import 'package:flutter/material.dart';
import 'package:mealapp/dummies/data.dart';
import 'package:mealapp/widgets/app_bar.dart';
import 'package:mealapp/widgets/categories_item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: const CustomAppBar(title: "Categories"),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (var item in availableCategories)
              categoriesItem(
                category: item,
              )
          ],
        ),
      ),
    ));
  }
}
