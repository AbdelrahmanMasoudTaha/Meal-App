import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/models/meal.dart';

class FavoriteMealsNotifaier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifaier() : super([]);
  bool toggleMealFavStatus(Meal meal) {
    bool isFav = state.contains(meal);
    if (isFav) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
      //showMessage('meal is deleted form Favorits list');
    } else {
      state = [...state, meal];
      return true;

      //showMessage('meal is added to Favorits list');
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifaier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifaier();
  },
);
