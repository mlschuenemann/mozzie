import 'package:flutter/material.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/provider/score_provider.dart';
import 'package:music_education/screens/quizz.dart';
import 'package:music_education/data.dart';
import 'package:provider/provider.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

import '../provider/key_provider.dart';
import '../violinData.dart';
import '../tenorData.dart';

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet(
      {super.key, required this.result, required this.questionNumber});

  final bool result;
  final int questionNumber;

  @override
  Widget build(BuildContext context) {
    final scoreProvider = Provider.of<ScoreProvider>(context);
    final progressPointProvider = Provider.of<ProgressPointProvider>(context);
    final lectureProvider = Provider.of<LectureProvider>(context);
    final questionProvider = Provider.of<QuestionProvider>(context);

    final progressPointNumber = progressPointProvider.progressPointNumber;
    final lectureNumber = lectureProvider.lectureNumber;

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

    return Container(
      decoration: BoxDecoration(
        color: BACKGROUND,
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            result
                ? Text(
                    "Ausgezeichnet!",
                    style: CORRECT,
                  )
                : Text(
                    "Leider falsch",
                    style: FALSE,
                  ),
            result
                ? Text(
                    "Du hast die richtige Antwort ausgewählt.",
                    style: CORRECTS,
                  )
                : Text(
                    "Die richitge Antwort wäre gewesen: ${questionData?["note"] ?? questionData?["letter"] ?? ""}.",
                    style: FALSES,
                  ),
            GestureDetector(
              onTap: () async {
                if((questionNumber==12 && questionProvider.incorrectQuestions.isEmpty) ||
                    (questionProvider.revisionMode && questionProvider.incorrectQuestions.isEmpty)
                ){
                final player = AudioPlayer();
                await player.play(
                  AssetSource('sounds/fanfare.mp3'),
                );}
                Navigator.of(context).pop();
                result ? scoreProvider.addOneXP() : null;
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: result ? GREEN : Colors.red,
                ),
                child: const Text(
                  "Weiter",
                  style: PAR1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
