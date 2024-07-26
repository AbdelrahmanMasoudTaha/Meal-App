import 'package:flutter/material.dart';
import '../models/meal.dart';
import '/data/dummy_data.dart';
import '/widgets/category_grid_item.dart';

class CategoriosScreen extends StatefulWidget {
  const CategoriosScreen({super.key, required this.avilableMeals});

  final List<Meal> avilableMeals;

  @override
  State<CategoriosScreen> createState() => _CategoriosScreenState();
}

class _CategoriosScreenState extends State<CategoriosScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      lowerBound: 0,
      upperBound: 1,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) => SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(
            CurvedAnimation(parent: _controller, curve: Curves.elasticOut)),
        child: child,
      ),
      child: GridView(
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
                avilableMeals: widget.avilableMeals,
              ),
          ]),
    );
  }
}
