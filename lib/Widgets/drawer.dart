
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filter_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';

class drawer_items extends StatefulWidget {
  const drawer_items({super.key});

  @override
  State<drawer_items> createState() => _drawer_itemsState();
}

class _drawer_itemsState extends State<drawer_items> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 48,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Cooking...',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const tabs_Screen()));
                },
                leading: const Icon(Icons.food_bank),
                title: Text(
                  'Meals',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const filter_Screen()));
                },
                leading: const Icon(Icons.settings),
                title: Text(
                  'Filters',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
