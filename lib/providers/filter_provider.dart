import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/meals_provider.dart';

enum Filter {
  isGlutenFree,
  isLactoseFree,
  isVegan,
  isVegetarian,
}

class FilterNotifaier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifaier()
      : super({
          Filter.isGlutenFree: false,
          Filter.isLactoseFree: false,
          Filter.isVegan: false,
          Filter.isVegetarian: false,
        });
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isActiv) {
    state = {...state, filter: isActiv};
  }
}

final filtersProvider =
    StateNotifierProvider<FilterNotifaier, Map<Filter, bool>>(
  (ref) {
    return FilterNotifaier();
  },
);

final filteredMealsProvider = Provider((ref) {
  final activeFilters = ref.watch(filtersProvider);
  var dummyData = ref.watch(mealsProvider);
  return dummyData.where((meal) {
    if (activeFilters[Filter.isGlutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.isLactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.isVegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.isVegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
