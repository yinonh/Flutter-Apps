import 'package:flutter/material.dart';
import '../Screens/SettingsScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget listBuilder(String title, IconData icon,Function ontap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      onTap: ontap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        Container(
          color: Theme.of(context).accentColor,
          padding: EdgeInsets.all(20),
            width: double.infinity,
            alignment: Alignment.center,
            child: SafeArea(
              child: Text(
          "Options",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
        ),
            )),
        listBuilder("Meals", Icons.restaurant, () => Navigator.pushReplacementNamed(context, "/")),
        listBuilder('Settings', Icons.settings, () =>Navigator.pushReplacementNamed(context, SettingsScreen.routName)),
      ],
    ));
  }
}
