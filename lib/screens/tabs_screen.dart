import 'dart:ffi';
import 'package:meal/models/meal.dart';
import 'package:flutter/material.dart';
import 'package:meal/screens/categorios_screen.dart';
import 'package:meal/screens/filters_screen.dart';
import 'package:meal/screens/meals_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Meal> _favMeals = [];
  void _toggleMealFavStatus(Meal meal) {
    bool isFav = _favMeals.contains(meal);
    if (isFav) {
      setState(() {
        _favMeals.remove(meal);
      });
      showMessage('meal is deleted form Favorits list');
    } else {
      setState(() {
        _favMeals.add(meal);
      });
      showMessage('meal is added to Favorits list');
    }
  }

  void _setScreen(String identifier) {
    if (identifier == 'meals') {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  var _selectedScreenIndex = 0;

  Void? _changeScreen(int index) {
    setState(() => _selectedScreenIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    var activeScreenTitle = 'Pick your category';
    Widget activeScreen = CategoriosScreen(
      onToggelFav: _toggleMealFavStatus,
    );
    if (_selectedScreenIndex == 1) {
      activeScreenTitle = 'Favorits';
      activeScreen = MealsScreen(
        meals: _favMeals,
        onToggelFav: _toggleMealFavStatus,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorits'),
        ],
        currentIndex: _selectedScreenIndex,
        onTap: _changeScreen,
      ),
    );
  }
}
