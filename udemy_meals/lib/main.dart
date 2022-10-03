//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './models/meal.dart';
import './dummy_data.dart';
import './Screens/favorits_screen.dart';
import './Screens/tabs_screen.dart';
import './Screens/meal_details_screen.dart';
import './Screens/SettingsScreen.dart';
import 'Screens/categories_screen.dart';
import 'Screens/category_meals_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });

}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List <Meal> favoriteMeals = [];

  void _togglefavorite (String id){
    final exsistingIndex = favoriteMeals.indexWhere((element) => element.id == id);
    if (exsistingIndex >= 0)
      setState(() {
        favoriteMeals.removeAt(exsistingIndex);
      });
    else
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
  }

  Map <String,bool> _filters = {
  "gluten" : false,
  "vegan" :  false,
  "vegetarian" : false,
  "lactose" : false,
  };
  List <Meal> _avelebleMeals = DUMMY_MEALS;

  void _setFilters (Map <String,bool> filtersData){
    setState(() {
      _filters = filtersData;
      
      _avelebleMeals = DUMMY_MEALS.where((element) {
        if (_filters ["gluten"] && !element.isGlutenFree)
          return false;
        if (_filters ["vegan"] && !element.isVegan)
          return false;
        if (_filters ["vegetarian"] && !element.isVegetarian)
          return false;
        if (_filters ["lactose"] && !element.isLactoseFree)
          return false;
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meals",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColorDark: Colors.purple[900],
        accentColor: Colors.teal,
        canvasColor: Colors.grey[300],
        secondaryHeaderColor: Colors.teal[200],
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Colors.black),
          body2: TextStyle (color: Colors.black),
          title: TextStyle(
              fontSize: 24,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        '/': (cnx) => TabsScreen(favoriteMeals,_togglefavorite),
        CategoryMealsScreen.routName: (cnx) => CategoryMealsScreen(_avelebleMeals,_togglefavorite, favoriteMeals),
        MealDetailsScreen.routName : (cnx) =>MealDetailsScreen(),
        //FavoritsScreen.routName : (cnx) => FavoritsScreen(),
        SettingsScreen.routName : (cnx) =>SettingsScreen(_setFilters, _filters),
      },
      onUnknownRoute: (setting){
        return MaterialPageRoute (builder: (context) => CategoriesScreen());
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daily Meal"),
      ),
      body: Container(),
    );
  }
}
