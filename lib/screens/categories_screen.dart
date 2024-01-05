
import 'package:flutter/material.dart';
import 'package:meal_management/dummy/dummy_data.dart';
import 'package:meal_management/screens/meals_screen.dart';
import 'package:meal_management/widget/category_grid_item.dart';
import '../model/category.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatelessWidget{
  const CategoriesScreen({super.key, required this.addFavouriteMeal});

  final  Function(Meal meal) addFavouriteMeal;

  // navigation with the selected item
  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = dummyMeals.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context,MaterialPageRoute(builder: (ctx) => MealsScreen(meals: filteredMeals, title: category.title, addFavouriteMeal: addFavouriteMeal,))); //keeps screen in backstack
    /*Navigator.pushNamed(context, )*/
  }

  @override
  Widget build(BuildContext context) {
    /*
      GridView comes with normal and performance optimized GridView.builder()

       */
    return  GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //controls the layout of gridView,
            childAspectRatio:  3/2,//set num if row col of the grid
            crossAxisSpacing: 20, //space between item horizontally
            mainAxisSpacing: 20 // space between item vertically
        ),
        children: [

          //get categories from the dummy data with getter method
          for(final category in availableCategories) // alternative availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            CategoryGridItem(category: category,setCategory: (){
              _selectCategory(context,category);
            },),
      ],
      );
  }
}