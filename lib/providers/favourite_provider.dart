import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals.dart';
class FavouriteMealsProvider extends StateNotifier<List<Meal>> {
  FavouriteMealsProvider(): super([]);
  bool toggleMealFavouriteStatus(Meal meal){
    final mealIsFavorite =state.contains(meal);
    if(mealIsFavorite){
      state=state.where((m) => meal.id!=m.id).toList();
      return false;
    }
    else{
      state=[... state,meal];
      return true;
    }
  }
}
final favouriteMealsProvider=StateNotifierProvider<FavouriteMealsProvider,List<Meal>>((ref){
  return FavouriteMealsProvider();
});