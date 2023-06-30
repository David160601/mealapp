import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/favorites_screen.dart';
import 'package:mealapp/widgets/app_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Meal> _favoriteMeals = [];
  int _selectedIndex = 0;
  void onFavoritesMealToggle(Meal meal) {
    setState(() {
      if (_favoriteMeals.contains(meal)) {
        _favoriteMeals.remove(meal);
      } else {
        _favoriteMeals.add(meal);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_favoriteMeals);
    var _appBarTitle = "Categories";
    Widget _bodyWidget =
        Categories(onFavoritesMealToggle: onFavoritesMealToggle);
    if (_selectedIndex == 0) {
      _appBarTitle = "Categories";
      _bodyWidget = Categories(onFavoritesMealToggle: onFavoritesMealToggle);
    } else {
      _appBarTitle = "Favorites";
      _bodyWidget = Favorites_screen();
    }
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(title: _appBarTitle),
      body: _bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _onItemTapped,
      ),
    ));
  }
}
