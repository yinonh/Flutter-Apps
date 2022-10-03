

import 'package:flutter/material.dart';
import 'first.dart';
import 'sec.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/':(context)=>Home(),
    '/first': (context)=>first(),
    '/sec':(context)=>sec()
  }
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: <Widget>[
          SizedBox(height: 100.0,),
          CircleAvatar(
            backgroundImage:  AssetImage ('lib/images/list-2389219_1280-1-e1570373005941.png'),
            radius: 60.0,
          ),
          Divider(height:50),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/first');
                  },
                  child: Text ('exsist list',style: TextStyle(fontSize: 20),),
                  color: Colors.greenAccent[700],
                ),
                FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/sec');
                  },
                  child: Text ('new list', style: TextStyle(fontSize: 20),),
                color: Colors.greenAccent[700],)
              ],
            ),
          )
        ],
      ),
    );
  }
}


