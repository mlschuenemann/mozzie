import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ScoreProvider with ChangeNotifier {

  // XP Points are the globally collected points over many lectures
  int _xpPoints = 0;

  int get xpPoints => _xpPoints;

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
    _xpPoints = prefs.getInt('score') ?? 0;
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