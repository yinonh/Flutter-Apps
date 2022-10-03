import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty?data: ModalRoute.of(context).settings.arguments;
    //set background
    String bgImage = data ['isDay']? 'day.png':'night.png';
    Color bgColor = data ['isDay']? Colors.greenAccent[700] : Colors.indigo[700];
    Color txtColor = data ['isDay']? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage ('assets/${bgImage}'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async{
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time':result['time'],
                        'location':result['location'],
                        'isDay':result['isDay'],
                        'flag':result['flag'],
                      };
                    });
                  },
                  icon: Icon (Icons.edit_location, color: txtColor,size: 30.0,),
                  label: Text('Edit Location',style: TextStyle(color: txtColor,fontSize: 20.0),),
                ),
                SizedBox (height: 40.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'],
                    style: TextStyle (fontSize: 30.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    color: txtColor),
                    ),
                  ],
                ),
                Divider (height: 30.0,),
                Text(data ['time'],
                  style: TextStyle (
                    color: txtColor,
                      fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
