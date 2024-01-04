import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
/*
import 'package:fluttertoast/fluttertoast.dart';
*/
import 'package:meal_management/main.dart';
import 'package:meal_management/model/meal.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal, this.addFavouriteMeal});

  final Meal meal;
  final Function? addFavouriteMeal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Image.network(
                  meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
               InkWell(
                 onTap: (){
                   if(addFavouriteMeal != null){
                     addFavouriteMeal!();
                   }

                   showToast(
                     'This is normal',
                     context: context,
                     axis: Axis.horizontal,
                     alignment: Alignment.center,
                     position: StyledToastPosition.bottom,
                     borderRadius: BorderRadius.zero,
                     toastHorizontalMargin: 0,
                     fullWidth: true,
                   );
                 },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Icon(Icons.star),
                 ),
               ),
              ],
            ),
            SizedBox(height: 14,),
            Text('Ingredients', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 14,),
            for (final ingredient in meal.ingredients) Text(ingredient,style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,)
            ),
            SizedBox(height: 14,),
            Text('Steps', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                fontWeight: FontWeight.bold
            ),
            ),
            SizedBox(height: 14,),
            for (final ingredient in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                child: Text(ingredient,
                    textAlign: TextAlign.center,
                    style: Theme
                  .of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onBackground,)
            ),
              ),

          ],
        ),
      ),
    );
  }
}
