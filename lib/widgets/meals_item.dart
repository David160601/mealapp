import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meal_detail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  MealItem({
    super.key,
    required this.meal,
  });

  void _onMealTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MealDetail(
                meal: meal,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _onMealTap(context);
        },
        splashColor: Colors.white,
        child: Stack(
          children: [
            FadeInImage(
                height: 200,
                fit: BoxFit.cover,
                width: double.maxFinite,
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(color: Colors.black54),
                  height: 80,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(children: [
                    Text(
                      meal.title,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(children: [
                          const Icon(
                            Icons.schedule,
                            color: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${meal.duration.toString()} min",
                            style: const TextStyle(color: Colors.white),
                          )
                        ]),
                        const SizedBox(
                          width: 10,
                        ),
                        const Row(children: [
                          Icon(
                            Icons.shopping_bag,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Simple",
                            style: TextStyle(color: Colors.white),
                          )
                        ]),
                        const SizedBox(
                          width: 10,
                        ),
                        const Row(children: [
                          Icon(
                            Icons.money,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Affordable",
                            style: TextStyle(color: Colors.white),
                          )
                        ])
                      ],
                    )
                  ]),
                ))
          ],
        ));
  }
}
