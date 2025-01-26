import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key,required this.availableMeals});
  // final void Function(Meal meal) onToggle;
  final List<Meal> availableMeals;
  void _selectCategory(BuildContext context,Category category){
   final selected_meals= availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Navigator.push(context,route);
    Navigator.of(context).push(
      MaterialPageRoute(builder:(context) =>
      MealsScreen(title: category.title,
       meals: selected_meals,))
    );
  }
  Widget build(BuildContext context){
    return GridView(
        padding: EdgeInsets.all(24),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,),//horizontally
        children: [
          //...availableCategories.map((cat) => CategoryGridItem(category: cat,)).toList(),
          for(var cat in availableCategories)
            CategoryGridItem(category: cat,onSelected:()
            { 
              _selectCategory(context,cat);
              },),
          
        ],
      );
  }

}