import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../screens/meals_screen.dart';

import '../models/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.onToggelFav,
      required this.avilableMeals});
  final Category category;
  final Function(Meal meal) onToggelFav;
  final List<Meal> avilableMeals;
  @override
  Widget build(BuildContext context) {
    final List<Meal> felteerdData = avilableMeals
        .where(
          (e) => e.categories.contains(category.id),
        )
        .toList();
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => MealsScreen(
              title: category.title,
              meals: felteerdData,
              onToggelFav: onToggelFav,
            ),
          ),
        );
      },
      splashColor: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.50),
                category.color.withOpacity(0.90),
              ],
              end: Alignment.bottomLeft,
              begin: Alignment.topRight,
            )),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}
