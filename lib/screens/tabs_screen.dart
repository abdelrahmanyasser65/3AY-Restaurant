import 'package:flutter/material.dart';
import 'package:mealapp/componts/drawer.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/favorites_screen.dart';
class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex=0;

  void selectPage(int val){
    setState((){
      currentIndex=val;
    });
  }
  List screens=[
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  List titles=[
    'Categories',
    'Your Favorites'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(titles[currentIndex],style:
        TextStyle(
            fontSize: 24,color: Colors.white,fontFamily:'RobotoCondensed',
            fontWeight: FontWeight.bold
        ),),
      ),
      body:screens[currentIndex] ,
        bottomNavigationBar: BottomNavigationBar(
         // backgroundColor: Colors.deepOrange,
          onTap: selectPage,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category,size: 27,),
              label: 'Categories'
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.star,size: 27,),
                label: 'Favorites',
            ),
          ],
        ),
    );
  }
}
