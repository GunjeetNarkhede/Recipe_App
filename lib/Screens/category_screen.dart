import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meals_screen.dart';
import 'package:meals_app/Widgets/category_grid_item.dart';
import 'package:meals_app/data/data.dart';
import 'package:meals_app/classes/category_class.dart';
import 'package:meals_app/classes/meals_class.dart';
// this file defines how the initial grid screen will look and function like.

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({super.key,required this.onStarPressed});
  final Function(Meal meal) onStarPressed;
  void onSelectCategory(context, Category category) {
    final filteredMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(category.id),
          // filtering the dummyMeals list on the basis of whether the iterated meal contains the desired
          // category's id.
        )
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          meals: filteredMeals,
          title: category.title,
          onStarPressed: onStarPressed,
        ),
      ),
    );
  }

  @override
  Widget build(context) {
    return GridView(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // this function is used to construct a grid based on predefined number of columns.
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: availableCategories
            .map((category) => CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    onSelectCategory(context, category);
                  },
                ))
            .toList()
        // we didnt add square brackets here because map already offers a fully built list so we dont need to define it
        // in square brackets as that would mean we are defining a list within a list which would cause syntax error.
        );
  }
}
