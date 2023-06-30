import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/providers/meal_provider.dart';
import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/favorites_screen.dart';
import 'package:mealapp/screens/setting_screeb.dart';
import 'package:mealapp/widgets/app_bar.dart';
import 'package:mealapp/widgets/main_drawer.dart';

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeFilterScreen(String screenName) {
    Navigator.pop(context);
    if (screenName == "setting") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SettingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Meal> favorites = ref.watch(mealsProvider);
    var appBarTitle = "Categories";
    Widget bodyWidget = Categories();
    if (_selectedIndex == 0) {
      appBarTitle = "Categories";
      bodyWidget = Categories();
    } else {
      appBarTitle = "Favorites";
      bodyWidget = Favorites_screen(
        favoritesMeal: favorites,
      );
    }
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: appBarTitle),
      body: bodyWidget,
      drawer: MainDrawer(
        changeFilterScreen: _changeFilterScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        onTap: _onItemTapped,
      ),
    ));
  }
}
