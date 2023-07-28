import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/components/main_cards/note_name_card.dart';
import 'package:music_education/components/choice_cards/note_choice_card.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/screens/question_pages/scale_question.dart';
import 'package:music_education/screens/question_pages/single_letter_question.dart';
import 'package:music_education/screens/question_pages/single_note_question.dart';
import 'package:music_education/data.dart';
import 'package:music_education/screens/revision_page.dart';
import 'package:music_education/screens/violinData.dart';
import 'package:provider/provider.dart';
import 'package:music_education/screens/result_page.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';

import '../provider/key_provider.dart';
import '../tenorData.dart';

class Quizz extends StatefulWidget {
  Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  bool hasShownRevisionPage = false;

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context);
    final questionNumber = questionProvider.questionNumber;

    final lectureProvider = Provider.of<LectureProvider>(context);
    final lectureNumber = lectureProvider.lectureNumber;

    final progressPointProvider = Provider.of<ProgressPointProvider>(context);
    final progressPointNumber = progressPointProvider.progressPointNumber;

    final keyProvider = Provider.of<KeyProvider>(context);

    Map<String, String>? questionData;
    if(keyProvider.key=="bass"){
      questionData =
      bassData[progressPointNumber]?[lectureNumber]?[questionNumber];
    } else if(keyProvider.key=="violin"){
      questionData =
      violinData[progressPointNumber]?[lectureNumber]?[questionNumber];
    } else if(keyProvider.key=="tenor"){
      questionData =
      tenorData[progressPointNumber]?[lectureNumber]?[questionNumber];
    }


    final questionType = questionData?["questionType"] ?? "";
    final note = questionData?["note"] ?? "";
    final letter = questionData?["letter"] ?? "";
    final firstNote = questionData?["firstNote"] ?? "";
    final secondNote = questionData?["secondNote"] ?? "";
    final thirdNote = questionData?["thirdNote"] ?? "";
    final firstChoice = questionData?["firstChoice"] ?? "";
    final secondChoice = questionData?["secondChoice"] ?? "";
    final thirdChoice = questionData?["thirdChoice"] ?? "";
    final fourthChoice = questionData?["fourthChoice"] ?? "";
    final instrument = questionData?["instrument"] ?? "";

    Widget questionWidget;
    if (questionType == "single_note") {
      questionWidget = SingleNoteQuestion(
        firstChoice: firstChoice,
        secondChoice: secondChoice,
        thirdChoice: thirdChoice,
        fourthChoice: fourthChoice,
        instrument: instrument,
        note: note,
        questionNumber: questionNumber,
        lectureNumber: lectureNumber,
        progressPointNumber: progressPointNumber,
      );
    } else if (questionType == "single_letter") {
      questionWidget = SingleLetterQuestion(
        firstChoice: firstChoice,
        secondChoice: secondChoice,
        thirdChoice: thirdChoice,
        fourthChoice: fourthChoice,
        instrument: instrument,
        letter: letter,
        questionNumber: questionNumber,
        lectureNumber: lectureNumber,
        progressPointNumber: progressPointNumber,
      );
    } else if (questionType == "scale") {
      questionWidget = ScaleQuestion(
        firstChoice: firstChoice,
        secondChoice: secondChoice,
        thirdChoice: thirdChoice,
        fourthChoice: fourthChoice,
        instrument: instrument,
        firstNote: firstNote,
        secondNote: secondNote,
        thirdNote: thirdNote,
        questionNumber: questionNumber,
        lectureNumber: lectureNumber,
        progressPointNumber: progressPointNumber,
      );
    } else {
      questionWidget =
          Container(); // Placeholder widget if no question type matches
    }

    ///Beware the number!!
    if (questionNumber >= 13 && questionProvider.incorrectQuestions.isEmpty) {
      questionProvider.deactivateRevisionMode();
      // Display the result page
      return ResultPage(); // Replace ResultPage with the actual result page widget
    } else if (questionNumber >= 13 &&
        questionProvider.incorrectQuestions.isNotEmpty) {

      if (questionProvider.hasShownRevisionPage==false) {
        return RevisionPage();

      }else{
        questionProvider.activateRevisionMode();
        questionProvider.setToIncorrectQuestion();
        questionProvider.removeIncorrectQuestion();
      }
    }

    double greenContainerWidth = 0.0;

    return Scaffold(
      backgroundColor: BACKGROUND,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              final greyContainerWidth = constraints.maxWidth;
              if (questionNumber <= 12) {
                greenContainerWidth =
                    (questionNumber / 18) * greyContainerWidth;
              } else {
                greenContainerWidth = greyContainerWidth;
              }
              return Container(
                padding: const EdgeInsets.only(
                    left: 15, right: 45, top: 50, bottom: 20),
                child: Row(
                  children: [
                    IconButton(
                        icon: questionProvider.revisionMode == false
                            ? Icon(Icons.close)
                            : Icon(Icons.refresh_rounded, color: Colors.yellow, size: 30,),
                        onPressed: () {
                          questionProvider.revisionMode == false
                              ? Navigator.of(context).pop()
                              : null;
                        },
                        color: Color(0xFF888D8F)),
                    const SizedBox(width: 15),
                    if (questionProvider.revisionMode == false)
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: SECONDARY,
                              ),
                              height: 25,
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: GREEN,
                              ),
                              height: 25,
                              width: greenContainerWidth,
                            ),
                          ],
                        ),
                      ),
                    if (questionProvider.revisionMode == true)
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 25,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.yellow),
                          child: Text(
                            "Wiederholung",
                            style: HEADING3,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
          Expanded(child: questionWidget)
        ],
      ),
    );
  }
}
