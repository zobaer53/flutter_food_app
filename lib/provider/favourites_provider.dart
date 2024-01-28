import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/model/meal.dart';


/*
* SateNotifierProvider needs StateNotifier
* stateNotifier is a gneric class*/
class FavouriteMealsNotifier extends StateNotifier<List<Meal>>{
  FavouriteMealsNotifier(): super([]);

  /*
  * in StateNotifier you can not change existing variable
  * you need to reinitialize
  * so .add() or .remove() is not allowed here
  * */
  bool toggleMealFavouriteStatus(Meal meal){
   final mealIsFavourite = state.contains(meal);
   if(mealIsFavourite){
     state = state.where((element) => element.id != meal.id).toList();
     return false;
   }else{
     state = [...state,meal]; //add existing and add new
     return true;
   }
  }
}
/*
* StateNotifierProvider is optimized for dynamic value
* */
final favouriteMealsProvider = StateNotifierProvider<FavouriteMealsNotifier,List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});

