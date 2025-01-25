import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
   MainDrawer({super.key,required this.onPress});
   void Function(String identifier) onPress;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding:EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              )
            ),
            child:Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18,),
                Text(
                  "Cooking up",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
              ) ,
               ),
              ListTile(
                leading: Icon(
                  Icons.restaurant,
                  size:26,
                  color:Theme.of(context).colorScheme.onBackground,
                ),
                title: Text(
                  'Meals',
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground ,
                    fontSize: 24,
                  ),

                ),
                onTap: (){
                  onPress("Meals");
                }
              ),
               ListTile(
                leading: Icon(
                  Icons.settings,
                  size:26,
                  color:Theme.of(context).colorScheme.onBackground,
                ),
                title: Text(
                  'Fliters',
                  style:Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground ,
                    fontSize: 24,
                  ),
                ),
                onTap: (){
                  onPress("Fliters");
                },
              ),
        ],
      ),
    );
  }
}