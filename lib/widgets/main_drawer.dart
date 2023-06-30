import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.fastfood,
                  color: Colors.white,
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking up!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.deepOrange),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              child: Column(children: [
                ListTile(
                  onTap: () {},
                  title: Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Meals",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
