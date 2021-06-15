import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';
import 'package:flutter_midi_command/flutter_midi_command_messages.dart';

class PlayStop extends StatefulWidget {
  PlayStop({Key? key}) : super(key: key);

  @override
  _PlayStopState createState() => _PlayStopState();
}

class _PlayStopState extends State<PlayStop> {
  var _playPulsado, _play, _stopPulsado, _stop, _playSinPulsar, _stopSinPulsar;

  @override
  void initState() {
    super.initState();

    _playPulsado = Image.asset(
      'assets/Mixer/PlayStop/06 Pad Play Pulsado.png',
      fit: BoxFit.fill,
    );
    _playSinPulsar = Image.asset(
      'assets/Mixer/PlayStop/06 Pad Play Sin pulsar.png',
      fit: BoxFit.fill,
    );
    _stopPulsado = Image.asset(
      'assets/Mixer/PlayStop/06 Pad Stop Pulsado.png',
      fit: BoxFit.fill,
    );
    _stopSinPulsar = Image.asset(
      'assets/Mixer/PlayStop/06 Pad Stop Sin pulsar.png',
      fit: BoxFit.fill,
    );
    _play = _playSinPulsar;
    _stop = _stopSinPulsar;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(_stop.image, context);
    precacheImage(_play.image, context);
    precacheImage(_playPulsado.image, context);
    precacheImage(_stopPulsado.image, context);
  }

  var playValor = 0xFA;
  var stopValor = 0xFC;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: _play,
                onTapDown: (d) {
                  setState(() {
                    _play = _playPulsado;
                    MidiCommand().sendData(Uint8List.fromList([playValor]));
                    print('Estoy enviando ' + playValor.toString());
                  });
                },
                onTapUp: (d) {
                  setState(() {
                    _play = _playSinPulsar;
                  });
                },
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: _stop,
              onTapDown: (details) {
                setState(() {
                  _stop = _stopPulsado;
                  MidiCommand().sendData(Uint8List.fromList([stopValor]));
                  print('Estoy enviando ' + stopValor.toString());
                });
              },
              onTapUp: (details) {
                setState(() {
                  _stop = _stopSinPulsar;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
