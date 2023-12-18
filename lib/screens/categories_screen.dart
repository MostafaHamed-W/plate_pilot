import 'package:flutter/material.dart';
import 'package:plate_pilot/data/dummy_data.dart';
import 'package:plate_pilot/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick you category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CategoryItem(category: availableCategories[index]);
          },
        ),
      ),
    );
  }
}
