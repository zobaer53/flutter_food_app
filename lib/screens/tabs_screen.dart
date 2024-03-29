import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:meal_management/provider/favourites_provider.dart';
import 'package:meal_management/provider/meals_provider.dart';
import 'package:meal_management/screens/categories_screen.dart';
import 'package:meal_management/screens/filters_screen.dart';
import 'package:meal_management/screens/meals_screen.dart';
import 'package:meal_management/widget/main_drawer.dart';
import '../provider/filters_privider.dart';

const kInitialFilters = {
  Filter.glutenFree : false,
  Filter.lactoseFree : false,
  Filter.vegetarian : false
};

/*
* for statefull widget roverpod provides ConsumerStatefullWidget
* */
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
 ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedPageIndex = 0;

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier){
    Navigator.of(context).pop();
    if (identifier == 'filters') {
        Navigator.push<Map<Filter, bool>>(context, MaterialPageRoute(builder: (ctx) => FiltersScreen()));
        //Get.toNamed('')
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals =  ref.watch( mealsProvider); //read and monitor data

    final activeFilters = ref.watch(filtersProvider);
    final availableMeals = meals.where((element) {
      if(activeFilters[Filter.glutenFree]! && !element.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactoseFree]! && !element.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.vegetarian]! && !element.isVegetarian){
        return false;
      }

      return true;

    }).toList();

    Widget activePage = CategoriesScreen(
      availableMeal: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (selectedPageIndex == 1) {
      final favouriteMeals =  ref.watch( favouriteMealsProvider); //read and monitor data
      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = 'Your Favourites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          selectPage(index);
        },
        currentIndex: selectedPageIndex,
        items: const [
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
