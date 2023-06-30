import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/favorites_screen.dart';
import 'package:mealapp/widgets/app_bar.dart';
import 'package:mealapp/widgets/main_drawer.dart';

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
        _showSnackbar("Favorite meal remove", Colors.red);
      } else {
        _favoriteMeals.add(meal);
        _showSnackbar("Meal added to favorites", Colors.green);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showSnackbar(String message, Color color) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: color,
    ));
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
      _bodyWidget = Favorites_screen(
        onFavoritesMealToggle: onFavoritesMealToggle,
        favoritesMeal: this._favoriteMeals,
      );
    }
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(title: _appBarTitle),
      body: _bodyWidget,
      drawer: MainDrawer(),
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
