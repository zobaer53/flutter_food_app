
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/dummy/dummy_data.dart';
import 'package:meal_management/widget/category_grid_item.dart';

class Categories extends StatelessWidget{
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick your category'),
      ),

      /*
      GridView comes with normal and performance optimized GridView.builder()

       */
      body: GridView(
        padding: EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //controls the layout of gridView,
            childAspectRatio:  3/2,//set num if row col of the grid
            crossAxisSpacing: 20, //space between item horizontallu
            mainAxisSpacing: 20 // space between item vertically
        ),
        children: [

          //get categories from the dummy data with getter method

          for(final category in availableCategories) // alternative availableCategories.map((category) => CategoryGridItem(category: category)).toList()
            CategoryGridItem(category: category),
      ],
      ),
    );
  }
}