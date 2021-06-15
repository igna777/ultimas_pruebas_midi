import 'package:flutter/material.dart';
import 'package:flutter_midi_command/flutter_midi_command.dart';
import 'package:provider/provider.dart';
import 'package:pruebas_finales_midi/provider/canal_info.dart';
import 'package:pruebas_finales_midi/tabs/tab_dos.dart';
import 'package:pruebas_finales_midi/tabs/tab_tres.dart';
import 'package:pruebas_finales_midi/tabs/tab_uno.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CanalInfo()),
      ],
      child: MaterialApp(
        title: 'Midi Ultimas pruebas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                title: Text('Midi Ultimas pruebas'),
                bottom: TabBar(
                  tabs: [
                    Tab(
                      icon: Icon(Icons.ac_unit),
                    ),
                    Tab(
                      icon: Icon(Icons.ac_unit),
                    ),
                    Tab(
                      icon: Icon(Icons.ac_unit),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [TabUno(), TabDos(), TabTres()],
              ),
            )),
      ),
    );
  }
}
