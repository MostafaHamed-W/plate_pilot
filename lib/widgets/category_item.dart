import 'package:flutter/material.dart';
import 'package:plate_pilot/data/dummy_data.dart';
import 'package:plate_pilot/models/category.dart';
import 'package:plate_pilot/models/meal.dart';
import 'package:plate_pilot/screens/meals_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
  });

  final void Function()? onSelectCategory;

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      borderRadius: BorderRadius.circular(15),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          ),
        ),
      ),
    );
  }
}
