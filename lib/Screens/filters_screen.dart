import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

enum Filter {
  vegetarian,
  gluttenFree,
  vegan,
  lactoseFree,
}

class _FilterScreenState extends State<FilterScreen> {
  var gluttenFilter = false;
  var lactoseFilter = false;
  var vegetarianFilter = false;
  var veganFilter = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          // using async because onWillPop accepts future parameters. 
          Navigator.of(context).pop({
            Filter.vegetarian: vegetarianFilter,
            Filter.gluttenFree: gluttenFilter,
            Filter.vegan: veganFilter,
            Filter.lactoseFree: lactoseFilter,
          });
          return false;
          // returning false because we dont want to pop twice as we will manually pop once.
        },
        child: Column(
          children: [
            SwitchListTile(
              value: gluttenFilter,
              onChanged: (onChecked) {
                setState(() {
                  gluttenFilter = onChecked;
                  // onChecked would be a boolean value depending on whether the switch is
                  // toggled or not.
                });
              },
              title: Text(
                'Glutten-Free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              subtitle: Text(
                'Contains only glutten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactoseFilter,
              onChanged: (onChecked) {
                setState(() {
                  lactoseFilter = onChecked;
                  // onChecked would be a boolean value depending on whether the switch is
                  // toggled or not.
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              subtitle: Text(
                'Contains only lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianFilter,
              onChanged: (onChecked) {
                setState(() {
                  vegetarianFilter = onChecked;
                  // onChecked would be a boolean value depending on whether the switch is
                  // toggled or not.
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              subtitle: Text(
                'Contains only Vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFilter,
              onChanged: (onChecked) {
                setState(() {
                  veganFilter = onChecked;
                  // onChecked would be a boolean value depending on whether the switch is
                  // toggled or not.
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              subtitle: Text(
                'Contains only Vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontSize: 15,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
