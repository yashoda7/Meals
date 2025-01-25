import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/fliters.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const  kIntialization={
      Filter.glutenFree:false,
      Filter.lactousFree:false,
      Filter.vegan:false,
      Filter.vegetarian:false,
    };
class TabScreen extends StatefulWidget {
   TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
    final List<Meal> _favorites=[];
    Map<Filter,bool> map=kIntialization;
    void showInfo(String message){
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message)
          ),
          );
    }
   void _toggeleScreen(Meal meal){
    var iscontain=_favorites.contains(meal);
    if(iscontain){
      setState(() {
        _favorites.remove(meal);
        showInfo("Meal is no longer a favourite");
      });
    }
    else  {
      setState(() {
        _favorites.add(meal);
        showInfo("Marked as favourite");
      });
    }
  }
  int _selectedIndex=0;
  void _selectPage(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  void _setScreen(String identifier) async{
    Navigator.pop(context);
    if(identifier=='Fliters'){
      final result=await Navigator.push<Map<Filter,bool>>(context,MaterialPageRoute(
        builder: (ctx) =>Fliters(),
      ));
      setState(() {
        map=result ?? kIntialization;
      });
      }


      // else{
      //    Navigator.push(context,MaterialPageRoute(
      //   builder: (ctx) =>TabScreen()));
      // }
    }
  @override
  Widget build(BuildContext context) {
    Widget activePage= CategoriesScreen(onToggle: _toggeleScreen,);
    String title="categories";
    if(_selectedIndex==1){
      activePage=MealsScreen( meals: _favorites,ontoggle: _toggeleScreen,);
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