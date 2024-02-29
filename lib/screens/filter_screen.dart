import 'package:flutter/material.dart';

class filter_Screen extends StatefulWidget {
  const filter_Screen({super.key});

  @override
  State<filter_Screen> createState() => _filter_ScreenState();
}

enum filter {
  gluten,
  lactos,
  vegan,
  vegetarian,
}

class _filter_ScreenState extends State<filter_Screen> {
  bool glutenfree = false;
  bool lactosfree = false;
  bool vegan = false;
  bool vegetarian = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Meals'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            filter.gluten: glutenfree,
            filter.lactos: lactosfree,
            filter.vegan: vegan,
            filter.vegetarian: vegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenfree,
              onChanged: (bool value) {
                setState(() {
                  glutenfree = value;
                });
              },
              title: Text(
                'Gluten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten free meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: lactosfree,
              onChanged: (bool value) {
                setState(() {
                  lactosfree = value;
                });
              },
              title: Text(
                'Lactos-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Lactos free meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (bool value) {
                setState(() {
                  vegan = value;
                });
              },
              title: Text(
                'Vegan meals-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegan meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
            SwitchListTile(
              value: vegetarian,
              onChanged: (bool value) {
                setState(() {
                  vegetarian = value;
                });
              },
              title: Text(
                'Vegetarian meals-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
