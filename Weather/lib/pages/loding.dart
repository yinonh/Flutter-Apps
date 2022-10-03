import 'package:flutter/material.dart';
import 'package:water_app/service/worled_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void SetWorldTime ()async{
    WorldTime instence = WorldTime(location: 'Israel',flag: 'israel.png',url: 'Asia/Jerusalem');
    await instence.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location':instence.location,
      'time':instence.time,
      'flag':instence.flag,
      'isDay':instence.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    SetWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent [700],
      body: Center(
        child:
        SpinKitWave(
          color: Colors.white70,
          size: 80.0,
        ),
      ),
    );
  }
}
