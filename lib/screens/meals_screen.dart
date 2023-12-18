import 'package:flutter/material.dart';

class Meals extends StatelessWidget {
  const Meals({super.key, required this.meals, required this.title});

  final List<Meals> meals;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
