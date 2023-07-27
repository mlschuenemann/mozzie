import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/progress_point_provider.dart';

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