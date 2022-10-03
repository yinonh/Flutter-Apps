import 'package:flutter/material.dart';
import 'package:water_app/service/worled_time.dart';

class Choose_Location extends StatefulWidget {
  @override
  _Choose_LocationState createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'UK', flag: 'UK.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Germany', flag: 'berlin.png'),
    WorldTime(url: 'Europe/Paris', location: 'France', flag: 'france.png'),
    WorldTime(url: 'Asia/Jerusalem', location: 'Israel', flag: 'israel.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'USA.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'USA.png'),
//    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
//    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updatetime (index) async{
    WorldTime instence = locations[index];
    await instence.getTime();
    //navigate to the home screen
    Navigator.pop(context, {
      'location':instence.location,
      'time':instence.time,
      'flag':instence.flag,
      'isDay':instence.isDay,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[700],
      ) ,
      body: 
      ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
            child: Card (
              child:
              ListTile(
                onTap: (){
                  updatetime(index);
                },
                title: Center(child: Text (locations[index].location,
                  style: TextStyle(fontSize: 20.0),
                )
                ),
                leading: Image(image: AssetImage('assets/${locations[index].flag}'),
                width: 40.0,
                height: 40.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
