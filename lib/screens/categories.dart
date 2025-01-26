import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/category_grid_item.dart';
import 'package:meals_app/model/category.dart';
import 'package:meals_app/model/meals.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key,required this.availableMeals});
  // final void Function(Meal meal) onToggle;
  final List<Meal> availableMeals;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>  with SingleTickerProviderStateMixin{
  late  AnimationController _animationController;
  void initState(){
    _animationController=AnimationController(
      vsync: this,
      duration:Duration(milliseconds: 400),
      lowerBound: 0,
      upperBound: 1);
      _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  void _selectCategory(BuildContext context,Category category){
   final selected_meals= widget.availableMeals.where((meal) => meal.categories.contains(category.id)).toList();
    // Navigator.push(context,route);
    Navigator.of(context).push(
      MaterialPageRoute(builder:(context) =>
      MealsScreen(title: category.title,
       meals: selected_meals,))
    );
  }
  // _animationController

  Widget build(BuildContext context){
    return AnimatedBuilder(animation: _animationController,
    child:  GridView(
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
      ),
     builder: (cntx,child) => 
      Padding(padding:EdgeInsets.only(top: 100 -_animationController.value*100,
      ),child: child,),
     );
  }
}