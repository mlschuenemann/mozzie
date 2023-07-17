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


}