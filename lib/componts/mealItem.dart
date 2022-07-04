import 'package:flutter/material.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';

import '../models/meal.dart';
class MealItem extends StatelessWidget {
  final String imageUrl;
  final String id;
  final String title;
  final int duration;
  final  Function removeItem;
  final Complexity complexity;
  final Affordability affordability;
  const MealItem({Key? key,
    required this.id,
    required this.removeItem,
    required this.imageUrl,
    required this.affordability,
    required this.complexity,
    required this.title,
    required this.duration
}) : super(key: key);
 void selectMeal(ctx){
   Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>
   MealDetails(
     id:id,
     title:title,
   ),
   )).then((value) {
     if(value!=null) {
        removeItem(value);
     }
   }

   );
 }
  String get complexityText{
   if(complexity==Complexity.Simple){
     return 'Simple';
   }
   else if(complexity==Complexity.Challenging){
     return 'Challenging';
   }
   else if(complexity==Complexity.Hard){
     return 'Hard';
   }
   else {
     return 'unKnow';
   }
  }
  String get affordabilityText{
    if(affordability==Affordability.Pricey){
      return 'Pricey';
    }
    else if(affordability==Affordability.Affordable){
      return 'Affordable';
    }
    else if(affordability==Affordability.Luxurious){
      return 'Luxurious';
    }
    else {
      return 'unKnow';
    }
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
          margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft:Radius.circular(15) ,
                  ),
                  child: Image(
                    image:NetworkImage(imageUrl,),
                    width: double.infinity,height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,left: 40,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,horizontal: 20
                    ),
                    width: 300,
                    color: Colors.black.withOpacity(0.5),
                    child: Text(title,style:
                      TextStyle(fontSize: 26,color: Colors.white),softWrap: true,
                    overflow: TextOverflow.fade,),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width:6 ,),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width:6 ,),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      //SizedBox(width:6 ,),
                      Text(affordabilityText)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
