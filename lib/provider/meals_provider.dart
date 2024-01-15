import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_management/dummy/dummy_data.dart';


/*
Provider  object is can contain  value
and that can be consumed by any screen or fun
* */
final mealsProvider = Provider( (ref) {
  return dummyMeals;
});