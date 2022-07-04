import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height:100,
            width: double.infinity,
            padding: EdgeInsets.only(
              left: 30,top: 30
            ),
            alignment: Alignment.centerLeft,
            color: Colors.deepOrange,
            child: Text("Cooking Up!",style:
              TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),),
          ),
         SizedBox(height: 20,),
          buildListTile('Meal',Icons.restaurant,(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabsScreen()));
          }),
          buildListTile('Filters',Icons.filter_alt_sharp,(){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FiltersScreen()));
          }),

        ],
      ),
    );
  }

  ListTile buildListTile(title,icon,fun) {
    return ListTile(
          onTap: fun,
          leading: Icon(icon,size: 26,),
          title: Text(title,style:
            TextStyle(fontSize: 24,fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),),
        );
  }
}
