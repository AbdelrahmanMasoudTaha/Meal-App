import 'package:flutter/material.dart';
import 'package:meal/screens/tabs_screen.dart';
import 'package:meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDrawer(
        onSelectScreen: (identfier) {
          Navigator.of(context).pop();
          if (identfier == 'meals') {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          }
        },
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
