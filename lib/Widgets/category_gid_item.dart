import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy_data%20(1).dart';
import 'package:meal_app/screens/meals_screen.dart';
import '../models/Category_class.dart';
import '../models/Meal_class.dart';

class Style_Show_Category extends StatelessWidget {
  const Style_Show_Category({super.key, required this.category, required this.toggle_meal_fav});
  final Category category;
  final void Function(Meal meal) toggle_meal_fav;
  @override
  Widget build(BuildContext context) {
    final filteredList = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Meals_Screen(
                      title: category.title,
                      meals: filteredList, toggle_meal_fav: toggle_meal_fav,
                    )));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                colors: [
                  category.color.withOpacity(0.90),
                  category.color.withOpacity(0.50),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
          )),
    );
  }
}
