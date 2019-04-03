import 'package:flutter/material.dart';

class Secends extends StatelessWidget {
  String msg;

  Secends({this.msg});

  @override
  Widget build(BuildContext context) {
    print("lllllllllll");
    // TODO: implement build
    return MaterialApp(
      color: Colors.greenAccent,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Secend"),
        ),
        body: Container(
          child: Center(
            child: Text("Secend $msg"),
          ),
        ),
      ),
    );
  }
}
