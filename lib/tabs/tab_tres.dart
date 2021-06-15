import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';

class TabTres extends StatefulWidget {
  TabTres({Key? key}) : super(key: key);

  @override
  _TabTresState createState() => _TabTresState();
}

class _TabTresState extends State<TabTres> {
  MidiCommand _midiCommand = MidiCommand();
  late MidiDevice _device;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: _midiCommand.devices,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    var dispositivos = snapshot.data as List<MidiDevice>;
                    _device = dispositivos.first;
                    _midiCommand.connectToDevice(_device);

                    /*   _setDispo = _device; */

                    return Text('El dispositivo conectado es: ' +
                        dispositivos.first.name.toString() +
                        "\n El estado de conexión es: " +
                        dispositivos.first.connected.toString());
                  }
                }),
          ),
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
