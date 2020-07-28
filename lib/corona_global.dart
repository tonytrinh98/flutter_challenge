import 'package:flutter/material.dart';

import 'package:globalcorona/covid.dart';

// ignore: non_constant_identifier_names
Widget CoronaVirus(Future<Covid> stats) {
  return FutureBuilder(
    future: stats,
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 258.0),
              child: Container(
                height: 450.0,
                width: double.infinity,
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('World Data',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0)),
                      Row(
                        children: <Widget>[
                          Text('Cases: '),
                          Container(
                            child: Container(color: Colors.orange, height: 20.0, width: 95.0,),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue, width: 2.0)),
                            height: 20.0,
                            width: 100.0,
                          )
                        ],
                      ),
                      Text('Deaths: ${snapshot.data.deaths}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      Text('Recovered: ${snapshot.data.recovered}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                      Text('Active: ${snapshot.data.active}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0)),
                    ],
                  ),
                ),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.only(
                        bottomLeft: const Radius.circular(150.0)),
                    color: Colors.green),
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
