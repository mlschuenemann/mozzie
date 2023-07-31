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

import '../provider/key_provider.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.play();
    Future.delayed(Duration(milliseconds: 200), () {
      _controller.stop();
    });

    Provider.of<StreakProvider>(context, listen: false).init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionProvider>(context, listen: false);
    final lectureProvider = Provider.of<LectureProvider>(context);
    final scoreProvider = Provider.of<ScoreProvider>(context, listen: false);
    final progressProvider = Provider.of<ProgressPointProvider>(context, listen: false);

    final streakProvider = Provider.of<StreakProvider>(context);
    final keyProvider = Provider.of<KeyProvider>(context);

    return Scaffold(
      backgroundColor: BACKGROUND,
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SizedBox()),
          SvgPicture.asset("assets/instruments/group.svg"),
          ConfettiWidget(
            confettiController: _controller,
            //blastDirection: pi/2,
            gravity: 0.2,
            blastDirectionality: BlastDirectionality.explosive,
            emissionFrequency: 0.15,
            minBlastForce: 18,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Lektion abgeschlossen!",
            style: HEADING2,
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AchievmentCard(
                imagePath: "assets/icons/XP_icon.svg",
                text: "+ ${scoreProvider.score}",
                border: true,
              ),
              SizedBox(width: 10,),
              AchievmentCard(
                imagePath: "assets/icons/heart_icon.svg",
                text: "∞",
                border: true,
              ),
              SizedBox(width: 10,),
              AchievmentCard(
                imagePath: "assets/icons/flame_icon.svg",
                text: "${streakProvider.currentStreak}",
                border: true,
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          GestureDetector(
            onTap: () async {
                scoreProvider.updateXpPoints(scoreProvider.score);
                Navigator.of(context).pop();
                questionProvider.resetQuestionNumber();
                lectureProvider.incrementAndStoreLectureNumber(progressProvider, keyProvider.key);
                scoreProvider.resetScore();
                questionProvider.notShownRevisionPage();

              DateTime now = DateTime.now();
              streakProvider
                  .addActivity(DateTime(now.year, now.month, now.day));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              alignment: Alignment.center,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: GREEN,
              ),
              child: const Text(
                "Ich bleib dran",
                style: PAR1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
