import 'package:flutter/material.dart';
import 'package:pruebas_finales_midi/widgets/boton.dart';
import 'package:pruebas_finales_midi/widgets/part_selector.dart';
import 'package:pruebas_finales_midi/widgets/play_stop.dart';

class TabUno extends StatefulWidget {
  TabUno({Key? key}) : super(key: key);

  @override
  _TabUnoState createState() => _TabUnoState();
}

class _TabUnoState extends State<TabUno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
              child: Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: PartSelectorDrums(),
            ),
          )),
          Expanded(
              child: Container(
            color: Colors.red,
            child: PlayStop(),
          )),
          Expanded(
              child: RotatedBox(
            quarterTurns: 1,
            child: Container(
              color: Colors.blueAccent,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(child: Boton()),
              ),
            ),
          ))
        ],
      ),
    ));
  }
}
