import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/screens/meals_details_screen.dart';
import 'package:meal_management/widget/meal_item.dart';

import '../model/meal.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    this.addFavouriteMeal,
  });

  //needs meals input to show all list
  final List<Meal> meals;
  final String? title;
  final Function? addFavouriteMeal;

  void selectedCategoryDetails(BuildContext context, Meal meal) {
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => MealsDetailsScreen(meal: meal,addFavouriteMeal: addFavouriteMeal,)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => Container(
              margin: EdgeInsets.all(16),
              child: MealItem(
                meal: meals[index],
                selectedCategoryDetails: selectedCategoryDetails,
              ),
            ));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
            mainAxisSize: MainAxisSize.min, // column stays centered and not unconstrained vertically
            children: [
              Text(
                'Uh oh .... nothing hete!!',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'try selecting different category',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ]),
      );
    }

    /*
    * make display title optional as we are reusing mealsScreen for favourites screen
    * */
    if (title == null) {
      return content;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
