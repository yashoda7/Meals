import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  MealsScreen({super.key, this.title,required this.meals,required this.ontoggle});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) ontoggle;
  @override
  Widget build(BuildContext context) {
    Widget content=ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx,index) => 
        MealItem(meal: meals[index],toggle: ontoggle,),
        );
    if(meals.isEmpty){
      content=Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
             Text("uh oh ... nothing here!", style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,)),
            const SizedBox(height: 16,),
            Text(" Try selecting differnt category!!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            )
            ,)
          ],
        ),);
    }
    if(title==null){
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content
    );
    
  }
}