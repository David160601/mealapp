import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories.dart';
import 'package:mealapp/screens/favorites_screen.dart';
import 'package:mealapp/widgets/app_bar.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  var _appBarTitle = "Categories";
  Widget _bodyWidget = Categories();
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        _appBarTitle = "Categories";
        _bodyWidget = Categories();
      } else {
        _appBarTitle = "Favorites";
        _bodyWidget = Favorites_screen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
