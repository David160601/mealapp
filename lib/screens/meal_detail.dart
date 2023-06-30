import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/widgets/app_bar.dart';

class MealDetail extends StatefulWidget {
  final Meal meal;
  MealDetail({super.key, required this.meal});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: widget.meal.title),
      body: SingleChildScrollView(
        child: Column(children: [
          Image(image: NetworkImage(widget.meal.imageUrl)),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Ingredients",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
          ),
          const SizedBox(
            height: 15,
          ),
          for (final item in widget.meal.ingredients)
            Text(
              item,
              style: TextStyle(color: Colors.white),
            ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            "Steps",
            style: TextStyle(color: Colors.orangeAccent, fontSize: 20),
          ),
          for (final item in widget.meal.steps)
            Column(
              children: [
                Text(
                  item,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
        ]),
      ),
    ));
  }
}
