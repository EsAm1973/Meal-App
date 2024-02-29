import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/drawer.dart';
import 'package:meal_app/models/Meal_class.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';

class tabs_Screen extends StatefulWidget {
  const tabs_Screen({super.key});

  @override
  State<tabs_Screen> createState() => _tabs_ScreenState();
}

class _tabs_ScreenState extends State<tabs_Screen> {
  int selected_page_index = 0;
  void selected_Page(int index) {
    setState(() {
      selected_page_index = index;
    });
  }

  List<Meal> Fav_Meals = [];

  Map<filter, bool> selectedFilters = {
    filter.gluten: false,
    filter.vegan: false,
    filter.vegetarian: false,
    filter.lactos: false,
  };

  void info_Message(String message) {
    ScaffoldMessenger.of(context).removeCurrentMaterialBanner();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void toggle_meal_fav(Meal meal) {
    final isFound = Fav_Meals.contains(meal);
    if (isFound) {
      setState(() {
        Fav_Meals.remove(meal);
      });
      info_Message('Meal is no longer in your favorite');
    } else {
      setState(() {
        Fav_Meals.add(meal);
      });
      info_Message('Meal is added in your favorite');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = categories_screen(
      toggle_meal_fav: toggle_meal_fav,
    );
    var activePageTitle = 'Select your category';

    if (selected_page_index == 1) {
      activePage = Meals_Screen(
        meals: Fav_Meals,
        toggle_meal_fav: toggle_meal_fav,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      drawer: const drawer_items(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selected_Page,
        currentIndex: selected_page_index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
    );
  }
}
