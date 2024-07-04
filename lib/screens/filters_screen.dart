import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  isGlutenFree,
  isLactoseFree,
  isVegan,
  isVegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isLactoseFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identfier) {
      //     N
      //     if (identfier == 'meals') {
      //       Navigator.of(context).pushReplacement(
      //           MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.isGlutenFree: _isGlutenFree,
            Filter.isLactoseFree: _isLactoseFree,
            Filter.isVegan: _isVegan,
            Filter.isVegetarian: _isVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            custumSwitch(
              context,
              "Gluten-Free",
              "Only include Gluten-Free meals",
              _isGlutenFree,
              (bool val) {
                setState(() {
                  _isGlutenFree = val;
                });
              },
            ),
            custumSwitch(
              context,
              "Lactose-Free",
              "Only include Lactose-Free meals",
              _isLactoseFree,
              (bool val) {
                setState(() {
                  _isLactoseFree = val;
                });
              },
            ),
            custumSwitch(
              context,
              "Vegan",
              "Only include Vegan meals",
              _isVegan,
              (bool val) {
                setState(() {
                  _isVegan = val;
                });
              },
            ),
            custumSwitch(
              context,
              "Vegetarian",
              "Only include Vegetarian meals",
              _isVegetarian,
              (bool val) {
                setState(() {
                  _isVegetarian = val;
                });
              },
            ),
          ],
        ),
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
