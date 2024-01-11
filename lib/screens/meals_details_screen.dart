import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:meal_management/model/meal.dart';

class MealsDetailsScreen extends StatefulWidget {
   const MealsDetailsScreen({super.key, required this.meal, required this.addFavouriteMeal});

  final Meal meal;
  final Function(Meal meal) addFavouriteMeal;

  @override
  State<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends State<MealsDetailsScreen> {
   bool favouriteAdded = false;

  @override
  Widget build(BuildContext context) {

    var favAddedToastMessage = 'Added To Favourite';
    var favRemovedToastMessage = 'Removed from favourite';

    return Scaffold(
      appBar: AppBar(title: Text(widget.meal.title),actions: [

        IconButton(onPressed: (){
          favouriteAdded = !favouriteAdded ;
          widget.addFavouriteMeal(widget.meal);
            showToast(
              favouriteAdded? favAddedToastMessage: favRemovedToastMessage,
              context: context,
              axis: Axis.horizontal,
              alignment: Alignment.center,
              position: StyledToastPosition.bottom,
              borderRadius: BorderRadius.zero,
              toastHorizontalMargin: 0,
              fullWidth: true,
            );
            setState(() {

            });
        }, icon:favouriteAdded?const Icon(Icons.star,color: Colors.yellow,):const Icon(Icons.star))],
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                Image.network(
                  widget.meal.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),],
            ),
            const SizedBox(height: 14,),
            Text('Ingredients', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .primary,
              fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14,),
            for (final ingredient in widget.meal.ingredients) Text(ingredient,style: Theme
                .of(context)
                .textTheme
                .titleMedium!
                .copyWith(
              color: Theme
                  .of(context)
                  .colorScheme
                  .onBackground,)
            ),
            const SizedBox(height: 14,),
            Text('Steps', style: Theme
                .of(context)
                .textTheme
                .titleLarge!
                .copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
                fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 14,),
            for (final ingredient in widget.meal.steps)
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
              ),],
        ),
      ),
    );
  }
}
