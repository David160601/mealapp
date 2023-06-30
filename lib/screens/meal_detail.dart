import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/providers/meal_provider.dart';

class MealDetail extends ConsumerStatefulWidget {
  final Meal meal;

  MealDetail({super.key, required this.meal});

  @override
  ConsumerState<MealDetail> createState() => _MealDetailState();
}

class _MealDetailState extends ConsumerState<MealDetail> {
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
                String result = ref
                    .read(mealsProvider.notifier)
                    .addFavoritiesMeal(widget.meal);

                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(result),
                  backgroundColor: Colors.green,
                ));
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
