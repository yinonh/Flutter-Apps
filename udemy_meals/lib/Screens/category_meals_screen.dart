import 'package:flutter/material.dart';

import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routName = "/CategotyMealsScreen";
  final Function favoritesFunc;
  final List <Meal> favotitsList;
  final List <Meal> avelableMeals;
  CategoryMealsScreen (this.avelableMeals, this.favoritesFunc, this.favotitsList);

  @override
  Widget build(BuildContext context) {
    final routArgument =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categorytitle = routArgument['title'];
    final categoryId = routArgument['id'];
    final mealList = avelableMeals
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categorytitle),
      ),
      body: ListView.builder(
        itemBuilder: (cntx, index) {
          return MealItem(
            title: mealList[index].title,
            imageUrl: mealList[index].imageUrl,
            affordability: mealList[index].affordability,
            complexity: mealList[index].complexity,
            duration: mealList[index].duration,
            id: mealList [index].id,
            favorite: this.favoritesFunc,
            isFav: (favotitsList.contains(mealList [index])),
          );
        },
        itemCount: mealList.length,
      ),
    );
  }
}
