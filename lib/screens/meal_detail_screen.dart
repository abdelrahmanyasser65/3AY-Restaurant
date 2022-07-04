import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
class MealDetails extends StatelessWidget {
final String id;
final String title;
  const MealDetails({super.key,
    required this.id,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final selectedMeal=DUMMY_MEALS.firstWhere((meal){
     return meal.id==id;

    });
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style:
          TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
                width: double.infinity,
              child: Image.network(selectedMeal.imageUrl,
              fit: BoxFit.cover,),
            ),
            buildContainer("Ingredients"),
            buildContainerList(
                ListView.builder(
                  itemBuilder:(context,index){
                    return Card(
                      color: Colors.deepOrange,
                      child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10,vertical: 10
                          ),
                          child: Text(selectedMeal.ingredients[index],style:
                          TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
            ),
            buildContainer('Steps'),
            buildContainerList(
              ListView.builder(
                itemBuilder:(context,index){
                  return Column(
                    children: [
                      ListTile(
                        leading:CircleAvatar(
                          child: Text('# ${index+1}'),
                        ) ,
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).pop(id);
        },
        child: Icon(Icons.delete),

      ),
    );
  }

  Container buildContainerList(child) {
    return Container(
          padding: EdgeInsets.only(
            top: 10,left: 10,right: 10,bottom: 7
          ),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey
            )

          ),
          height: 150,
          width: 300,
          child: child,
        );
  }

  Container buildContainer(titleText) {
    return Container(
          margin: EdgeInsets.symmetric(
            vertical: 10
          ),
          child: Text(titleText,style:
            TextStyle(fontSize: 30,fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),),
        );
  }
}
