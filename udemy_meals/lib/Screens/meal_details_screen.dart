import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = "/MealDetailsSceen";

  Widget buildContaner (Widget child){
    return Container(
        padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    border: Border.all(color: Colors.purple),
    ),
    height: 150,
    width: 350,
    child:child
    );
  }
  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "${selectedMeal.ingredients.length} Ingredients:",
                style: Theme.of(context).textTheme.title,
              ),
            ),
             buildContaner(ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).secondaryHeaderColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${index + 1}) ${selectedMeal.ingredients[index]}",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              )),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                "${selectedMeal.steps.length} Steps:",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            buildContaner(ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(selectedMeal.steps[index],style: TextStyle (fontSize: 18),),
                          leading: CircleAvatar(
                            child: Center(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    );
                  }),
            ),
            SizedBox (height: 30,)
          ],
        ),
      ),
    );
  }
}
