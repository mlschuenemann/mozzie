import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/progress_point_provider.dart';


class LectureProvider with ChangeNotifier {
  int _lectureNumber = 1;
  int get lectureNumber => _lectureNumber;

  void incrementAndStoreLectureNumber(ProgressPointProvider progressPointProvider, String keyOfLecture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? currentLectureNumber = prefs.getInt('${keyOfLecture}Lecture');

    if ((currentLectureNumber ?? 1) < 5) {
      // Increment the lecture number by 1
      int updatedLectureNumber = (currentLectureNumber ?? 1) + 1;

      // Store the updated lecture number using SharedPreferences
      await prefs.setInt('${keyOfLecture}Lecture', updatedLectureNumber);
      _lectureNumber = updatedLectureNumber; // Update the local _lectureNumber
      notifyListeners();
    } else {
      // The lectureNumber is 5, so increment the progressPoint number and reset lectureNumber
      progressPointProvider.incrementAndStoreProgressPointNumber(keyOfLecture);
      resetLectureNumber(keyOfLecture);
    }
  }

  Future<void> retrieveLectureNumber(String keyOfLecture) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _lectureNumber = prefs.getInt('${keyOfLecture}Lecture') ?? 1;
    notifyListeners();
  }

  Future<void> resetLectureNumber(String keyOfLecture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int resetValue = 1;

    await prefs.setInt('${keyOfLecture}Lecture', resetValue);
    _lectureNumber = resetValue;
    notifyListeners();
  }

}