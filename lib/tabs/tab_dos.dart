import 'package:flutter/material.dart';

class TabDos extends StatefulWidget {
  TabDos({Key? key}) : super(key: key);

  @override
  _TabDosState createState() => _TabDosState();
}

class _TabDosState extends State<TabDos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.amber,
          )),
          Expanded(
              child: Container(
            color: Colors.red,
          )),
          Expanded(
              child: Container(
            color: Colors.blueAccent,
          ))
        ],
      ),
    ));
  }
}
