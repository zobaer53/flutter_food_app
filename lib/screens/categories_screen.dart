
import 'package:flutter/material.dart';
import 'package:meal_management/dummy/dummy_data.dart';
import 'package:meal_management/screens/meals_screen.dart';
import 'package:meal_management/widget/category_grid_item.dart';
import '../model/category.dart';
import '../model/meal.dart';

class CategoriesScreen extends StatefulWidget{
  const CategoriesScreen({super.key, required this.availableMeal});

  final  List<Meal> availableMeal;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

/* explicit animation setup
* manually control animation state
* more control but complex*/
class _CategoriesScreenState extends State<CategoriesScreen> with SingleTickerProviderStateMixin{
 late  AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,
    duration: Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );

    _animationController.forward();
  }


 @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
//
  } // navigation with the selected item
  void _selectCategory(BuildContext context, Category category){
    final filteredMeals = widget.availableMeal.where((meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context,MaterialPageRoute(builder: (ctx) => MealsScreen(meals: filteredMeals, title: category.title))); //keeps screen in backstack
    /*Navigator.pushNamed(context, )*/
  }

  @override
  Widget build(BuildContext context) {
    /*
      GridView comes with normal and performance optimized GridView.builder()
       */
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView(
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
      ),
      builder: (ctx,child) => SlideTransition(
        position: Tween(
            begin: const Offset(0,0.3) ,
            end: const Offset(0, 0),
          ).animate(
              CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeInOut,
          )
          ),
       child: child,),
      );


  }
}