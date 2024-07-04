import 'package:flutter/material.dart';
import '../models/meal.dart';
import '/data/dummy_data.dart';
import '/widgets/category_grid_item.dart';

class CategoriosScreen extends StatelessWidget {
  const CategoriosScreen({super.key, required this.onToggelFav});
  final Function(Meal meal) onToggelFav;
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
        children: [
          for (final ele in availableCategories)
            CategoryGridItem(
              category: ele,
              onToggelFav: onToggelFav,
            ),
        ]);
  }
}
