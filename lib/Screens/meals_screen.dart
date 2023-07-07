import 'package:flutter/material.dart';
import 'package:meals_app/Screens/meal_details_screen.dart';
import 'package:meals_app/Widgets/meals_item.dart';
import 'package:meals_app/classes/meals_class.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, this.title,required this.onStarPressed});
  final List<Meal> meals;
  final String? title;
  final Function(Meal meal) onStarPressed;
  void onSelectMeal(context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(meal: meal,onStarPressed: onStarPressed),
      ),
    );
  }

  Widget mainContent(context) {
    if (meals.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh! Nothere to see here...',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 20),
            Text(
              'Try other categories maybe?',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
          ],
        ),
      );
    } else {
      return ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealsItem(
          onSelectMeal: (meal, context) {
            onSelectMeal(context, meal);
          },
          meal: meals[index],
        ),
      );
    }
  }

  @override
  Widget build(context) {
    if (title == null) {
      return mainContent(context);
    }
    // if title is null that will imply that user has clicked on favourites icon where we wont need 
    // addiotional Scaffold with a title as there is already one implemented in favourites screen.
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: mainContent(context),
    );
  }
}
