import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  void Function(String screenName) changeFilterScreen;
  MainDrawer({super.key, required this.changeFilterScreen});

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
                  size: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Cooking up!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
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
                  onTap: () {
                    changeFilterScreen("meals");
                  },
                  title: const Row(
                    children: [
                      Icon(
                        Icons.restaurant,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Meals",
                      ),
                    ],
                  ),
                ),
                ListTile(
                  onTap: () {
                    changeFilterScreen("setting");
                  },
                  title: const Row(
                    children: [
                      Icon(
                        Icons.settings,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Settings",
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
