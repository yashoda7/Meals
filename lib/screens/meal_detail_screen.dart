import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key,required this.meal,required this.onToggelFavorite});
  final Meal meal;
  final void Function(Meal meal) onToggelFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: (){
              onToggelFavorite(meal);
            },
             icon: Icon(Icons.favorite)),
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