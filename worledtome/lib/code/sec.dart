import 'package:flutter/material.dart';
import 'package:worledtome/code/card1.dart';
import 'card1.dart';

class sec extends StatefulWidget {
  @override
  _secState createState() => _secState();
  }

Widget present (Card1 name) {
  bool val = false;
  return Card(child: CheckboxListTile(

    value: val,
    secondary: Text('${name.amount}'),
    onChanged: (bool newval){
        val = newval;
    },

    title: Text(name.name),
  ),
  );
}




class _secState extends State<sec> {
  List <Card1> x = [Card1(name: 'milk',state: false),
    Card1(name:'bread',state: true,amount: 3),
    Card1(name: 'coffi',state: false)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new list',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.greenAccent[700],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children:x.map((e) => present(e)).toList(),
    ),
    );
  }
}
