import 'package:flutter/material.dart';
import 'package:meals_app/model/meals.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem  extends StatelessWidget{
 const MealItem({super.key,required this.meal,});
  final Meal meal;
  // final void Function(Meal meal) toggle;
  String get getComplexity{
    return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
  String get getAffordability{
    return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        child: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (ctx) => MealDetailScreen(meal: meal,)));
          },
          child: Stack(
            children: [
              Hero(
                tag: meal.id,
                child: FadeInImage(placeholder: MemoryImage(kTransparentImage), 
                image: NetworkImage(meal.imageUrl),
                fit:BoxFit.cover,
                height: 200,
                width: double.infinity,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            MealItemTrait(
                              icon: Icons.schedule,
                               label:'${meal.duration} min'),
                               const SizedBox(width: 12,),
                               MealItemTrait(
                              icon: Icons.work,
                               label:getComplexity),
                               const SizedBox(width: 12,),
                               MealItemTrait(
                              icon: Icons.attach_money,
                               label:getAffordability)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }

  
}