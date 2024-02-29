import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/Meal_item.dart';
import 'package:meal_app/models/Meal_class.dart';
import 'package:meal_app/screens/meal_details_screen.dart';

class Meals_Screen extends StatelessWidget {
  const Meals_Screen({super.key, this.title, required this.meals, required this.toggle_meal_fav});

  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) toggle_meal_fav;
  @override
  Widget build(BuildContext context) {
    return title==null?content(context): Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content(context),
    );
  }

  Container content(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: meals
              .map((meal) => Meal_Style_Show(
                    meal: meal,
                    onSelectMeal: (Meal meal) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => meal_Details(meal: meal, onFav: toggle_meal_fav,)));
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
