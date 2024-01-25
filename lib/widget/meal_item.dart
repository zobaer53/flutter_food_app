import 'package:flutter/material.dart';
import 'package:meal_management/model/meal.dart';
import 'package:meal_management/widget/meal_)tem_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.selectedCategoryDetails});

  final Meal meal;
  final Function selectedCategoryDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      clipBehavior: Clip.hardEdge, // any content out of the shape is cut off
      child: InkWell(
      onTap: () {
        selectedCategoryDetails(context,meal);
      },
        /*Stack widget shows children on top of each other like the relative layout
        also Positioned widget uses like constraint  layout
        * */
      child:Stack(
        children: [
          Hero(
            tag: meal.id,
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(
                  meal.imageUrl
                ),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.black54,
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 44),
              child: Column(
                children: [
                  Text(meal.title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MealItemTrait(iconData: Icons.schedule, label: "${meal.duration} min"), //returns a row but no need to use Expanded
                      MealItemTrait(iconData: Icons.schedule, label: "${meal.complexity.name}"), //returns a row but no need to use Expanded
                      MealItemTrait(iconData: Icons.schedule, label: "${meal.affordability.name}"), //returns a row but no need to use Expanded
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),),);
  }

}