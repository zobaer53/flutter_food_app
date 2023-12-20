import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_management/model/category.dart';

//show the items in the category grid
class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({super.key, required this.category});

  //need external data to show the category information
  final Category category;

  @override
  Widget build(BuildContext context) {
 /*   // making a widget tappable or GestureDetector can also be used
 * inkwell gives visual feed back
 * */
    return InkWell(
      onTap: (){

      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
          category.color.withOpacity(0.55),
          category.color.withOpacity(0.9),
        ], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}
