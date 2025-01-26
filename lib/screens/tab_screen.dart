import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/fliters.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/meal_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favourite_provider.dart';
import 'package:meals_app/providers/fliters_provider.dart';

const  kIntialization={
      Filter.glutenFree:false,
      Filter.lactousFree:false,
      Filter.vegan:false,
      Filter.vegetarian:false,
    };
class TabScreen extends ConsumerStatefulWidget {
   TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
    // final List<Meal> _favorites=[];
    // Map<Filter,bool> map=kIntialization;
    // void showInfo(String message){
    //   ScaffoldMessenger.of(context).clearSnackBars();
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text(message)
    //       ),
    //       );
    // }
  //  void _toggeleScreen(Meal meal){
  //   var iscontain=_favorites.contains(meal);
  //   if(iscontain){
  //     setState(() {
  //       _favorites.remove(meal);
  //       showInfo("Meal is no longer a favourite");
  //     });
  //   }
  //   else  {
  //     setState(() {
  //       _favorites.add(meal);
  //       showInfo("Marked as favourite");
  //     });
  //   }
  // }
  int _selectedIndex=0;
  void _selectPage(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  void _setScreen(String identifier) async{
    Navigator.pop(context);
    if(identifier=='Fliters'){
      await Navigator.push<Map<Filter,bool>>(context,MaterialPageRoute(
        builder: (ctx) =>Fliters(),
      ));
    }
  }


      // else{
      //    Navigator.push(context,MaterialPageRoute(
      //   builder: (ctx) =>TabScreen()));
      // }
  @override
  Widget build(BuildContext context) {
    final map=ref.watch(fliterProvider);
    final meals=ref.read(mealProvider);
    final availableMeals=meals.where((meal) {
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
    Widget activePage= CategoriesScreen(availableMeals: availableMeals,);
    String title="categories";
    if(_selectedIndex==1){
      final favoriteMeals=ref.watch(favouriteMealsProvider);
      activePage=MealsScreen( meals: favoriteMeals);
      title="favourites";}
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: MainDrawer(onPress: _setScreen,),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: "categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star),label: "favourites"),
        ]
      ),
    );
  }
}