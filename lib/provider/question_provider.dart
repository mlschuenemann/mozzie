import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class QuestionProvider with ChangeNotifier {
  // Question Number
  int get questionNumber => _questionNumber;
  int _questionNumber = 1;

  void nextQuestion() {
    if (_questionNumber < 13) {
      _questionNumber++;
    }
    notifyListeners();
  }

  void resetQuestionNumber() {
    _questionNumber = 1;
    notifyListeners();
  }

  final List<int> _incorrectQuestions = [];

  List<int> get incorrectQuestions => _incorrectQuestions;

  bool _revisionMode = false;
  bool get revisionMode => _revisionMode;

  void activateRevisionMode() {
    _revisionMode = true;
    //notifyListeners();
  }

  void deactivateRevisionMode() {
    _revisionMode = false;
    //notifyListeners();
  }

  void addIncorrectQuestion(int questionNumber) {
    _incorrectQuestions.add(questionNumber);
    notifyListeners();
  }

  void removeIncorrectQuestion() {
    _incorrectQuestions.remove(incorrectQuestions.first);
    //notifyListeners();
  }

  void setToIncorrectQuestion() {
    int incorrectQuestion = _incorrectQuestions.first;
    _questionNumber = incorrectQuestion;
  }

  void setQuestionNumber(int questionNumber){
    _questionNumber = questionNumber;
    notifyListeners();
  }

  bool _hasShownRevisionPage = false;
  bool get hasShownRevisionPage => _hasShownRevisionPage;

  void shownRevisionPage(){
    _hasShownRevisionPage = true;
  }

  void notShownRevisionPage(){
    _hasShownRevisionPage = false;
  }


}
