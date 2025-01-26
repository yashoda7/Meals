import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/screens/meals_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:meals_app/providers/fliters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter{
//   glutenFree,
//   lactousFree,
//   vegetarian,
//   vegan,
// }
class Fliters extends ConsumerWidget {
  const Fliters({super.key});

  // final Map<Filter,bool> currentFilter;

// class _FlitersState extends ConsumerState<Fliters> {
//   var _glutentFreeFliterSet=false;
//   var _lactoseFreeFilterSet = false;
//   var _vegatarianFilterSet=false;
//   var _veganFilterSet = false;
//   @override
//   void initState(){
//     super.initState();
//     final activeFilter=ref.read(fliterProvider);
//     _glutentFreeFliterSet=activeFilter[Filter.glutenFree]! ;
//     _lactoseFreeFilterSet = activeFilter[Filter.lactousFree]!;
//     _vegatarianFilterSet=activeFilter[Filter.vegetarian]!;
//     _veganFilterSet = activeFilter[Filter.vegan]!;
//   }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilter=ref.watch(fliterProvider);
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
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.glutenFree]!, 
            onChanged: (vaal){
              ref.read(fliterProvider.notifier).setFilter(Filter.glutenFree, vaal);                
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
            value: activeFilter[Filter.lactousFree]!, 
            onChanged: (vaal){
               ref.read(fliterProvider.notifier).setFilter(Filter.lactousFree, vaal); 
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
            value: activeFilter[Filter.vegetarian]!, 
            onChanged: (vaal){
               ref.read(fliterProvider.notifier).setFilter(Filter.vegan, vaal); 
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
            value: activeFilter[Filter.vegan]!, 
            onChanged: (vaal){
               ref.read(fliterProvider.notifier).setFilter(Filter.vegetarian, vaal); 
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
    );
  }
}