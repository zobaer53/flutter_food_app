import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:meal_management/model/meal.dart';
import 'package:meal_management/provider/favourites_provider.dart';

class MealsDetailsScreen extends ConsumerStatefulWidget {
   const MealsDetailsScreen({super.key, required this.meal});

  final Meal meal;

  @override
  ConsumerState<MealsDetailsScreen> createState() => _MealsDetailsScreenState();
}

class _MealsDetailsScreenState extends ConsumerState<MealsDetailsScreen> {


  @override
  Widget build(BuildContext context) {
    var favListProvider = ref.read(favouriteMealsProvider.notifier); // use read when accessing for click event
    bool wasAdded = false;
    return Scaffold(
      appBar: AppBar(title: Text(widget.meal.title),actions: [

        IconButton(onPressed: (){
          wasAdded = favListProvider.toggleMealFavouriteStatus(widget.meal);
          showToast(
            wasAdded?"Added to fav" :"Removed from fav",
            context: context,
            axis: Axis.horizontal,
            alignment: Alignment.center,
            position: StyledToastPosition.bottom,
            borderRadius: BorderRadius.zero,
            toastHorizontalMargin: 0,
            fullWidth: true,
          );
        }, icon:wasAdded?const Icon(Icons.star,color: Colors.yellow,):const Icon(Icons.star))],
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
