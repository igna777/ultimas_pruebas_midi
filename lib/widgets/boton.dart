import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';
import 'package:flutter_midi_command/flutter_midi_command_messages.dart';

class Boton extends StatefulWidget {
  /* MidiDevice device; */
  Boton(/* {this.device} */) : super();

  @override
  _BotonState createState() => _BotonState();
}

class _BotonState extends State<Boton> {
  var boton, bPulsado, bSinPulsar;

  var _channel = 0;
  var _note = 60;
  var _velocity = 100;
  var _controller = 0;
  var _value = 0;

  @override
  void initState() {
    super.initState();

    bPulsado = Image.asset(
      'assets/Pads/Botones/06 Pad Central Pulsado.png',
      fit: BoxFit.fill,
    );

    bSinPulsar = Image.asset(
      'assets/Pads/Botones/06 Pad Central Sin Pulsar.png',
      fit: BoxFit.fill,
    );

    boton = bSinPulsar;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(bPulsado.image, context);
    precacheImage(bSinPulsar.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: boton,
        onTapDown: (details) {
          setState(() {
            boton = bPulsado;
            NoteOnMessage(
                    channel: _channel + 0, note: _note, velocity: _velocity)
                .send();
            print("Estoy enviando: \nChannel: " +
                _channel.toString() +
                "\nNote: " +
                _note.toString() +
                "\nVelocity: " +
                _velocity.toString());
          });
        },
        onTapUp: (details) {
          setState(() {
            boton = bSinPulsar;
          });
        },
      ),
    );
  }
}
