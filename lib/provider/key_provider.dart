import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';

// keys are: bass, violin, tenor

class KeyProvider with ChangeNotifier {
  String _key = "bass";
  String get key => _key;

  void changeKey(String newKey)  {
    _key = newKey;
    notifyListeners();
  }

  Color getKeyColor(){
    if(_key=="violin"){
      return ORANGE;
    } else if(_key=="tenor"){
      return LIGHTBLUE;
    } else {
      return LILA;
    }
  }


}