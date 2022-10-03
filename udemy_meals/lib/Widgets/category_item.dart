import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:udemy_meals/Screens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String title;
  final String id;
  final Color color;

  CategoryItem(this.title,this.id, this.color);

  void navigateToDitaels (BuildContext cnx){
    Navigator.of(cnx).pushNamed(
      CategoryMealsScreen.routName, arguments: {'id' : id, 'title' : title}
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>navigateToDitaels(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(this.title , style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin:Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
