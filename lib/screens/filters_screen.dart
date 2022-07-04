import 'package:flutter/material.dart';
class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);



  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
 bool glutenFree=false;
bool  vegan=false;
  bool vegetarian=false;
  bool lactoseFree=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Filters"),
        actions: [
          IconButton(
              onPressed:(){},
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust your meal selection.',style:
              TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    "Gluten-Free",
                    "Only include gluten-free meals.",
                    glutenFree,
                    (val){
                      setState((){
                        glutenFree=val;
                      });
                    }
                ),
                buildSwitchListTile(
                    "Lactose-Free",
                    "Only include Lactose-free meals.",
                    lactoseFree,
                        (val){
                      setState((){
                        lactoseFree=val;
                      });
                    }
                ),
                buildSwitchListTile(
                    "Vegan-Free",
                    "Only include Vegan-free meals.",
                    vegan,
                        (val){
                      setState((){
                        vegan=val;
                      });
                    }
                ),
                buildSwitchListTile(
                    "Vegetarian-Free",
                    "Only include Vegetarian-free meals.",
                    vegetarian,
                        (val){
                      setState((){
                        vegetarian=val;
                      });
                    }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(title,subTitle,curValue,upData) {
    return SwitchListTile(
                title: Text(title,style: TextStyle(
                  fontSize: 24,fontWeight: FontWeight.w500
                ),),
                  subtitle: Text(subTitle),
                  value: curValue,
                  onChanged: upData,
              );
  }
}
