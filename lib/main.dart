import 'package:flutter/material.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/filters_screen.dart';
import 'package:mealapp/screens/tabs_screen.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key ?key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>filters={
    'gluten':false,
    'lactose':false,
    'vegan':false,
    'vegetarian':false,
  };
  void setFilters(Map<String,bool>filtersD){

setState((){
  filters=filtersD;
});


  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: ThemeData(
           primarySwatch: Colors.deepOrange,
            canvasColor: Color.fromRGBO(255, 254, 229, 1)
         ),
     debugShowCheckedModeBanner: false,
      home:TabsScreen(),
    );
  }
}
