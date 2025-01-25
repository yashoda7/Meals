import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactousFree,
  vegetarian,
  vegan,
}
class Fliters extends StatefulWidget {
  const Fliters({super.key,required this.currentFilter});

  final Map<Filter,bool> currentFilter;
  @override
  State<Fliters> createState() => _FlitersState();
}

class _FlitersState extends State<Fliters> {
  var _glutentFreeFliterSet=false;
  var _lactoseFreeFilterSet = false;
  var _vegatarianFilterSet=false;
  var _veganFilterSet = false;
  @override
  void initState(){
    super.initState();
    _glutentFreeFliterSet=widget.currentFilter[Filter.glutenFree]! ;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactousFree]!;
    _vegatarianFilterSet=widget.currentFilter[Filter.vegetarian]!;
    _veganFilterSet = widget.currentFilter[Filter.vegan]!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Your Filters") ,
      ),
    //   drawer: MainDrawer(onPress: (identifier){
    //     Navigator.pop(context);
    //     if(identifier=='Meals'){
    //       Navigator.push(context,MaterialPageRoute(
    //     builder: (ctx) =>TabScreen(),
    //   ));
    // }
    //   }),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didpop,dynamic result){
          if(didpop)
            return;
          Navigator.of(context).pop({
            Filter.glutenFree:_glutentFreeFliterSet,
            Filter.lactousFree:_lactoseFreeFilterSet,
            Filter.vegan:_veganFilterSet,
            Filter.vegetarian:_vegatarianFilterSet,

          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutentFreeFliterSet, 
              onChanged: (vaal){
                setState(() {
                  _glutentFreeFliterSet=vaal;
                });
              },
            title: Text("Gluten-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
            ),
            subtitle:Text("only include gluten-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground) ,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left:34,right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilterSet, 
              onChanged: (vaal){
                setState(() {
                  _lactoseFreeFilterSet=vaal;
                });
              },
            title: Text("lactous-free",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
            ),
            subtitle:Text("only include lactous-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground) ,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left:34,right: 22),
            ),
            SwitchListTile(
              value: _vegatarianFilterSet, 
              onChanged: (vaal){
                setState(() {
                  _vegatarianFilterSet=vaal;
                });
              },
            title: Text("vegetarian",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
            ),
            subtitle:Text("only include vegetarian meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground) ,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left:34,right: 22),
            ),
            SwitchListTile(
              value: _veganFilterSet, 
              onChanged: (vaal){
                setState(() {
                  _veganFilterSet=vaal;
                });
              },
            title: Text("vegan",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,),
            ),
            subtitle:Text("only include vegan meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground) ,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left:34,right: 22),
            ),
        
          ],
        ),
      ),
    );
  }
}