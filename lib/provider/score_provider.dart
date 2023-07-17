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


class ScoreProvider with ChangeNotifier {

  // XP Points are the globally collected points over many lectures
  int? _xpPoints;

  int? get xpPoints => _xpPoints;

  Future<void> updateXpPoints(int score) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int currentScore = prefs.getInt('score') ?? 0;

    // Increment the appoints by the score
    int updatedScore = currentScore + score;

    // Store the updated score using SharedPreferences
    await prefs.setInt('score', updatedScore);
    _xpPoints = updatedScore;
    notifyListeners();
  }


  // Retrieve the score value using SharedPreferences
  Future<void> retrieveScore() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _xpPoints = prefs.getInt('score');
    notifyListeners();
  }


  //Score is the result of one of the quizzes that is ultimately added to the XP Points after one quizz
  //Score Tracker
  int _score = 0;
  int get score => _score;

  void addOneXP() {
    _score++;
    notifyListeners();
  }

  void resetScore() async {
    _score = 0;
    notifyListeners();
  }

}