import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../Widgets/meal_item.dart';
import '../dummy_data.dart';

class FavoritsScreen extends StatefulWidget {
  static const routName = "/FavoritsScreen";

  final List <Meal> favoriteMeals;
  final Function _toggleFav;

  FavoritsScreen (this.favoriteMeals, this._toggleFav);

  @override
  _FavoritsScreenState createState() => _FavoritsScreenState();
}

class _FavoritsScreenState extends State<FavoritsScreen> {
  @override
  Widget build(BuildContext context) {
    var func = (String id){
      setState(() {
        widget._toggleFav(id);
      });
    };

    return (widget.favoriteMeals.length == 0) ?
        Center (
          child: Text ("there is no favorits, add some"),
        )
        :
    ListView.builder(
      itemBuilder: (cntx, index) {
        return MealItem(
          title: widget.favoriteMeals[index].title,
          imageUrl: widget.favoriteMeals[index].imageUrl,
          affordability: widget.favoriteMeals[index].affordability,
          complexity: widget.favoriteMeals[index].complexity,
          duration: widget.favoriteMeals[index].duration,
          id: widget.favoriteMeals [index].id,
          favorite: func,
          isFav: true,
        );
      },
      itemCount: widget.favoriteMeals.length,
    );
  }
}
