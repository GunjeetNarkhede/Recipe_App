import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/classes/meals_class.dart';
import 'package:meals_app/Widgets/drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends State<TabsScreen> {
  int _screenIndex = 0;
  final List<Meal> _favouriteMeals = [];
  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void _addToFavourites(Meal meal) {
    final checkFavourite = _favouriteMeals.contains(meal);
    if (checkFavourite) {
      // setState(() {
      _favouriteMeals.remove(meal);
      // showInfoMessage('Meal added to favourites');
      // });
    } else {
      // setState(() {
      _favouriteMeals.add(meal);
      // showInfoMessage('Meal removed from favourites');
      // });
    }
  }

// defining the function for adding or removing the current selected meal from favourites when the
// star icon is pressed.
  void onPressed(int index) {
    setState(() {
      _screenIndex = index;
    });
  }
// defining the function that will change the screen index whenever the icons on bottom bar are tapped

  void setScreen(String identifier) async {
    if (identifier == 'Filters') {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CategoryGrid(
      onStarPressed: _addToFavourites,
    );
    var currentTitle = 'Categories';
    if (_screenIndex == 1) {
      // it will be 1 because onTap will change the _screenIndex from 0 to 1 as there are 2 icons in
      // BottomNavigationBar
      currentScreen =
          MealsScreen(meals: _favouriteMeals, onStarPressed: _addToFavourites);
      currentTitle = 'Your Favourites';
    } else if (_screenIndex == 0) {
      currentScreen = CategoryGrid(
        onStarPressed: _addToFavourites,
      );
      currentTitle = 'Categories';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(currentTitle),
      ),
      drawer: SideDrawer(onSelectScreen: setScreen),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onPressed,
        currentIndex: _screenIndex,
        // necessary for the highlighting of icons to change as we click them
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.set_meal,
            ),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
