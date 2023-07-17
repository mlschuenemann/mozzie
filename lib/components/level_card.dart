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

import 'package:music_education/provider/lecture_provider.dart';
import 'package:music_education/components/progress_point.dart';
import 'package:music_education/provider/question_provider.dart';
import 'package:music_education/provider/progress_point_provider.dart';



class LevelCard extends StatelessWidget {
  const LevelCard({
    required this.levelText,
    required this.subText,
    super.key,
  });

  final String levelText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
      margin: EdgeInsets.only(top: 30, bottom: 30),
      height: 80,
      decoration: BoxDecoration(
        color: SECONDARY,
        border: Border(
          top: BorderSide(width: 2, color: SECONDARY),
          bottom: BorderSide(width: 2, color: SECONDARY),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            levelText,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sofia Sans',
                fontSize: 22,
                fontWeight: FontWeight.w700
            ),
          ),
          Text(
            subText,//,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sofia Sans',
                fontSize: 15,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
