import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/quizz.dart';
import 'package:music_education/screens/question_pages/scale_question.dart';
import 'package:music_education/screens/question_pages/single_letter_question.dart';
import 'package:music_education/screens/question_pages/single_note_question.dart';
import 'package:music_education/data/data.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/lecture_provider.dart';

class ProgressPointProvider with ChangeNotifier {

  //ProgressPoint Number
  int _progressPointNumber = 1;
  int get progressPointNumber => _progressPointNumber;

  void incrementAndStoreProgressPointNumber(String keyOfPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentProgressPoint = prefs.getInt('${keyOfPoint}Point');

    // Increment the lecture number by 1
    int updatedProgressPoint = (currentProgressPoint ?? 1) + 1;

    // Store the updated lecture number using SharedPreferences
    await prefs.setInt('${keyOfPoint}Point', updatedProgressPoint);
    _progressPointNumber = updatedProgressPoint;
    notifyListeners();
  }

  Future<void> retrieveProgressPointNumber(String keyOfPoint) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _progressPointNumber = prefs.getInt('${keyOfPoint}Point') ?? 1;
    notifyListeners();
  }

  Future<void> resetProgressPointNumber(int resetValue, String keyOfPoint) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int reset = resetValue;

    await prefs.setInt('${keyOfPoint}Point', reset);
    _progressPointNumber = reset;
    notifyListeners();
  }


}