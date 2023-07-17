import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/screens/scale_question.dart';
import 'package:music_education/screens/single_letter_question.dart';
import 'package:music_education/screens/single_note_question.dart';
import 'package:music_education/data.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/lecture_provider.dart';

class ProgressPointProvider with ChangeNotifier {

  //ProgressPoint Number
  int _progressPointNumber = 1;
  int get progressPointNumber => _progressPointNumber;

  void incrementAndStoreProgressPointNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentProgressPoint = prefs.getInt('point');

    // Increment the lecture number by 1
    int updatedProgressPoint = (currentProgressPoint ?? 0) + 1;

    // Store the updated lecture number using SharedPreferences
    await prefs.setInt('point', updatedProgressPoint);
    notifyListeners();
  }

  Future<void> retrieveProgressPointNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _progressPointNumber = prefs.getInt('point') ?? 1;
    notifyListeners();
  }

  Future<void> resetProgressPointNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int reset = 1;

    await prefs.setInt('point', reset);
    _progressPointNumber = reset;
    notifyListeners();
  }

}