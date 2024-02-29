import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/Meal_class.dart';

class FavoriteMealNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealNotifier() : super([]);
  void toggle_meal_fav(Meal meal) {
    final isFound = state.contains(meal);
    if (isFound) {
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favMealProvider = StateNotifierProvider<FavoriteMealNotifier, List<Meal>>(
    (ref) => FavoriteMealNotifier());
