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


class LectureProvider with ChangeNotifier {
  int _lectureNumber = 1;

  int get lectureNumber => _lectureNumber;


  void incrementAndStoreLectureNumber(ProgressPointProvider progressPointProvider) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentLectureNumber = prefs.getInt('lecture');

    if ((currentLectureNumber ?? 1) < 5) {
      // Increment the lecture number by 1
      int updatedLectureNumber = (currentLectureNumber ?? 1) + 1;

      // Store the updated lecture number using SharedPreferences
      await prefs.setInt('lecture', updatedLectureNumber);
      _lectureNumber = updatedLectureNumber; // Update the local _lectureNumber
      notifyListeners();
    } else {
      // The lectureNumber is 5, so increment the progressPoint number and reset lectureNumber
      progressPointProvider.incrementAndStoreProgressPointNumber();
      resetLectureNumber();
    }
  }


  Future<void> retrieveLectureNumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _lectureNumber = prefs.getInt('lecture') ?? 1;
    notifyListeners();
  }

  Future<void> resetLectureNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int resetValue = 1;

    await prefs.setInt('lecture', resetValue);
    _lectureNumber = resetValue;
    notifyListeners();
  }

}