import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';
import './favorits_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeal;
  final toggleFav;
  TabsScreen (this.favoriteMeal, this.toggleFav);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int indexChosen = 0;
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
    {'title': 'Categories', 'page': CategoriesScreen()},
    {'title': 'Favorits', 'page': FavoritsScreen(widget.favoriteMeal, widget.toggleFav)}
    ];
    super.initState();
  }

  void _selection(int choise) {
    setState(() {
      indexChosen = choise;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[indexChosen]['title']),
      ),
      body: _pages[indexChosen]['page'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexChosen,
        selectedItemColor: Theme.of(context).secondaryHeaderColor,
        unselectedItemColor: Theme.of(context).primaryColorDark,
        type: BottomNavigationBarType.shifting,
        onTap: _selection,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.apps,
              size: 25,
            ),
            title: Text(
              "Categories",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(
              Icons.star,
              size: 25,
            ),
            title: Text(
              "Favorites",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
