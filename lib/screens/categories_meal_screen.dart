import 'package:flutter/material.dart';
import 'package:mealapp/componts/mealItem.dart';
import 'package:mealapp/dummy_data.dart';
class CategoryMealScreen extends StatefulWidget {
 final String id;
 final String title;

 const CategoryMealScreen({Key? key,
   required this.id,
   required this.title
}) : super(key: key);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState(
      id: id,title: title
  );
}


class _CategoryMealScreenState extends State<CategoryMealScreen> {
  final String id;
  final String title;
   _CategoryMealScreenState({
    required this.id,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final categoryMeal=DUMMY_MEALS.where((meal){
      return meal.categories.contains(id);
    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: Text(title,style:TextStyle(
            fontSize: 20,color: Colors.white,fontFamily:'RobotoCondensed',
            fontWeight: FontWeight.bold
        ),),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
          itemBuilder: (context,index){
         return MealItem(
           removeItem:(String mealId){
         setState((){
         categoryMeal.removeWhere((element) =>
           element.id==mealId
         );
         });

         },
           id: categoryMeal[index].id,
          imageUrl: categoryMeal[index].imageUrl,
           duration: categoryMeal[index].duration,
           affordability: categoryMeal[index].affordability,
           title: categoryMeal[index].title,
           complexity: categoryMeal[index].complexity,

         );
          },
         itemCount:categoryMeal.length ,
      ),
    );
  }
}
