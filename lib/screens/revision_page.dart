import 'dart:math';
import 'package:music_education/components/achievement_card.dart';
import 'package:music_education/provider/progress_point_provider.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_education/constants/colors.dart';
import 'package:music_education/constants/textstyle.dart';
import 'package:music_education/quizz.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';
import 'package:music_education/provider/score_provider.dart';
import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/provider/streak_provider.dart';
import 'package:audioplayers/audioplayers.dart';

class RevisionPage extends StatelessWidget {
  const RevisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: BACKGROUND,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SizedBox()),
          Icon(Icons.refresh_rounded,size: 100, color: Colors.yellow,),
          SizedBox(
            height: 20,
          ),
          Text(
            "Wiederhole",
            style: HEADING2,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "ein paar Noten!",
            style: HEADING2,
          ),
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
              questionProvider.shownRevisionPage();
              questionProvider.setQuestionNumber(13);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.yellow,
              ),
              child: const Text(
                "Weiter",
                style: PAR1BLACK,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
