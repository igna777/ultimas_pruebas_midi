import 'package:flutter/cupertino.dart';

import 'dart:math';

import 'package:pruebas_finales_midi/canales/clase_canal.dart';

class CanalInfo with ChangeNotifier {
  int _inicio = 0;
  int _iniciMedio = 64;
  int _inicioFinal = 127;

  int _inicioPNG = 0;
  int _inicioMedioPNG = 16;
  int _inicioFinalPNG = 31;

  String _inicioTextoCanal = 'P A R T   S E L E C T O R';

  List<Canal> _listCanales = [];

  bool _randomBoton = false;

  /* MidiDevice _device = null; */

  var _canalUno = Canal();
  var _canalDos = Canal();
  var _canalTres = Canal();
  var _canalCuatro = Canal();
  var _canalCinco = Canal();
  var _canalSeis = Canal();
  var _canalSiete = Canal();
  var _canalOcho = Canal();
  var _canalNueve = Canal();
  var _canalDiez = Canal();

  CanalInfo() {
    _listCanales.add(_canalUno);
    _listCanales.add(_canalDos);
    _listCanales.add(_canalTres);
    _listCanales.add(_canalCuatro);
    _listCanales.add(_canalCinco);
    _listCanales.add(_canalSeis);
    _listCanales.add(_canalSiete);
    _listCanales.add(_canalOcho);
    _listCanales.add(_canalNueve);
    _listCanales.add(_canalDiez);
    for (int i = 0; i < 10; i++) {
      _listCanales[i].setValorCanalKnobFader = _inicio;
      _listCanales[i].setValorCanalKnobFaderPNG = _inicioPNG;
      _listCanales[i].setValorCanalKnobFaderDos = _iniciMedio;
      _listCanales[i].setValorCanalKnobFaderPNGDos = _inicioMedioPNG;
      _listCanales[i].setValorCanalKnobFaderTres = _inicioFinal;
      _listCanales[i].setValorCanalKnobFaderPNGTres = _inicioFinalPNG;
      _listCanales[i].setTextoCanalClase = _inicioTextoCanal;
    }
  }

  /*  get getDevice {
    return _device;
  }

  set setDevice(MidiDevice device) {
    this._device = device;
    notifyListeners();
  } */

  //Canales ---------------------------------------------------------------//

  int _valorCanal = 0;

  get getValorCanal {
    return _valorCanal;
  }

  set setValorCanal(int valor) {
    this._valorCanal = valor;
    notifyListeners();
  }

  //----------------------------------------------------------------------//

  get getFaderKnob {
    return _listCanales[getValorCanal].getValorCanalKnobFader;
  }

  set setFaderKnob(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFader = valor;
    notifyListeners();
  }

  get getFaderKnobPng {
    return _listCanales[getValorCanal].getValorCanalKnobFaderPNG;
  }

  set setFaderKnobPng(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFaderPNG = valor;

    notifyListeners();
  }

//----------------------------------------------------------------------//

  get getFaderKnobDos {
    return _listCanales[getValorCanal].getValorCanalKnobFaderDos;
  }

  set setFaderKnobDos(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFaderDos = valor;
    notifyListeners();
  }

  get getFaderKnobPngDos {
    return _listCanales[getValorCanal].getValorCanalKnobFaderPNGDos;
  }

  set setFaderKnobPngDos(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFaderPNGDos = valor;
    notifyListeners();
  }

  //----------------------------------------------------------------------//

  get getFaderKnobTres {
    return _listCanales[getValorCanal].getValorCanalKnobFaderTres;
  }

  set setFaderKnobTres(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFaderTres = valor;
    notifyListeners();
  }

  get getFaderKnobPngTres {
    return _listCanales[getValorCanal].getValorCanalKnobFaderPNGTres;
  }

  set setFaderKnobPngTres(int valor) {
    this._listCanales[getValorCanal].setValorCanalKnobFaderPNGTres = valor;
    notifyListeners();
  }
  //----------------------------------------------------------------------//

  get getTextoCanal {
    return _listCanales[getValorCanal].getTextoCanalClase;
  }

  set setTextoCanal(String texto) {
    this._listCanales[getValorCanal].setTextoCanalClase = texto;
    notifyListeners();
  }

  //----------------------------------------------------------------------//

  set setRandom(bool valor) {
    List<int> _valoresKnobUno = [];

    this._randomBoton = valor;

    Random _random = Random();
    Random _randomDos = Random();
    Random _randomTres = Random();

    int _numeroRandom;
    int _numeroRandomDos;
    int _numeroRandomTres;

    if (_randomBoton) {
      _numeroRandom = _random.nextInt(128);

      int _contadorUno = 0;
      for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 4; j++) {
          if (_contadorUno == _numeroRandom) {
            print('HOLA SOY UN RANDOM ' + _numeroRandom.toString());
            print('HOLA SOY EL NUMERO DE I ' + i.toString());
            print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
            setFaderKnob = _numeroRandom;
            setFaderKnobPng = i;

            i = 33;
            j = 5;
            _contadorUno = 0;
          } else {
            _contadorUno++;
            // print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
          }
          //print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
        }

        notifyListeners();
      }
    }
    if (_randomBoton) {
      _numeroRandomDos = _randomDos.nextInt(128);

      int _contadorUno = 0;
      for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 4; j++) {
          if (_contadorUno == _numeroRandomDos) {
            print('HOLA SOY UN RANDOM ' + _numeroRandomDos.toString());
            print('HOLA SOY EL NUMERO DE I ' + i.toString());
            print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
            setFaderKnobDos = _numeroRandomDos;
            setFaderKnobPngDos = i;

            i = 33;
            j = 5;
            _contadorUno = 0;
          } else {
            _contadorUno++;
            // print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
          }
          //print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
        }

        notifyListeners();
      }
    }
    if (_randomBoton) {
      _numeroRandomTres = _randomTres.nextInt(128);

      int _contadorUno = 0;
      for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 4; j++) {
          if (_contadorUno == _numeroRandomTres) {
            print('HOLA SOY UN RANDOM ' + _numeroRandomTres.toString());
            print('HOLA SOY EL NUMERO DE I ' + i.toString());
            print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
            setFaderKnobTres = _numeroRandomTres;
            setFaderKnobPngTres = i;

            i = 33;
            j = 5;
            _contadorUno = 0;
          } else {
            _contadorUno++;
            // print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
          }
          //print('HOLA SOY UN CONTADOR ' + _contadorUno.toString());
        }

        notifyListeners();
      }
    }
  }

  get getRandom {
    return _randomBoton;
  }
}
