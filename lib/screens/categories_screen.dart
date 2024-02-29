import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/category_gid_item.dart';

import '../data/dummy_data (1).dart';
import '../models/Meal_class.dart';

class categories_screen extends StatelessWidget {
  const categories_screen({super.key, required this.toggle_meal_fav});
  final void Function(Meal meal) toggle_meal_fav;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final category in availableCategories)
            Style_Show_Category(
              category: category,
              toggle_meal_fav: toggle_meal_fav,
            ),
        ],
      ),
    );
  }
}
