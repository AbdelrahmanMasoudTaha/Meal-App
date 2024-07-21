import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal/providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          custumSwitch(
            context,
            "Gluten-Free",
            "Only include Gluten-Free meals",
            activeFilters[Filter.isGlutenFree],
            (bool val) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.isGlutenFree, val);
            },
          ),
          custumSwitch(
            context,
            "Lactose-Free",
            "Only include Lactose-Free meals",
            activeFilters[Filter.isLactoseFree],
            (bool val) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.isLactoseFree, val);
            },
          ),
          custumSwitch(
            context,
            "Vegan",
            "Only include Vegan meals",
            activeFilters[Filter.isVegan],
            (bool val) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.isVegan, val);
            },
          ),
          custumSwitch(
            context,
            "Vegetarian",
            "Only include Vegetarian meals",
            activeFilters[Filter.isVegetarian],
            (bool val) {
              ref
                  .watch(filtersProvider.notifier)
                  .setFilter(Filter.isVegetarian, val);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile custumSwitch(BuildContext context, title, subtitle, value,
      void Function(bool) onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
      ),
      contentPadding: const EdgeInsets.only(left: 40, right: 25),
      activeColor: Theme.of(context).colorScheme.tertiary,
      value: value,
      onChanged: onChanged,
    );
  }
}
