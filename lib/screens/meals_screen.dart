import 'package:flutter/material.dart';
import 'package:meal/models/meal.dart';
import 'package:meal/screens/meal_details_screen.dart';
import 'package:meal/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });
  final String? title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: content(context),
          );
  }

  SingleChildScrollView content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map((meal) => MealItem(
                  meal: meal,
                  onSelectedMeal: (Meal meal) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => MealDetailsScreen(
                          meal: meal,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
    );
  }
}
