import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';

class MealDetail extends StatefulWidget {
  final Meal meal;
  void Function(Meal meal) onFavoritesMealToggle;
  MealDetail(
      {super.key, required this.meal, required this.onFavoritesMealToggle});

  @override
  State<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends State<MealDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          widget.meal.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.onFavoritesMealToggle(widget.meal);
              },
              icon: const Icon(Icons.star))
        ],
      ),
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
              style: const TextStyle(color: Colors.white),
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
                const SizedBox(
                  height: 20,
                )
              ],
            ),
        ]),
      ),
    ));
  }
}
