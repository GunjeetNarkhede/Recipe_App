import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/meals_item_characterstic.dart';
import 'package:meals_app/classes/meals_class.dart';
import 'package:transparent_image/transparent_image.dart';
// for using transparent image.

class MealsItem extends StatelessWidget {
  const MealsItem({super.key, required this.meal, required this.onSelectMeal});
  final Meal meal;
  final Function(Meal meal, BuildContext context) onSelectMeal;
  String get mealComplexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get mealAffordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }
  // defining these two getters to use complexity and affordability as strings with first letter in
  // uppercase.

  @override
  Widget build(context) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      // giving the shadow effect to the card.
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      // ensuring that anything beyond the defined circular border and margins in stack widget gets cut off
      child: InkWell(
        // using inkewell to make the card tapable.
        onTap: () {
          onSelectMeal(meal,context);
        },
        child: Stack(
          // using stack widget because we want to stack some elements on top of each other like
          // the meal credentials over meal picture.
          children: [
            FadeInImage(
              // to make sure that the meal image appears in a smooth animation initially rather than
              // just popping up abruptly we use FadeinImage feature.
              image: NetworkImage(meal.imageUrl),
              // the image that we want to display finally.
              placeholder: MemoryImage(kTransparentImage),
              // the image that will be initially displayed, in this case it would be a transparent
              // image which will transition to our final image in animation. we can obtain transparent
              // image using kTransparentImage object and access it through MemoryImage method.
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              // ensuring that the image isnt distorted and fixing the allowed height and width of image to
              // unnecessary abrupt changes in image
            ),
            Positioned(
              // Positioned widget allows to determine how one widget would be stack on the base widget
              // here our container would be stacked evenly from left start to right end on bottom of
              // the image.
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.black54,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                child: Column(children: [
                  Text(
                    meal.title,
                    maxLines: 2,
                    // limiting the title of dish to be less than or equal to two lines
                    overflow: TextOverflow.ellipsis,
                    // using overflow we can make the title end with 3 dots at the end in case it is longer than
                    // two lines.
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MealsItemType(
                        icon: Icons.schedule,
                        label: '${meal.duration} min',
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      MealsItemType(
                        icon: Icons.work,
                        label: mealComplexityText,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      MealsItemType(
                        icon: Icons.attach_money,
                        label: mealAffordabilityText,
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
