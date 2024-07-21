import 'dart:ffi';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:meal/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal/providers/favorite_meals_provider.dart';
import 'package:meal/providers/filter_provider.dart';
import 'package:meal/providers/nav_bar_provider.dart';

import 'package:meal/screens/categorios_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selctedPageIndex = ref.watch(navBarProvider);
    final List<Meal> avilableMeals = ref.watch(filteredMealsProvider);
    var activeScreenTitle = 'Pick your category';
    Widget activeScreen = CategoriosScreen(
      avilableMeals: avilableMeals,
    );
    if (selctedPageIndex == 1) {
      final List<Meal> favMeals = ref.watch(favoriteMealsProvider);
      activeScreenTitle = 'Favorits';
      activeScreen = MealsScreen(
        meals: favMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'filters') {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
          }
        },
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorits'),
        ],
        currentIndex: selctedPageIndex,
        onTap: ref.read(navBarProvider.notifier).setPage,
      ),
    );
  }
}
