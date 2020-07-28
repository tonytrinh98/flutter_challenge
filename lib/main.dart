import 'package:flutter/material.dart';

import 'package:globalcorona/corona_global.dart';
import 'package:globalcorona/covid.dart';
void main() {
  print('bruh');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Global Info',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Future<Covid> coronaStats = fetchCoronaVirus();
    return Scaffold(
      backgroundColor: Color(0xFF1B1536), //1037CB
      appBar:
          AppBar(centerTitle: true, title: Image.asset("assets/worlds.png")),
      body: CoronaVirus(coronaStats),
    );
  }
}


