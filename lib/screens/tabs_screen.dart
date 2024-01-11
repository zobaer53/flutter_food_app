
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
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
    var favAddedToastMessage = 'Added To Favourite';
    var favRemovedToastMessage = 'Removed from favourite';
   if(isExisting == false){
     setState(() {
       favouriteList.add(meal);
     });
     showToast(
       favAddedToastMessage,
       context: context,
       axis: Axis.horizontal,
       alignment: Alignment.center,
       position: StyledToastPosition.bottom,
       borderRadius: BorderRadius.zero,
       toastHorizontalMargin: 0,
       fullWidth: true,
     );
   }else{
     setState(() {
       favouriteList.remove(meal);
     });
     showToast(
       favRemovedToastMessage,
       context: context,
       axis: Axis.horizontal,
       alignment: Alignment.center,
       position: StyledToastPosition.bottom,
       borderRadius: BorderRadius.zero,
       toastHorizontalMargin: 0,
       fullWidth: true,
     );
   }

   log("favlist ids $favouriteList");
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage =  CategoriesScreen(addFavouriteMeal: addFavouriteMeal,);
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      activePage = MealsScreen(meals: favouriteList, addFavouriteMeal:  addFavouriteMeal ,);
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
