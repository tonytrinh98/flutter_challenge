import 'package:flutter/material.dart';
import 'package:globalcorona/countries.dart';

import 'package:globalcorona/covid.dart';

const double WIDTH = 130.0;
const double HEIGHT = 25.0;
// ignore: non_constant_identifier_names
Widget CoronaVirus(Future<Covid> stats, Future<Country> statsCountry) {
  return FutureBuilder(
    future: stats,
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 190.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 450.0,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 30.0, left: 30.0, right: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Text('Covid 19',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                                Text('World Data',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30.0)),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Cases:',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              CustomContainer(
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.lightBlueAccent,
                                  dividend: snapshot.data.cases,
                                  cases: snapshot.data.cases),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Active: ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              CustomContainer(
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.lightBlueAccent,
                                  dividend: snapshot.data.active,
                                  cases: snapshot.data.cases),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Recovered: ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              CustomContainer(
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.lightBlueAccent,
                                  dividend: snapshot.data.recovered,
                                  cases: snapshot.data.cases),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Critical: ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              CustomContainer(
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.lightBlueAccent,
                                  dividend: snapshot.data.critical,
                                  cases: snapshot.data.cases),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Deaths: ',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0)),
                              CustomContainer(
                                  backgroundColor: Colors.grey,
                                  progressColor: Colors.lightBlueAccent,
                                  dividend: snapshot.data.deaths,
                                  cases: snapshot.data.cases),
                            ],
                          ),
                        ],
                      ),
                    ),
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(130.0)),
                        color: Color(0xFF1B1536)),
                  ),
                  Center(
                    child: Image.asset('assets/virus.png'),
                    heightFactor: 8,
                  ),
                ],
              ),
            ),
            Text('World Data',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0)),

          ],
        );
      } else
        return Center(child: CircularProgressIndicator());
    },
  );
}

class CustomContainer extends StatelessWidget {
  final Color backgroundColor;
  final Color progressColor;
  final int cases;
  final int dividend;

  const CustomContainer(
      {Key key,
      this.backgroundColor,
      this.progressColor,
      @required this.cases,
      @required this.dividend})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HEIGHT,
      width: WIDTH,
      child: Stack(
        children: <Widget>[
          Container(
            color: backgroundColor,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: progressColor,
              width:
                  dividend / cases * WIDTH, //measure ratio based on total case
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Text(dividend.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
          )
        ],
      ),
    );
  }
}
