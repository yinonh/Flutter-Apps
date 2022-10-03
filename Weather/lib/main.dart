//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:water_app/pages/home.dart';
import 'package:water_app/pages/choose_loacation.dart';
import 'package:water_app/pages/loding.dart';

void main() => runApp(MaterialApp(
  initialRoute: 'home',
  routes: {
    '/':(context) => Loading(),
    '/home':(context)=>Home(),
    '/location':(context)=>Choose_Location()
  },
));


