import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/providers/favourite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key,required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final favourite=ref.watch(favouriteMealsProvider);
    final isliked=favourite.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              // onToggelFavorite(meal);
              bool val=ref.read(favouriteMealsProvider.notifier).toggleMealFavouriteStatus(meal);
              if(val) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Marked as favourite")
                  ),
                );  
              }
              else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Meal is no longer a favourite")
                  ),
                );  
              }

            },
             icon:(isliked) ? Icon(Icons.star):Icon(Icons.star_border),
          ),
        ],
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
          meal.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
          height: 300,),
          const SizedBox(height: 14,),
           Text("Ingredients",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
           ),
           ),
           const SizedBox(height: 14,),
           for(final ingredients in meal.ingredients)
              Text(ingredients,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.onBackground),),
          const SizedBox(height: 14,),
           Text("steps",style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
           ),
           ),
           const SizedBox(height: 14,),
           for(final ingredients in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                child: Text(ingredients,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),),
              ),
          ],
        ),
      )

    );
  }
}