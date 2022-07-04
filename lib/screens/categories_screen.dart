import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_meal_screen.dart';

import '../dummy_data.dart';
class CategoriesScreen extends StatelessWidget {
   CategoriesScreen({Key? key}) : super(key: key);
void selectCategory(BuildContext ctx,id,titel){
  Navigator.push(ctx, MaterialPageRoute(builder: (ctx)=>CategoryMealScreen(
      id: id,title: titel,
  )));
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,right: 20
        ),
        child:Container(
          height: double.infinity,
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=>
                  InkWell(
                    onTap: ()=>selectCategory(context,DUMMY_CATEGORIES[index].id,DUMMY_CATEGORIES[index].title),
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(15) ,
                      topRight:Radius.circular(15) ,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20
                      ),
                      padding: EdgeInsets.only(
                          right: 10
                      ),
                      height: 150,width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft:Radius.circular(15) ,
                            topRight:Radius.circular(15) ,
                          ),
                          image: DecorationImage(image: NetworkImage(
                            DUMMY_CATEGORIES[index].imageUrl,
                          ),fit: BoxFit.cover)
                      ),
                      child: Align(
                        alignment: Alignment(0,0.7),
                        child: Container(
                            height: 50,width: double.infinity,
                            color: Colors.black.withOpacity(0.5),
                            padding: EdgeInsets.only(
                                left: 20,top: 9
                            ),
                            child: Text(
                              DUMMY_CATEGORIES[index].title,style:
                            TextStyle(fontSize: 25,color:Colors.white,
                                fontFamily:'RobotoCondensed',fontWeight:FontWeight.w700 ),)),
                      ),

                    ),
                  ),
              separatorBuilder: (context,index)=>SizedBox(height:0,),
              itemCount: DUMMY_CATEGORIES.length),
        ),
      ),
    );
  }
}
