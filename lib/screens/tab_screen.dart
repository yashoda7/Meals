import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/fliters.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
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
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
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
  @override
  Widget build(BuildContext context) {
    final availableMeals=ref.watch(filterMealProvider);
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