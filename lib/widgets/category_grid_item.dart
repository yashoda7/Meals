import 'package:flutter/material.dart';

class CategoryGridItem  extends StatelessWidget{
  CategoryGridItem({super.key,required this.category,required this.onSelected});
  final category;
   void Function() onSelected;
  @override
  Widget build(context){
    return InkWell(
      onTap: onSelected,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            ),
        ) ,
        child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),),
      ),
    );
  }

}