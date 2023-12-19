import 'package:flutter/material.dart';
import 'package:plate_pilot/models/meal.dart';
import 'package:plate_pilot/screens/categories.dart';
import 'package:plate_pilot/screens/filters_screen.dart';

import 'package:plate_pilot/screens/meals.dart';
import 'package:plate_pilot/widgets/main_drawer.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _activeIndex = 0;
  String _activeTitle = 'Categories';
  bool isFavourite = false;
  final List<Meal> _favoutiteMeals = [];

  void _selectPage(index) {
    setState(() {
      _activeIndex = index;
      _activeTitle = 'Favourite';
    });
  }

  void _toggleMealFavoutiteState(Meal meal) {
    final isExisting = _favoutiteMeals.contains(meal);

    if (isExisting) {
      setState(() {
        _favoutiteMeals.remove(meal);
        toggleMealSnackBar('removed');
      });
    } else {
      setState(() {
        _favoutiteMeals.add(meal);
        toggleMealSnackBar('added');
      });
    }
  }

  void toggleMealSnackBar(String title) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        content: Text(title),
      ),
    );
  }

  void selectDrawerScreen(String identifier) {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Filters(),
        ),
      );
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = CategoriesScreen(
      onToggleFavoutiteMeal: _toggleMealFavoutiteState,
    );
    if (_activeIndex == 1) {
      activeScreen = Meals(
        meals: _favoutiteMeals,
        onToggleFavoutiteMeal: _toggleMealFavoutiteState,
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text(_activeTitle)),
      drawer: MainDrawer(
        onSelectScreen: selectDrawerScreen,
      ),
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
