import 'package:flutter/material.dart';
import 'package:plate_pilot/screens/categories_screen.dart';
import 'package:plate_pilot/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _activeIndex = 0;
  String _activeTitle = 'Categories';

  void _selectPage(index) {
    setState(() {
      _activeIndex = index;
      _activeTitle = 'Favourite';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = const CategoriesScreen();
    if (_activeIndex == 1) {
      activeScreen = const Meals(meals: []);
    }
    return Scaffold(
      appBar: AppBar(title: Text(_activeTitle)),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _activeIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          )
        ],
      ),
      body: activeScreen,
    );
  }
}
