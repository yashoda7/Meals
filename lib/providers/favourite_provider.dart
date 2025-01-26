import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/providers/fliters_provider.dart';
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



final filterMealProvider=Provider((ref){
  final meals=ref.read(mealProvider);
  final map=ref.watch(fliterProvider);
  return meals.where((meal) {
        if(map[Filter.glutenFree]! && !meal.isGlutenFree){
          return false;
        }
         if(map[Filter.lactousFree]! && !meal.isLactoseFree){
          return false;
        }
         if(map[Filter.vegan]! && !meal.isVegan){
          return false;
        }
         if(map[Filter.vegetarian]! && !meal.isVegetarian){
          return false;
        }
          return true;
    }).toList();
});