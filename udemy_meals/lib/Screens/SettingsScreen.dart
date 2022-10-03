import 'package:flutter/material.dart';
import '../Screens/tabs_screen.dart';
import '../Widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routName = "/SettingsScreen";
  final Function saveFilters;
  final Map <String,bool> currentFilters;

  SettingsScreen (this.saveFilters,this.currentFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _GlutenFree = false;
  var _Vegan = false;
  var _Vegetarian = false;
  var _LactoseFree = false;

  @override
  initState (){
    _GlutenFree = widget.currentFilters ["gluten"];
    _Vegan = widget.currentFilters ["vegan"];
    _Vegetarian = widget.currentFilters ["vegetarian"];
    _LactoseFree = widget.currentFilters ["lactose"];
    super.initState();
  }
  Widget switchListTailBuilder (String title, String subtitle,bool value,Function func){
    return SwitchListTile (
      title: Text (title),
      subtitle: Text (subtitle),
      onChanged: func,
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded (
              child: ListView (
                children: [
                  switchListTailBuilder("Gluten Free", "Only include gluten free meals", _GlutenFree,(val){
                    setState(() {
                      _GlutenFree = val;
                    });
                  },),
                  switchListTailBuilder("Lactose Free", "Only include Lactose free meals", _LactoseFree,(val){
                    setState(() {
                      _LactoseFree = val;
                    });
                  },),
                  switchListTailBuilder("Vegan", "Only include vigan meals", _Vegan,(val){
                    setState(() {
                      _Vegan = val;
                    });
                  },),
                  switchListTailBuilder("Vegetarian", "Only include Vegetarian meals", _Vegetarian,(val){
                    setState(() {
                      _Vegetarian = val;
                    });
                  },),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton (
                      icon: Icon (Icons.save),
                      iconSize: 40,
                      color: Theme.of(context).accentColor,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      onPressed: () {
                        widget.saveFilters(
                            {
                              "gluten": _GlutenFree,
                              "vegan": _Vegan,
                              "vegetarian": _Vegetarian,
                              "lactose": _LactoseFree,
                            });
                        Navigator.of(context).popAndPushNamed("/");
                      },

                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
