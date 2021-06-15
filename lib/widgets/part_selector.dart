import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebas_finales_midi/provider/canal_info.dart';

class PartSelectorDrums extends StatefulWidget {
  @override
  _PartSelectorDrumsState createState() => _PartSelectorDrumsState();
}

class _PartSelectorDrumsState extends State<PartSelectorDrums> {
  int _valor = 0;

  var _p1, _p2, _p3, _p4, _p5, _p6, _p7, _p8, _p9, _p10;

  @override
  void initState() {
    super.initState();

    _p1 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 01.png',
      fit: BoxFit.fill,
    );
    _p2 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 02.png',
      fit: BoxFit.fill,
    );
    _p3 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 03.png',
      fit: BoxFit.fill,
    );
    _p4 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 04.png',
      fit: BoxFit.fill,
    );
    _p5 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 05.png',
      fit: BoxFit.fill,
    );
    _p6 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 06.png',
      fit: BoxFit.fill,
    );
    _p7 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 07.png',
      fit: BoxFit.fill,
    );
    _p8 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 08.png',
      fit: BoxFit.fill,
    );
    _p9 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 09.png',
      fit: BoxFit.fill,
    );
    _p10 = Image.asset(
      'assets/Drums/Part Selector/03Part Select 10.png',
      fit: BoxFit.fill,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(_p1.image, context);
    precacheImage(_p2.image, context);
    precacheImage(_p3.image, context);
    precacheImage(_p4.image, context);
    precacheImage(_p5.image, context);
    precacheImage(_p6.image, context);
    precacheImage(_p7.image, context);
    precacheImage(_p8.image, context);
    precacheImage(_p9.image, context);
    precacheImage(_p10.image, context);
  }

  @override
  Widget build(BuildContext context) {
    final _valorPart = Provider.of<CanalInfo>(context);
    _valor = _valorPart.getValorCanal;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: _imagenFader(_valor),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 8,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Placeholder(
                          color: Colors.transparent,
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Placeholder(
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 4,
                child: SizedBox(),
              ),
              Expanded(
                flex: 4,
                child: SliderTheme(
                  data: SliderThemeData(
                      activeTrackColor: Colors.transparent,
                      inactiveTrackColor: Colors.transparent,
                      disabledThumbColor: Colors.transparent,
                      activeTickMarkColor: Colors.transparent,
                      trackHeight: 10,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 0.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 0.0),
                      thumbColor: Colors.transparent),
                  child: Slider(
                    value: _valor.toDouble(),
                    max: 9,
                    min: 0,
                    onChanged: (value) {
                      setState(() {
                        print(value.toInt());
                        _valor = value.toInt();
                        _valorPart.setValorCanal = _valor;
                      });
                    },
                  ),
                ),
              ),
              /*  Expanded(
                flex: 2,
                child: SizedBox(),
              ), */
            ],
          ),
        ),
      ],
    );
  }

  Image _imagenFader(int i) {
    List<Image> lista = [];

    lista = [_p1, _p2, _p3, _p4, _p5, _p6, _p7, _p8, _p9, _p10];
    return lista[i];
  }
}
