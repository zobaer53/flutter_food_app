
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/model/meal.dart';
import 'package:meal_management/screens/categories_screen.dart';
import 'package:meal_management/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedPageIndex = 0;
  final List<Meal> favouriteList = []; // Initialize favouriteList here

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

   void addFavouriteMeal(Meal meal) {
    final isExisting = favouriteList.contains(meal);
   if(isExisting == false){
     setState(() {
       favouriteList.add(meal);
     });
   }else{
     setState(() {
       favouriteList.remove(meal);
     });
   }

   log("favlist ids $favouriteList");
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(addFavouriteMeal: addFavouriteMeal,);
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(meals: favouriteList, title: 'Favourites', addFavouriteMeal:  addFavouriteMeal ,);
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectPage(index);
        },
        currentIndex: selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'favourites',
          ),
        ],
      ),
    );
  }
}
