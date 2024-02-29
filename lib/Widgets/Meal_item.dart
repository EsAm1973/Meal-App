import 'package:flutter/material.dart';
import 'package:meal_app/models/Meal_class.dart';
import 'package:transparent_image/transparent_image.dart';

// ignore: camel_case_types
class Meal_Style_Show extends StatelessWidget {
  const Meal_Style_Show({super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;

  final void Function(Meal meal) onSelectMeal;

  // ignore: non_constant_identifier_names
  String get CompliexText {
    switch (meal.complexity) {
      case Complexity.simple:
        return 'Simple';
      case Complexity.challenging:
        return 'Challenging';
      case Complexity.hard:
        return 'Hard';
      default:
        return 'UnKnown';
    }
  }

  String get AffordText {
    switch (meal.affordability) {
      case Affordability.affordable:
        return 'Affordable';
      case Affordability.luxurious:
        return 'Luxurious';
      case Affordability.pricey:
        return 'Pricey';
      default:
        return 'UnKnown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: ()=>onSelectMeal(meal),
        child: Stack(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.timer),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  (meal.duration).toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'min',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.work),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  CompliexText,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(Icons.monetization_on),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  AffordText,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
