import 'package:flutter/material.dart';
import 'package:mealapp/models/category.dart';

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
    return InkWell(
      onTap: () {},
      splashColor: Colors.white,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: widget.category.color.withOpacity(0.9)),
        child: Text(
          widget.category.title,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
