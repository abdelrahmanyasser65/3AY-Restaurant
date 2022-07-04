import 'package:flutter/material.dart';
import 'package:mealapp/componts/drawer.dart';
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
        appBar: AppBar(
          title: Text("Your Filters"),
        ),
      body: null,
    );
  }
}
