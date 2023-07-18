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
import 'package:music_education/components/level_card.dart';

class AchievmentCard extends StatelessWidget {
  const AchievmentCard({
    required this.imagePath,
    required this.text,
    required this.border,
    super.key,
  });

  final String text;
  final String imagePath;
  final bool border;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        height: 40,
        margin: EdgeInsets.only(left: 15, bottom: 10),
        decoration: BoxDecoration(
            color: SECONDARY, borderRadius: BorderRadius.circular(10),
          border: border ? Border.all(
            color: LIGHTBLUE,
            width: 2,
          ) : null,

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(imagePath),
            SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: PAR1,
            ),
          ],
        ));
  }
}
